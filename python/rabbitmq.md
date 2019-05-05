显示所有用户
```
sudo rabbitmqctl list_users
```

添加用户
```
sudo rabbitmqctl add_user test 12345
```

设置用户权限
```
sudo rabbitmqctl set_permissions -p / test ".*" ".*" ".*"
```

设置用户标签
```
sudo rabbitmqctl set_user_tags test administrator
```

删除用户
```
sudo rabbitmqctl delete_user guest
```
