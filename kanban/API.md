**目录**
- 登录
- 注销
- 看板
    - [我创建的看板](#TI-1)
    - [我加入的看板](#TI-2)
    - [我关闭的看板](#TI-3)
    - [最近我访问的看板](#TI-4)
    - [指派给我的任务](#TI-5)
    - [新建看板](#TI-6)
    - [编辑看板](#TI-7)
    - [打开/关闭看板](#TI-8)
    - [删除看板](#TI-9)
    - [看板详情](#TI-10)
- 成员
    - [看板成员列表](#TI-11)
    - [加入看板](#TI-12)
    - [退出看板](#TI-13)
    - [邀请成员](#TI-14)
    - [成员详情](TI-13)
    - [移除成员](TI-14)
    - [同意/拒绝加入看板](TI-15)
    - [获取好友列表](TI-16)
- 列表
    - [看板列表](TI-17)
    - [新建列表](TI-18)
    - [编辑列表](TI-19)
    - [删除列表](TI-20)
- 任务
    - [今日工作情况](TI-21)
    - [任务列表](TI-22)
    - [新建任务](TI-23)
    - [编辑任务](TI-24)
    - [归档任务](TI-25)
    - [任务详情](TI-26)
- 评论
    - [任务评论](TI-27)
    - [新建评论](TI-28)
- 动态
    - [看板动态](TI-29)
    - [任务动态](TI-30)
- 工作日志
    - [工作日志列表](TI-31)
    - [编辑工作日志](TI-32)
    - [删除工作日志](TI-33)
    - [工作日志详情](TI-34)

---
**版本修订历史**
---

| 序号 | 修订内容 | 修订人 | 修订日期 | 版本 | 备注 |
| :---: | :---: | :---: | :---: | :---: | :---: |
| 1 | 初始化文档 | 闫飞 | 2016-12-22 | 1.0 | | |

---
**HTTP方法定义：**
- GET - 获取某项资源的信息
- POST - 新建某项资源的信息
- PUT - 修改某项资源的信息
- DELETE - 删除某项资源的信息

**性能需求**
---

| 指标名称 | 要求 | 优先级 | 备注 |
| :---: | :---: | :---: | :---: |
| 响应时间 | 250 ms | 1 | |
| 请求成功率 | 99% | 2 | |
| TPS |	在满足预期要求的情况下服务器状态稳定，单台服务器TPS要求在1000左右 | 3 | |	 
| 资源使用率 | 要求在TPS正常幅度的情况下资源使用率幅度平稳，服务器状态平稳 | 3 | 要求接口的内部实现不能占用太多资源 |
| 数据库死锁 | 0，要求接口在使用过程中不会造成数据库死锁 | 1 | |
| CPU限制 | 要求接口在使用过程中不会出现大量的计算 | 3 | |
| 内存 | 要求接口在使用过程中不会出现内存大量消耗的情况 | 3 | | |

**错误代码定义**
---

**接口说明**
---
**功能说明**：登录

**请求地址**：/api/v1/login

**请求方式**：POST

**请求参数**：

**返回结果**：

    {
        "code": 0,
        "msg": "ok",
        "data": {
            # 身份
            "identities": [
                # 服务方（若无，则没有该身份，默认选中）
                "dev": {
                    "name": "",    # 服务方名称
                    "avatar": ""   # 头像
                },
                # 需求方（若无，则没有该身份）
                "req": {
                    "name": "",    # 需求方名称
                    "avatar": ""   # 头像
                },
                # 团队
                "team": {
                    "name": "",    # 团队名称
                    "avatar": ""   # 头像
                }
            ]
        }
    }

**功能说明**：注销

**请求地址**：/api/v1/logout

**请求方式**：POST

**请求参数**：

**返回结果**：

    {
        "code": 0,
        "msg": "ok",
        "data": {}
    }
`备注：调用主站的注销接口`

---

**功能说明**：我创建的看板

**请求地址**：/api/v1/boards?creator={creator}

**请求方式**：GET

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| creator | int | 是 | 所属用户编号 |
| page_no | int | 否 | 页数，默认第一页 |
| page_size | int | 否 | 单页尺寸，默认50条 |

**返回结果**：

    # 返回所有该用户创建的看板
    {
        "code": 0,
        "msg": "ok",
        "data": {
            "pagination": {
                "current_page": "1",    # 当前页
                "size_per_page": "50",  # 单页记录数
                "page_count": "10",     # 总页数
                "total_count": "500"    # 总记录数
            },
            "boards": [
                {
                    "uuid": "xyalqihfha",      # 看板标识
                    "name": "新手指引看板",     # 看板名称
                    "thumbnail": "http://192.168.1.1/board/1.jpg",  # 看板配图
                    "unfinished_task_count": "5",  # 未完成任务数量
                    "has_done_task_count": "12"    # 已完成任务数量
                }
            ]
        }
    }
`备注：按照看板创建时间倒序排列`

**功能说明**：我加入的看板

**请求地址**：/api/v1/boards?joined_user={user_id}

**请求方式**：GET

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| page_no | int | 否 | 页数，默认第一页 |
| page_size | int | 否 | 单页尺寸，默认50条 |
| joined_user | int | 是 | 加入看板的用户编号 |

**返回结果**：

    # 返回所有该用户加入的看板（包括激活和关闭）
    {
        "code": 0,
        "msg": "ok",
        "data": {
            "pagination": {
                "current_page": "1",    # 当前页
                "size_per_page": "50",  # 单页记录数
                "page_count": "10",     # 总页数
                "total_count": "500"    # 总记录数
            },
            "boards": [
                {
                    "uuid": "xyalqihfha",      # 看板标识
                    "name": "沃客家族看板",     # 看板名称
                    "status": "1",             # 看板状态（1-激活，0-关闭）
                    "creator": "小王",         # 看板创建者昵称
                    "avatar": "http://192.168.1.1/avatars/4.jpg",  # 看板创建者头像
                    "thumbnail": "http://192.168.1.1/board/1.jpg"  # 看板配图
                }
            ]
        }
    }

**功能说明**：我关闭的看板

**请求地址**：/api/v1/boards?operator={operator}&status=0

**请求方式**：GET

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| page_no | int | 否 | 页数，默认第一页 |
| page_size | int | 否 | 单页尺寸，默认50条 |
| operator | int | 是 | 操作用户编号 |
| status | int | 是 | 看板状态，0-关闭的，1-打开的 |

**返回结果**：

    {
        "code": 0,
        "msg": "ok",
        "data": {
            "pagination": {
                "current_page": "1",    # 当前页
                "size_per_page": "50",  # 单页记录数
                "page_count": "10",     # 总页数
                "total_count": "500"    # 总记录数
            },
            "boards": [
                {
                    "uuid": "d2db3d50ae0ab96f",
                    "name": "新手指引看板",
                    "thumbnail": "http://192.168.1.1/board/1.jpg"  # 看板配图
                }
            ]
        }
    }

**功能说明**：最近我访问的看板

**请求地址**：/api/v1/boards?user_id={user_id}&recently=1

**请求方式**：GET

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| page_no | int | 否 | 页数，默认第一页 |
| page_size | int | 否 | 单页尺寸，默认50条 |
| user_id | int | 是 | 用户编号 |
| recently | int | 是 | 最近访问标识，值恒为1 |

**返回结果**：

    {
        "code": "0",
        "msg": "ok",
        "data": {
            "pagination": {
                "current_page": "1",    # 当前页
                "size_per_page": "50",  # 单页记录数
                "page_count": "10",     # 总页数
                "total_count": "500"    # 总记录数
            },
            # 我最近进入的5个看板的配图和名称
            "boards": [
                {
                    "uuid": "d2db3d50ae0ab96f",  # 看板标识
                    "name": "小游戏的设计",       # 看板名称
                    "thumbnail": "http://192.168.1.1/board/1.jpg"  # 看板配图
                }
            ]
        }
    }

**功能说明**：指派给我的任务

**请求地址**：/api/v1/tasks

**请求方式**：GET

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| page_no | int | 否 | 页数，默认第一页 |
| page_size | int | 否 | 单页尺寸，默认50条 |
| assigned_to | int | 是 | 被指派的用户编号 |

**返回结果**：

    {
        "code": 0,
        "msg": "ok",
        "data": {
            "pagination": {
                "current_page": "1",    # 当前页
                "size_per_page": "50",  # 单页记录数
                "page_count": "10",     # 总页数
                "total_count": "500"    # 总记录数
            },
            "tasks": [
                {
                    "task_uuid": "f189ef21564d434a",          # 任务标识
                    "task_name": "放大手机话费",               # 任务名称
                    "board_uuid": "f189ef21564d434a",   # 看板标识
                    "board_name": "你就是我的天使",            # 看板名称
                    "board_icon": "http://192.168.1.1/1.jpg"  # 看板图标
                }
            ]
        }
    }

**功能说明**：新建看板

**请求地址**：/api/v1/board

**请求方式**：POST

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| name | string | 是 | 看板名称，2-50个字符 |
| desc | string | 是 | 看板描述，500个字符以内 |
| thumbnail | string | 是 | 看板配图，图片的相对URL地址 |

**返回结果**：

    # 操作成功
    {
        "code": 0,
        "msg": "ok",
        "data": {
            "uuid": "d2db3d50ae0ab96f"
        }
    }

**功能说明**：编辑看板

**请求地址**：/api/v1/board/{uuid}

**请求方式**：PUT

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| name | string | 是 | 看板名称 |
| description | string | 否 | 看板描述 |

**返回结果**：

    # 操作成功
    {
        "code": 0,
        "msg": "ok",
        "data": {}
    }

**功能说明**：打开/关闭看板

**请求地址**：/api/v1/board/{uuid}

**请求方式**：PUT

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| status | int | 是 | 看板状态，0-关闭，1-激活 |

**返回结果**：

    # 操作成功
    {
        "code": 0,
        "msg": "ok",
        "data": {}
    }


**功能说明**：删除看板

**请求地址**：/api/v1/board/{uuid}

uuid：看板资源标识，如：d2db3d50ae0ab96f

**请求方式**：DELETE

**请求参数**：无

**返回结果**：

    # 操作成功
    {
        "code": 0,
        "msg": "ok",
        "data": {}
    }

**功能说明**：看板详情

**请求地址**：/api/v1/board/{uuid}

**请求方式**：GET

**请求参数**：无

**返回结果**：

    # 操作成功
    {
        "code": 0,
        "msg": "ok",
        "data": {
            "name": "WEB前端开发",     # 看板名称
            "desc": "主要技术：HTML",  # 看板描述
            "thumbnail": ""           # 看板配图
        }
    }

---

**功能说明**：看板成员列表

**请求地址**：/api/v1/board/{uuid}/members

**请求方式**：GET

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| page_no | int | 否 | 页数，默认第一页 |
| page_size | int | 否 | 单页尺寸，默认50条 |

**返回结果**：

    {
        "code": 0,
        "msg": "ok",
        "data": {
            "pagination": {
                "current_page": "1",    # 当前页
                "size_per_page": "50",  # 单页记录数
                "page_count": "10",     # 总页数
                "total_count": "500"    # 总记录数
            },
            "members": [
                {
                    "username": "小明",  # 昵称
                    "avatar": "http://xxx",        # 头像
                    "unfinished_task_count": "5",  # 未完成任务数量
                    "has_done_task_count": "12"    # 已完成任务数量
                }
            ]
        }
    }

**功能说明**：加入看板

**请求地址**：/api/v1/board/{uuid}/member/{uuid}

**请求方式**：POST

**请求参数**：无

**返回结果**：

    # 操作成功
    {
        "code": 0,
        "msg": "ok",
        "data": {}
    }
`备注：用户主动加入看板`

**功能说明**：退出看板

**请求地址**：/api/v1/board/{uuid}/member/{uuid}

**请求方式**：DELETE

**请求参数**：无

**返回结果**：

    # 操作成功
    {
        "code": 0,
        "msg": "ok",
        "data": {}
    }
`备注：用户主动退出看板`

**功能说明**：邀请成员

**请求地址**：/api/v1/board/{uuid}/member

**请求方式**：POST

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| invitor | int | 否 | 邀请人 |
| invitee | int | 是 | 被邀请人 |
| phone | string | 否 | 手机号 |
| email | string | 否 | 电子邮箱 |
| invite_type | int | 是 | 邀请方式：0-用户编号方式，1-手机号方式，2-电子邮箱方式 |

**返回结果**：

    # 操作成功
    {
        "code": 0,
        "msg": "ok",
        "data": {}
    }
`备注：手机号和电子邮箱方式，邀请后需发送短信和邮件通知对方`

**功能说明**：成员详情

**请求地址**：/api/v1/board/member/{uuid}

**请求方式**：GET

**请求参数**：

**返回结果**：

    {
        "code": 0,
        "msg": "ok",
        "data": {
            "username": "小明",  # 昵称
            "avatar": "http://xxx",        # 头像
            "unfinished_task_count": "5",  # 未完成任务数量
            "has_done_task_count": "12"    # 已完成任务数量
        }
    }

**功能说明**：移除成员

**请求地址**：/api/v1/board/{board_uuid}/member/{member_uuid}

**请求方式**：DELETE

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| operator | int | 是 | 操作人员编号 |

**返回结果**：

    # 操作成功
    {
        "code": 0,
        "msg": "ok",
        "data": {}
    }
`备注：用户被某个操作人移出看板，移除成员后任务不删除，指派人全部变为未指派。`

**功能说明**：同意/拒绝加入看板

**请求地址**：/api/v1/board/{board_uuid}/member/{member_uuid}

**请求方式**：PUT

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| status | int | 是 | 1-同意，2-拒绝 |

**返回结果**：

    # 操作成功
    {
        "code": 0,
        "msg": "ok",
        "data": {}
    }

**功能说明**：获取好友列表

**请求地址**：/api/v1/friends

**请求方式**：GET

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| user_id | int | 是 | 用户编号 |

**返回结果**：

    {
        "code": 0,
        "msg": "ok",
        "data": {
            "friends": [
                {
                    "name": "小王",     # 好友名称
                    "avatar": "",       # 好友头像
                    "invite_status": "0" # 邀请状态（0-未邀请或对方拒绝邀请，1-已邀请，对方未做回复，2-已加入，对方同意加入看板）
                }
            ]
        }
    }

---

**功能说明**：看板列表

**请求地址**：/api/v1/board/states?board_id={uuid}

**请求方式**：GET

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| board_id | string | 是 | 看板标识 |

**返回结果**：

    {
        "code": 0,
        "msg": "ok",
        "data": {
            "states": [
                {
                    "uuid": "1e3aab9f5ad9cdd8",  # 列表标识
                    "name": "待处理任务列表",     # 列表名称
                    "seqno": "2"                 # 排列序号
                }
            ]
        }
    }

**功能说明**：新建看板列表

**请求地址**：/api/v1/board/state

**请求方式**：POST

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| name | string | 是 | 看板列表名称 |
| seqno | int | 是 | 看板列表排序 |

**返回结果**：

    # 操作成功
    {
        "code": 0,
        "msg": "ok",
        "data": {}
    }

**功能说明**：编辑看板列表

**请求地址**：/api/v1/board/state/{uuid}

**请求方式**：PUT

**请求参数**:

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| name | string | 是 | 看板列表名称 |
| seqno | int | 是 | 看板列表排序 |

**返回结果**：

    # 操作成功
    {
        "code": 0,
        "msg": "ok",
        "data": {}
    }

**功能说明**：删除看板列表

**请求地址**：/api/v1/board/state/{uuid}

uuid：看板列表资源标识，如：1e3aab9f5ad9cdd8

**请求方式**：DELETE

**请求参数**：无

**返回结果**：

    # 操作成功
    {
        "code": 0,
        "msg": "ok",
        "data": {}
    }

---

**功能说明**：今日工作情况

**请求地址**：/api/v1/task/case

**请求方式**：GET

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| user_id | int | 是 | 用户编号 |

**返回结果**：

    # 返回当天该用户的工作情况
    {
        "code": "0",
        "msg": "ok",
        "data": {
            "new_task_count": "23",       # 新任务数量
            "finished_task_count": "20",  # 完成任务数量
            "assigned_task_count": "20",  # 收到任务数量
            "record_duration": "5小时20分钟" # 上传的工作日志时长
        }
    }

**功能说明**：任务列表

**请求地址**：/api/v1/tasks

**请求方式**：GET

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| page_no | int | 否 | 页数，默认第一页 |
| page_size | int | 否 | 单页尺寸，默认50条 |
| assigned_to | int | 是 | 被指派的用户编号 |
| board_id | int | 否 | 看板编号 |
| state_id | int | 否 | 列表编号 |
| priority | int | 否 | 优先级 |
| status | int | 否 | 任务状态 0-未完成，1-已完成 |
| order_by | string | 否 | assigned_at-指派日期，end_at-截至日期 |
| keyword | string | 否 | 关键字搜索 |

**返回结果**：

    {
        "code": 0,
        "msg": "ok",
        "data": {
            "pagination": {
                "current_page": "1",    # 当前页
                "size_per_page": "50",  # 单页记录数
                "page_count": "10",     # 总页数
                "total_count": "500"    # 总记录数
            },
            "tasks": [
                {
                    "task_uuid": "f189ef21564d434a",          # 任务标识
                    "task_name": "放大手机话费",               # 任务名称
                    "board_uuid": "f189ef21564d434a",  # 看板标识
                    "board_name": "你就是我的天使",            # 看板名称
                    "board_icon": "http://192.168.1.1/1.jpg"  # 看板图标
                    "username": "小王",  # 用户昵称
                    "avatar": "",  # 用户头像
                    "end_at": "",  # 截至日期
                    "card_type": "5",  # 任务类型
                    "priority": "1",  # 优先级
                    "status": "1"  # 已完成
                }
            ]
        }
    }

**功能说明**：新建任务

**请求地址**：/api/v1/board/state/card

**请求方式**：POST

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| name | string | 是 | 任务名称 |
| end_at | string | 是 | 截至日期，格式：2016-12-12 |
| priority | int | 是 | 优先级 |
| card_type | int | 是 | 任务类型 |
| assigned_to | int | 是 | 委派人 |
| description | string | 是 | 任务描述 |

**返回结果**：

    {
        "code": 0,
        "msg": "ok",
        "data": {}
    }

**功能说明**：编辑任务

**请求地址**：/api/v1/board/state/card/{uuid}

**请求方式**：PUT

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| name | string | 否 | 任务名称 |
| end_at | string | 否 | 截至日期，格式：2016-12-12 |
| priority | int | 否 | 优先级 |
| card_type | int | 否 | 任务类型 |
| assigned_to | int | 否 | 委派人 |
| description | string | 否 | 任务描述 |

**返回结果**：

    {
        "code": 0,
        "msg": "ok",
        "data": {}
    }

**功能说明**：归档任务

**请求地址**：/api/v1/board/state/card/{uuid}

**请求方式**：PUT

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| archived | int | 是 | 是否归档，0-恢复，1-归档 |

**返回结果**：

    {
        "code": 0,
        "msg": "ok",
        "data": {}
    }

---

**功能说明**：任务评论

**请求地址**：/api/v1/board/state/card/comments

**请求方式**：GET

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| card_id | string | 是 | 任务标识UUID |
| page_no | int | 否 | 页数，默认第一页 |
| page_size | int | 否 | 单页尺寸，默认50条 |

**返回结果**：

    {
        "code": 0,
        "msg": "ok",
        "data": {
            "pagination": {
                "current_page": "1",    # 当前页
                "size_per_page": "50",  # 单页记录数
                "page_count": "10",     # 总页数
                "total_count": "500"    # 总记录数
            },
            "comments": [
                {
                    "uuid": "f8c991114b97cc08",    # 评论标识
                    "content": "",                 # 评论内容
                    "username": "张建",            # 评论人昵称
                    "create_at": "2016-12-12 16:47:15"    # 评论时间
                }
            ]
        }
    }

**功能说明**：新建评论

**请求地址**：/api/v1/board/state/card/comment

**请求方式**：POST

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| user_id | int | 是 | 评论人编号 |
| card_id | int | 是 | 所属任务编号 |
| content | string | 是 | 评论内容 |

**返回响应**：

    {
        "code": 0,
        "msg": "ok",
        "data": {}
    }

---

**功能说明**：看板动态

**请求地址**：/api/v1/board/{board_uuid}/actions

**请求方式**：GET

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| page_no | int | 否 | 页数，默认第一页 |
| page_size | int | 否 | 单页尺寸，默认50条 |

**返回响应**：

    {
        "code": 0,
        "msg": "ok",
        "data": {
            "pagination": {
                "current_page": "1",    # 当前页
                "size_per_page": "50",  # 单页记录数
                "page_count": "10",     # 总页数
                "total_count": "500"    # 总记录数
            },
            "actions": [
                {
                    "username": "大忽悠",  # 用户昵称
                    "avatar": "",  # 用户头像
                    "description": "",
                    "create_at": "2016-12-12 18:02:34"
                }
            ]
        }
    }
`备注：按照时间倒序排列，默认显示20条，点击【加载更多】，显示更早得20条动态。`

**功能说明**：任务动态

**请求地址**：/api/v1/card/{card_uuid}/actions

**请求方式**：GET

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| page_no | int | 否 | 页数，默认第一页 |
| page_size | int | 否 | 单页尺寸，默认50条 |

**返回响应**：

    {
        "code": 0,
        "msg": "ok",
        "data": {
            "pagination": {
                "current_page": "1",    # 当前页
                "size_per_page": "50",  # 单页记录数
                "page_count": "10",     # 总页数
                "total_count": "500"    # 总记录数
            },
            "actions": [
                {
                    "username": "大忽悠",  # 用户昵称
                    "avatar": "",  # 用户头像
                    "description": "",
                    "create_at": "2016-12-12 18:02:34"
                }
            ]
        }
    }

---

**功能说明**：工作日志列表

**请求地址**：/api/v1/board/state/card/records

**请求方式**：GET

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| page_no | int | 否 | 页数，默认第一页 |
| page_size | int | 否 | 单页尺寸，默认50条 |
| user_id | int | 否 | 所属用户编号 |
| card_id | int | 否 | 所属任务编号 |
| board_id | int | 否 | 所属看板编号 |
| start_at | string | 否 | 开始时间，格式：2016-11-01 12:00:00 |
| end_at | string | 否 | 结束时间，格式：2016-11-05 15:12:43 |

**返回结果**：

    {
        "code": 0,
        "msg": "ok",
        "data": {
            "pagination": {
                "current_page": "1",    # 当前页
                "size_per_page": "50",  # 单页记录数
                "page_count": "10",     # 总页数
                "total_count": "500"    # 总记录数
            },
            "records": [
                {
                    "uuid": "f8c991114b97cc08",     # 工作日志标识
                    "screenshot": "http://192.168.1.1/20151201.jpg",  # 截屏图片地址
                    "description": "",    # 工作日志描述
                    "username": "大忽悠",  # 用户昵称
                    "avatar": "",         # 用户头像
                    "create_at": "2016-12-12 18:02:34",   # 日志创建时间
                    "click_count": "2124",  # 鼠标单击次数
                    "typing_count": "215"   # 键盘击打次数
                }
            ],
            "duration": "5小时20分钟"  # 工作日志时长
        }
    }

**功能说明**：编辑工作日志

**请求地址**：/api/v1/board/state/card/record/{uuid}

**请求方式**：PUT

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| description | string | 是 | 日志描述 |

**返回结果**：

    {
        "code": 0,
        "msg": "ok",
        "data": {}
    }

**功能说明**：删除工作日志

**请求地址**：/api/v1/board/state/card/record/{uuid}

**请求方式**：DELETE

**请求参数**：无

**返回结果**：

    {
        "code": 0,
        "msg": "ok",
        "data": {}
    }

**功能说明**：工作日志详情

**请求地址**：/api/v1/board/state/card/record/{uuid}

**请求方式**：GET

**请求参数**：

| 参数名称 | 参数类型 | 是否必须 | 描述 |
| :---: | :---: | :---: | :---: |
| redirect | string | 否 | previous-上一条，next-下一条 |

**返回结果**：

    {
        "code": 0,
        "msg": "ok",
        "data": {
            "uuid": "f8c991114b97cc08",     # 工作日志标识
            "screenshot": "http://192.168.1.1/20151201.jpg",  # 截屏图片地址
            "description": "",    # 工作日志描述
            "username": "大忽悠",  # 用户昵称
            "avatar": "",         # 用户头像
            "create_at": "2016-12-12 18:02:34",   # 日志创建时间
            "click_count": "2124",  # 鼠标单击次数
            "typing_count": "215",  # 键盘击打次数
            "board_name": "你就是我的天使"  # 所属看板名称
        }
    }
