# Dr.Chat
本项目是在https://github.com/PENGZhaoqing/RailsChat 的基础上添加而来的，增加了若干项功能

## 原有功能
* 聊天室消息即时推送
* 支持查找，添加，删除好友
* 创建私人聊天，也支持多人聊天
* 房主可以拉人，踢人
* 房主能转移房屋权限

## 添加功能
* 注册功能实现
* 个人信息修改
* 好友申请的管理
* 聊天机器人的接入
* 新消息提示
* 置顶与屏蔽
* 已读未读的区分
* 后台管理

## TODO
* 各项功能的体验优化
* 用户个人简介还未开发
* UI界面修改

## Usage
* 测试账号密码分别为: user1@test.com, password （邮箱后的数字代表不同用户）
* 在域名后加"/admin"可以进入后台管理界面，后台管理员账号密码为admin@test.com, password
* 使用聊天机器人需要搜索Dr.Chat并加为好友
* 请用两个浏览器分别登陆不同的用户来测试消息的即使推送，注意这两个用户需要互为好友

## 项目开发
在基于本项目进行继续开发时，本项目的执行步骤如下：
    bundle install
    rake db:migrate
    rake db:setup
    rails s

之后打开另一个终端执行rackup sync.ru -E production

## 项目部署
Demo 地址：
    [开放版本]http://www.softwarehomeliu.com
    [生产版本]http://www.softwarehomeliu.com:3000

## 部署步骤
以在服务器上部署生产版本为例，需要clone项目之后在其根目录执行以下指令：
    bundle install
    rake db:migrate RAILS_ENV=production
    rake db:setup RAILS_ENV=production
    rake assets:precompile RAILS_ENV=production
    bundle exec rackup sync.ru -E production --host 0.0.0.0 -D
    rails s RAILS_ENV=production -b 0.0.0.0

同时，可能需要对config/sync.yml进行修改，修改方法请参照原项目
最后两条指令可以通过-p参数来指定监听端口
需要关闭后台rackup时，可以执行ps ax | grep ruby，找到应用后kill -9 <pid>

同样也可以使用nginx+passenger来部署项目，安装方法可以参[这里]（https://www.phusionpassenger.com/library/install/nginx/install/oss/xenial/）

## 常见问题
当字体或者样式无法载入时可以尝试以下几种方案：
    1.检查路径是否有误，生产版本需要预编译。
    2.检查样式文件中的路径引用，对rails的不同版本而言不能单纯使用url，而需要使用asset_url或font_url等
    3.检查config/environments/production.rb文件，查看所需文件是否需要加入预编译
    4.可以将config/environments/production.rb文件中的config.assets.compile设置为true
    5.查看config/initializers/mine_types.rb，加入对应的解析类型

当使用生产模式时无法访问，提示secret_key_base：
    第一步，执行rake secret RAILS_ENV=production（此时会生成一个key，下面会用到）
    第二步，执行export SECRET_KEY_BASE=<key>

其他问题：
    可以查看log文件夹下的日志文件查看原因