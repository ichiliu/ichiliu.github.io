---
layout: post
title: WordPress的用法TIPS
subtitle: 
date: 2023-01-01 22:27:00 +0900
cover-img: [/assets/img/cover/technology1.jpg, /assets/img/cover/technology2.jpg, /assets/img/cover/technology3.jpg]
thumbnail-img: https://i.imgur.com/BjvxFSn.png
share-img:
tags: [WordPress]
categories: [Technology]
---

WordPress使用上的出错对应，借用好方法等的归纳总结。

![file](https://i.imgur.com/BjvxFSn.png)

#  Good Cases
## ChromeNews主题
### 主题模版的宽度变更
查看CSS文件，找到了定义宽度的地方，然后把它改了过来。

```shell
$ cd /var/www/html/wp-content/themes/chromenews
$ sudo cp -p style.css{,.orgi}
$ sudo vim style.css
$ diff style.css.orin style.css
1177c1177
<     width: 66.66%;
---
>     width: 75.00%;
1181c1181
<     width: 33.33%;
---
>     width: 25.00%;
$ sed -n "1176,1185p" style.css
.container-wrapper #primary {
    width: 75.00%;
    padding-right: 10px;
}
.container-wrapper #secondary {
    width: 25.00%;
    padding-left: 10px;
}
```

## Twenty Twenty Two主题
试用WordPress的默认主题（Theme）Twenty Twenty Two的时候, 它的模版的宽度比较窄，根据这篇文章
[WordPress5.9 新デフォルトテーマ Twenty Twenty-Two と フルサイト編集(FSE) をチェックしています](https://nendeb.com/1113) 的分析，写Blog部分的Content是650px，我把它改成了850px。

```shell
$ cd /var/www/html
$ find . -name theme.json
$ ｃd wp-content/themes/twentytwentytwo
$ sudo cp -p theme.json{,.orig}
$ sudo vim theme.json
$ diff theme.json.orig theme.json
204c204
<            "contentSize": "650px",
---
>           "contentSize": "850px",
```

## 自动写目录插件
参考一下文章，安装了自动写目录的插件。

[【Easy Table of Contents】WordPressの記事内に目次を自動挿入する方法](https://more-field.co.jp/web/easy-table-of-contents/)

# TroubleShooting
## Contact Form不能发送邮件
原因很明确，因为安装了WordPress的EC2没有开通对外的SMTP端口。

我是看了这篇文章 [20分でできる！【WordPressブログ】お問い合わせフォームの作り方](https://www.xserver.ne.jp/blog/contact-form/) 后设置好了Contact Form的，多谢了!

上面这篇文章介绍的form,但是正如 [[AWS] EC2からSES経由でメール送信する](https://guaiguailei.net/it/aws-ec2%e3%81%8b%e3%82%89ses%e7%b5%8c%e7%94%b1%e3%81%a7%e3%83%a1%e3%83%bc%e3%83%ab%e9%80%81%e4%bf%a1%e3%81%99%e3%82%8b) 上写的，AWS没有允许我解除沙箱的限制，所以我不能从EC2通过SES发送自己邮箱以外的邮件（在沙箱环境下，自能发送给已经Verified过的作为Sender的邮件。就是说自己发给自己）。

Contact Form 7有一个很特别的限制条件，就是设置的From（Sender）的邮箱域名必须跟网站的域名一致。这就造成了一个问题，就是我在没有接触沙箱限制之前不能使用它。所以我先把它给Deactivate，然后把Contact的菜单先下单了再说。

TBD:安装 [MW WP Form](https://form.run/media/contents/website-lp-creation/mw-wp-form/) 试试。

## 予約投稿失敗
公开的时候、也没有预约公开但不知道为什么会显示「予約投稿失敗」的错误，不能成功地公开。在网上查询，进行了以下两个更改之后搞好了。

### 更改时区
WordPress设置的时区默认是UTC（协调世界时），而日本是JST（UTC+9）。所以在首先在「设定」的「一般」的时区选项里，把时区设置为「东京」。
![file](https://i.imgur.com/rtpPf3X.png)

如果再有发生显示预约投稿预约失败之类错误的话，可以尝试执行以下命令:
```shell
$ sudo yum reinstall tzdata
$ sudo systemctl restart httpd
```

### 设定代替CRON
我的情况是更改了时区后（包括后台的EC2），预约投稿失败的出错还存在。所以参考了 WordPressの予約投稿に失敗する原因と見るべき重要ポイントのまとめ！后，终于改好了。也就是说，在WordPress的文件wp-cron.php的开头里加了一行。

```shell
$ sudo vim /var/www/html/wp-cron.php
define('ALTERNATE_WP_CRON', true);
```

改完过了一阵时间后问题解决了。

## MariaDB宕机（Down机）对策
在运用过程中，原因不明的mariadb宕机时有出现。以下是一个很原始的对应方法（自己20年前使用的手法）。写一个叫`self_check.sh`的脚本， 每10分钟`cron`执行一次。

```shell
#!/usr/bin/env bash

#set -x

while true
do
	ret=`systemctl status mariadb | grep "active (running)"`
	if [ $? -ne 0 ]; then
		sudo systemctl restart mariadb
	else
		break
	fi
done
```

然后，设置`cron`

```shell
SHELL=/usr/bin/bash
PATH=~/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/bin:/sbin

MAILTO=xxxxxx@xxxxx.xxx

# Mariadb self_check
*/10 * * * * /home/ec2-user/bin/self_check.sh > /dev/null 2>&1
```
搞掂。
