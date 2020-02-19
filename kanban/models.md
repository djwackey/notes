**Board - 任务看板** `表名：t_board`

| **字段名称** | **字段描述** | **字段类型** | **备注** |
| :---: | :---: | :---: | :---: |
| id | 编号 | int | PK自增 |
| uuid | 看板标识 | varchar(64) | 看板标识 |
| name | 看板名称 | varchar(64) | 看板名称 |
| status | 看板状态 | int | 看板状态 |
| thumbnail | 看板配图 | int | 配图附件编号 |
| description | 看板描述 | varchar(512) | 看板描述 |
| creator | 创建者 | int | 主站用户编号 |
| operator | 操作者 | int | 操作用户编号 |
| update_at | 更新时间 | datetime | 最后更新时间 |
| create_at | 创建时间 | datetime | 时间戳形式 |
```
status看板状态定义：
0 - 禁用
1 - 启用（默认）
2 - 删除
```
`备注：个人首页看板排序，以创建时间的倒序排列，暂不支持调整排列顺序。`

**State - 任务列表** `表名：t_state`

| 字段名称 | 字段描述 | 字段类型 | 备注 |
| :---: | :---: | :---: | :---: |
| id | 编号 | int | PK自增 |
| uuid | 列表标识 | varchar(64) | 列表标识 |
| name | 列表名称 | varchar(64) | 列表名称 |
| seqno | 排列序号 | int | |
| status | 列表状态 | int | 列表状态 |
| creator | 创建者 | int | 主站用户编号 |
| board_id | 所属看板 | int | FK看板编号 |
| update_at | 更新时间 | datetime | 更新时间 |
| create_at | 创建时间 | datetime | 创建时间 |
```
status列表状态定义：
0 - 禁用
1 - 启用（默认）
2 - 删除
```

**Card - 任务卡片** `表名：t_card`

| 字段名称 | 字段描述 | 字段类型 | 备注 |
| :---: | :---: | :---: | :---: |
| id | 编号 | int | PK自增 |
| state_id | 所属列表 | int | FK列表编号 |
| uuid | 任务标识 | varchar(64) | 任务标识 |
| name | 任务名称 | varchar(64) | 任务名称 |
| seqno | 排列序号 | int | |
| status | 任务状态 | int | 任务状态 |
| archived | 是否归档 | bool | 是否归档 |
| creator | 创建者 | int | 主站用户编号 |
| priority | 优先级 | int | |
| card_type | 任务类型 | int | |
| description | 任务描述 | text | |
| attachment_id | 附件编号 | int | |
| assign_to | 指派人 | int | |
| operator | 操作人 | int | |
| end_at | 截至日期 | datetime | 截至日期 |
| assign_at | 委派时间 | datetime | 委派时间 |
| update_at | 更新时间 | datetime | 更新时间 |
| create_at | 创建时间 | datetime | 创建时间 |
```
status列表状态定义：
0 - 未完成
1 - 已完成

priority优先级定义：
0 - 低
1 - 普通
2 - 紧张
3 - 严重

card_type任务类型定义：
0 - 需求
1 - 任务
2 - 缺陷
```

**Card Attachment - 任务附件** `表名：t_card_attachment`

| 字段名称 | 字段描述 | 字段类型 | 备注 |
| :---: | :---: | :---: | :---: |
| id | 编号 | int | PK自增 |
| card_id | 任务编号 | int | FK任务编号 |
| attachment_id | 附件编号 | int | FK附件编号 |
| create_at | 创建时间 | datetime | NOT NULL |

`备注：任务与附近为多对多关系，一个任务可以包含多个附件，一个附件可以属于多个任务。`

**Board Member - 看板成员** `表名：t_board_member`

| 字段名称 | 字段描述 | 字段类型 | 备注 |
| :---: | :---: | :---: | :---: |
| id | 编号 | int | PK自增 |
| user_id | 成员编号 | int | 主站用户编号 |
| board_id | 看板编号 | int | FK看板编号 |
| create_at | 创建时间 | datetime | NOT NULL |

`备注：成员与看板为多对多关系，一个成员可以加入多个看板，一个看板包含多个成员。`

**Invite Record - 用户邀请记录** `表名：t_invite_record`

| 字段名称 | 字段描述 | 字段类型 | 备注 |
| :---: | :---: | :---: | :---: |
| id | 编号 | int | PK自增 |
| invitor | 邀请人 |
| invitee | 被邀请人 | int | |
| status | 状态 | int | 默认0 |
| board_id | 看板编号 | int | |
| create_at | 创建时间 | datetime | NOT NULL |

`备注：status定义: 0-未操作，1-同意，2-拒绝`

**Team - 团队** `表名：t_team` ***reserved***

| 字段名称 | 字段描述 | 字段类型 | 备注 |
| :---: | :---: | :---: | :---: |
| id | 编号 | int | PK自增 |

**Comment - 评论** `表名：t_comment`

| 字段名称 | 字段描述 | 字段类型 | 备注 |
| :---: | :---: | :---: | :---: |
| id | 编号 | int | PK自增 |
| uuid | 评论标识 | varchar(64) | |
| card_id | 所属任务 | int | |
| user_id | 评论人 | int | |
| content | 评论内容 | varchar(512) | |
| status | 状态 | int | |
| update_at | 更新时间 | datetime | 更新时间 |
| create_at | 创建时间 | datetime | 创建时间 |

**Attachment - 附件** `表名：t_attachment`

| 字段名称 | 字段描述 | 字段类型 | 备注 |
| :---: | :---: | :---: | :---: |
| id | 编号 | int | PK自增 |
| uuid | 附件标识 | varchar(64) | 附件标识 |
| name | 附件名称 | varchar(64) | 附件名称 |
| size | 附件尺寸 | int | 单位：byte |
| path | 附件路径 | varchar(256) | |
| md5 | MD5加密值 | varchar(32) | |
| user_id | 上传人 | int | 主站用户编号 |
| file_type | 附件类型 | int | 附件类型 |
| create_at | 创建时间 | datetime | 创建时间 |

**Notification - 消息通知** `表名：t_notification`

| 字段名称 | 字段描述 | 字段类型 | 备注 |
| :---: | :---: | :---: | :---: |
| id | 编号 | int | PK自增 |
| uuid | 通知标识 | varchar(64) | 通知标识 |
| title | 通知标题 | varchar(512) | NOT NULL |
| status | 通知状态 | int | |
| notify_to | 通知人 | int | |
| notify_event | 通知事件 | int | NOT NULL |
| notify_data | 通知数据 | blob | |
| operator | 操作人 | int | |
| create_at | 创建日期 | datetime | | |

`备注：未来可考虑分表存储`

| 通知事件 | 事件描述 | 通知人 | 通知标题 |
| :---: | :---: | :---: | :---: |
| 0 | 新建看板 | 无 | |
| 1 | 编辑看板 | 普通成员 | 您加入的看板［原看板名］信息有变更 |
| 2 | 关闭看板 | 普通成员 | 您加入的看板［看板名］被［操作人］关闭，相应指派给您的任务同时关闭，不再显示在您的任务列表中 |
| 3 | 打开看板 | 普通成员 | 您加入的看板［看板名］被［操作人］重新打开，包含您的10个任务，其中5个完成，5个未完成，已进入您的任务列表 |
| 4 | 删除看板 | 普通成员 | 您加入的看板［看板名］被［操作人］删除，相应指派给您的任务同时删除，不再显示在你的任务列表中 |
| 5 | 新建任务 | 任务执行人 | ［看板名］：您被指派了新任务［任务名］ |
| 6 | 编辑任务 | 任务执行人 | ［看板名］：［操作人］更新了任务［任务名］信息 |
| 7 | 执行人完成任务 | 看板创建人 | ［看板名］：［执行人］完成了任务［任务名］ |
| 8 | 非执行人完成任务 | 看板创建人 & 看板执行人 | ［看板名］：［操作人］将您的任务［任务名］状态改为已完成 |
| 9 | 移动任务 | 任务执行人 | 您的任务［任务名］被移动到列表［列表名］ |
| 10 | 复制任务 | 任务执行人 | 您的任务［任务名］被复制到列表［列表名］ |
| 11 | 归档任务 | 任务执行人 | ［看板名］：您当前的任务［任务名］被［操作人］归档，将不再显示在您的任务列表中 |
| 12 | 激活任务 | 任务执行人 | ［看板名］：您当前的任务［任务名］被［操作人］激活，请进入您的任务列表中查看 |
| 13 | 删除任务 | 任务执行人 | ［看板名］：［操作人］将您的任务［任务名］删除 |
| 14 | 评论任务 | 任务执行人 | ［看板名］：任务［任务名］有新评论 |
| 15 | 执行人取消完成任务 | 看板创建人 | ［看板名］：［执行人］将任务［任务名］状态改为未完成 |
| 16 | 非执行人取消完成任务 | 看板创建人 or 任务执行人 | ［看板人］：［操作人］将您的任务［任务名］状态改为未完成 |
| 17 | 取消任务执行人 | 旧任务执行人 | ［看板名］：［操作人］将您取消任务［任务名］执行人 |
| 18 | 委任任务执行人 | 新任务执行人 | ［看板名］：您被指派了新任务［任务名］ |
| 19 | 上传/删除任务附件 | 任务执行人 | ［看板名］：［操作人］更新了任务［任务名］附件 |
| 20 | 编辑任务截至日期 | 任务执行人 | ［看板名］：［操作人］更新了任务［任务名］截至日期 |
| 21 | 编辑/删除工作日志 | 看板创建人 | ［看板名］：［操作人］更新了任务［任务］信息 |
| 22 | 成员退出看板 | 看板创建人 | ［成员名］退出您的看板［看板名］ |
| 23 | 邀请成员 | 被邀请人 | ［邀请人］邀请您加入看板［看板名］ |
| 24 | 同意邀请 | 看板创建人 | ［创建人］加入了您的看板［看板名］ |
| 25 | 拒绝邀请 | 看板创建人 | ［创建人］拒绝加入您的看板［看板名］ |
| 26 | 移除成员 | 移除成员 | 您已被移出看板［看板名］ |

**Daily Record - 工作日志** `表名：t_daily_record`

| 字段名称 | 字段描述 | 字段类型 | 备注 |
| :---: | :---: | :---: | :---: |
| id | 编号 | int | PK自增 |
| uuid | 日志标识 | varchar(64) | |
| name | 日志名称 | varchar(64) | |
| card_id | 任务编号 | int | FK任务编号 |
| board_id | 看板编号 | int | FK看板编号 |
| click_count | 击鼠标次数 | int | |
| typing_count | 击键盘次数 | int | |
| attachment_id | 附件编号 | int | FK附件编号 |
| auto_commit | 是否自动提交 | bool | |
| description | 描述 | varchar(512) | |
| record_at | 记录时间 | datetime | 记录时间 |
| update_at | 更新时间 | datetime | 更新时间 |
| create_at | 创建时间 | datetime | 创建时间 |

**Action Record - 动态** `表名：t_action_record`

| 字段名称 | 字段描述 | 字段类型 | 备注 |
| :---: | :---: | :---: | :---: |
| id | 编号 | int | PK自增 |
| user_id | 用户编号 | int | |
| card_id | 所属任务 | int | |
| board_id | 所属看板 | int | |
| action_id | 行为编号 | int | |
| description | 动态描述 | text | |
| create_at | 创建时间 | datetime | 创建时间 |

**User Action - 用户行为** `表名：t_user_action`

| 字段名称 | 字段描述 | 字段类型 | 备注 |
| :---: | :---: | :---: | :---: |
| id | 编号 | int | PK自增 |
| name | 名称 | varchar(64) | |
| notify_title | 通知标题 | varchar(128) | 通知标题 |
| action_title | 动态标题 | varchar(128) | 动态标题 |
| create_at | 创建时间 | datetime | 创建时间 |
