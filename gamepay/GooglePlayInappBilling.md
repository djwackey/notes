# Google Play支付订单验证 #
#### APP发布后台 ####
<pre>
<b>Google Play App Publish:</b>
https://play.google.com/apps/publish
1.账户登录
2.添加新应用
3.授权项目API
4.关联项目
</pre>

#### 开发者控制台 ####
<pre>
<b>Google Developers Console</b>
https://console.developers.google.com
1.账号登陆
2.创建项目
3.开启Google Play Android Developer API
4.接受服务协议
5.新增凭证
	(1) API和验证 -> 新增凭证
	    OAuth同意画面(电子邮件地址有默认值，填写商品名称)
	(2) 建立Client ID，应用程式选择：网络应用程式
	(3) 获取Client ID，Client Secrert和Redirect Uri
6.生成refresh token
	(1) 构造以下URI：
	    https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com/auth/androidpublisher&response_type=code&access_type=offline&redirect_uri=...&client_id=...
	(2) 选择允许访问
	(3) 浏览器将重定向到你的重定向URI，其中包括code参数，截取其后的参数值：
	    类似：4/eWdxD7b-YSQ5CNNb-c2iI83KQx19.wp6198ti5Zc7dJ3UXOl0T3aRLxQmbwI
	(4) 通过code参数值构造数据：
		grant_type=authorization_code
		code={the code from the previous step}
		client_id={the client ID token created in the APIs Console}
		client_secret={the client secret corresponding to the client ID}
		redirect_uri={the URI registered with the client ID}
	    将数据POST：https://accounts.google.com/o/oauth2/token
	    成功的响应包含JSON格式的数据：
	    {
		"access_token": "ya29.ZStBkRnGyZ2mUYOLgls7QVBxOg82XhBCFo8UIT5gM",
		"token_type": "Bearer",
		"expires_in": 3600,
		"refresh_token": "1/zaaHNytlC3SEBX7F2cfrHcqJEa3KoAHYeXES6nmho"
	    }
7.使用refresh_token获取access_token
	每一个access token的有效期仅一段时间，之后access token失效，因此需要获取新的access token，通过refresh token可以获取一个新的access token，做法如下：
	构造数据：
	grant_type=refresh_token
	client_id={the client ID token created in the APIs Console}
	client_secret={the client secret corresponding to the client ID}
	refresh_token={the refresh token from the previous step}
	将数据POST：https://accounts.google.com/o/oauth2/token
	成功的响应包括JSON格式的数据：
	{
	"access_token": "ya29.AHES3ZQ_MbZCwac9TBWIbjW5ilJkXvLTeSl530Na2",
	"token_type": "Bearer",
	"expires_in": 3600,
	}
8.使用access token
	通过access token可以调用API，如下：
	https://www.googleapis.com/androidpublisher/v1/...?access_token=...

参考文档：https://developers.google.com/android-publisher/authorization
</pre>

#### 验证订单 ####
<pre>
订单验证URL：
GOOGLE_VERIFY_URL = "https://www.googleapis.com/androidpublisher/v2/applications/{packageName}/purchases/products/{productId}/tokens/{token}"

<b>Python 代码样例：</b>
<code>base_url = GOOGLE_VERIFY_URL.format(packageName=packageName, productId=productId, token=token)
def check_purchase(base_url, access_token, bill_id):
    """ 检验购买商品
    """
    try:
        resp = requests.get(base_url, params=dict(access_token=access_token,), timeout=5)
        if resp.status_code == 200:
            jdata = resp.json()
            if 'purchaseState' not in jdata:
                return False

            if jdata['purchaseState'] == 0 and str(jdata['developerPayload']) == str(bill_id):
                return True
    except Exception, e:
        print e
    return False
</code>
注意：
1.构造base_url中的token为内购商品完成后，提供给用户设备的token
2.access_token为通过refresh_token得到的数值
参考文档：https://developers.google.com/android-publisher/api-ref/purchases/products/get
</pre>