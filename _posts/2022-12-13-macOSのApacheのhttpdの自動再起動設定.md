---
layout: post
title: macOSのApache httpdの自動再起動設定
subtitle: 
cover-img: [/assets/img/cover/technology1.jpg, /assets/img/cover/technology2.jpg, /assets/img/cover/technology3.jpg]
thumbnail-img: https://i.imgur.com/4znywRg.png
share-img:
tags: [macOS, apache, httpd]
categories: [Technology]
---

## 目的
macOSにて、`Apache httpd`の自動起動設定の手順をまとめる。

![file](https://i.imgur.com/4znywRg.png)

## 手順
### デフォルトのhttpdを自動再起動から解除
macOSにデフォルトでインストールされている`Apache httpd`があり、PCの再起動と共に自動起動されている。これがあると、`$ brew install apache2`とかでインストールするものとポートが競合するため、自動再起動から解除する必要がある。

#### 自動起動されているかを確認
macOSのアプリケーションを自動起動する処理は`launchd`が担っている。以下のコマンドで`httpd`が`launchd`の対象になっているかどうかを知ることができる。
```sh
$ sudo launchctl list | grep httpd
Password:
87404	1	org.apache.httpd
-	0	homebrew.mxcl.httpd
```
ついでに、起動されているプロセスもみてみる
```sh
ps auxww | grep httpd | grep -v grep
_www             87821   0.0  0.0 34319124    892   ??  S    11:51PM   0:00.00 /usr/sbin/httpd -D FOREGROUND
_www             87820   0.0  0.0 34319124    904   ??  S    11:51PM   0:00.00 /usr/sbin/httpd -D FOREGROUND
_www             87816   0.0  0.0 34450196   1148   ??  S    11:51PM   0:00.00 /usr/sbin/httpd -D FOREGROUND
_www             87408   0.0  0.0 34712340   1872   ??  S    11:51PM   0:00.01 /usr/sbin/httpd -D FOREGROUND
root             87404   0.0  0.0 34317124   3396   ??  Ss   11:51PM   0:00.49 /usr/sbin/httpd -D FOREGROUND
```

#### httpdのプロセスを停止
下記のコマンドではうまく停止できませんでした。
```sh
$ sudo apachectl stop
httpd (no pid file) not running
```
非常になぞなので、ネットでいろいろ調べたら、どうやら、使っている`apachectl stop`の停止対象が起動している`httpd`ではなかったことが分かりました。
```sh
$ which apachectl
/usr/local/Cellar/httpd/2.4.54_1/bin/apachectl
```
なので、起動している`/usr/sbin/httpd`と同じパスにある`apachectl`を使うようにしたら、うまく停止できた。
```sh
$ sudo /usr/sbin/apachectl stop
$ ps auxww | grep httpd | grep -v grep
```
#### httpdをlaunchdの対象から除外
```sh
$ sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist
Password:
/System/Library/LaunchDaemons/org.apache.httpd.plist: Could not find specified service
Unload failed: 113: Could not find specified service
```

### brewでインストールしたhttpdを自動起動に設定
####  自動起動設定
```sh
$ brew services start httpd
```
#### 自動起動解除
```sh
$ brew services stop httpd
```
#### 自動設定されているコマンドを確認
```sh
$ brew services list
Name    Status     User File
httpd   error  256 root ~/Library/LaunchAgents/homebrew.mxcl.httpd.plist
php@8.0 none
```
なぜか、`Status`が`error`になっている（なぞ）。ちなみに、PC再起動した後には、ちゃんと`httpd`が再起動されるようになっている。
```sh
$ ps auxww | grep httpd |grep -v grep
（一部省略）
_www               408   0.0  0.0 35319996   2148   ??  S     1:00AM   0:00.01 /usr/local/opt/httpd/bin/httpd -D FOREGROUND
_www               407   0.0  0.0 35057852   1644   ??  S     1:00AM   0:00.00 /usr/local/opt/httpd/bin/httpd -D FOREGROUND
root               136   0.0  0.1 35057900  17640   ??  Ss    1:00AM   0:00.26 /usr/local/opt/httpd/bin/httpd -D FOREGROUND
```

## まとめ
macOS標準でインストールされている`Apache httpd`のプロセス停止、自動起動の解除、および`brew services ｓtart/stop [COMMAND]`による自動起動/停止の方法を紹介しました。

