## 参考链接
http://pillow-cn.readthedocs.org/zh_CN/latest/index.html

## 简单安装
```shell
$ easy_install Pillow
```

## 外部库
<p>Pillow 的许多功能需要外部库的支持:</p>
<ul class="simple">
<li><strong>libjpeg</strong> 提供 JPEG 相关功能<ul>
<li>Pillow 已经在这些版本测试过：versions <strong>6b</strong>, <strong>8</strong>, and <strong>9</strong></li>
</ul>
</li>
<li><strong>zlib</strong> 提供压缩 PNG 功能</li>
<li><strong>libtiff</strong> 提供 group4 tiff 功能<ul>
<li>Pillow 已经在这些版本测试过：versions <strong>3.x</strong> and <strong>4.0</strong></li>
</ul>
</li>
<li><strong>libfreetype</strong> 提供类型相关服务</li>
<li><strong>littlecms</strong> provides color management<ul>
<li>Pillow  2.2.1 以及更低版本使用 liblcms1, Pillow 2.3.0 以及更高版本使用 liblcms2. 在这些版本测试通过： <strong>1.19</strong> and <strong>2.2</strong></li>
</ul>
</li>
<li><strong>libwebp</strong> 提供 webp 相关功能<ul>
<li>Pillow已经在这些版本测试过： version <strong>0.1.3</strong> 不能读取透明webp图像， Versions <strong>0.3.0</strong> and <strong>0.4.0</strong> 支持透明。</li>
</ul>
</li>
<li><strong>tcl/tk</strong> 提供 tkinter bitmap and photo images 的支持</li>
<li><strong>openjpeg</strong> 提供 JPEG 2000 功能<ul>
<li>Pillow 在这些版本测试通过： <strong>2.0.0</strong></li>
</ul>
</li>
</ul>

 在 Ubuntu 10.04 LTS 安装依赖包:
```shell
 $ sudo apt-get install libtiff4-dev libjpeg62-dev zlib1g-dev \
     libfreetype6-dev tcl8.5-dev tk8.5-dev python-tk
 ```

 在 Ubuntu 12.04 LTS 或者 Raspian Wheezy 7.0 安装依赖包:
```shell
 $ sudo apt-get install libtiff4-dev libjpeg8-dev zlib1g-dev \
     libfreetype6-dev liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk
```