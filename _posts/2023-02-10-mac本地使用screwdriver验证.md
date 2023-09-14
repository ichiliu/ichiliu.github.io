---
layout: post
title: 在Mac本地使用Screwdriver.cd验证job build 
subtitle: 
cover-img: [/assets/img/cover/technology1.jpg, /assets/img/cover/technology2.jpg, /assets/img/cover/technology3.jpg]
thumbnail-img: https://i.imgur.com/RB86t7r.png
share-img:
tags: [screwdriver.cd, job build]
categories: [Technology]
---

# 目的
使用`Screwdriver.cd`验证下`CI/CD`。
环境: 
* macOS Catalina 10.15.7
* Screwdriver.cd
* Docker Desktop
* Github.com

![file](https://i.imgur.com/RB86t7r.png)

# 安装环境
## node.js
参考： [ember-cli/ember-cli](https://github.com/ember-cli/ember-cli/blob/master/docs/node-support.md)

因为后面安装的`screwdriver-ui`需要`EMBER CLI`，而`EMBER CLI`只能用`18.x`一下的`node.js`。

### 通过nodebrew安装
参考：[NodebrewでNodeをインストールする](https://qiita.com/mame_daifuku/items/373daf5f49ee585ea498)

#### 先安装nodebrew
```sh
$ brew install nodebrew
$ nodebrew -v
nodebrew 1.2.0
```
在登陆脚本里追加`PATH`。
`$ vim ~/.bashrc`
```sh
PATH=$HOME/.nodebrew/current/bin:$PATH
```
之后，`$ source ~/.bashrc`反应这个追加。接下来，需要执行下面这个命令。
```sh
$ nodebrew setup
Fetching nodebrew...
Installed nodebrew in $HOME/.nodebrew

========================================
Export a path to nodebrew:

export PATH=$HOME/.nodebrew/current/bin:$PATH
========================================
```

#### 指定node版本安装
先看看有什么可以安装
```sh
$ nodebrew ls-remote
```
选择`18.x`里最新的`v18.14.0`安装。
```sh
$ nodebrew install-binary v18.14.0
Fetching: https://nodejs.org/dist/v18.14.0/node-v18.14.0-darwin-x64.tar.gz
########################################################################################################################### 100.0%
Installed successfully
$ nodebrew ls
v18.14.0

current: none
```
这个时候`node`还不能用，需要指定用`v18.14.0`这个版本才行。
```sh
$ nodebrew use v18.14.0
use v18.14.0
$ nodebrew ls
v18.14.0

current: v18.14.0
$ which node
/Users/<my-account>/.nodebrew/current/bin/node
$ node -v
v18.14.0
```
最后命令显示`current: v18.14.0`了，就表明能用了（
大功告成）。几分钟就搞定了，想想以前用`$ brew install node`安装过一次，足足用了一整个晚上。。

## 安装Docker Desktop4.15
`macOS Catelina`只能对应 4.15 以下的`Docker Desktop`。

参考） [Install docker on macos catalina](https://stackoverflow.com/questions/68373008/install-docker-on-macos-catalina)

```sh
$ cd /usr/local/share
$ curl https://raw.githubusercontent.com/Homebrew/homebrew-cask/1a83f3469ab57b01c0312aa70503058f7a27bd1d/Casks/docker.rb -O
$ brew install --cask docker.rb
Running `brew update --auto-update`...
==> Auto-updated Homebrew!
Updated 1 tap (homebrew/core).

You have 2 outdated formulae installed.
You can upgrade them with brew upgrade
or list them with brew outdated.

==> Downloading https://desktop.docker.com/mac/main/amd64/93002/Docker.dmg
######################################################################## 100.0%
==> Installing Cask docker
==> Moving App 'Docker.app' to '/Applications/Docker.app'
(省略)
🍺  docker was successfully installed!
```
安装完`Docker Desktop 4.15`之后，点击`Application`里的`Docker`应用，把它作为一个`Deamon`启动起来。

## 安装 SD-in-a-box
参考：https://docs.screwdriver.cd/cluster-management/running-locally
```sh
$ python <(curl -L https://tinyurl.com/sd-in-a-box)
...省略...
👍   Launched!

    A few more things to note:
      - To stop/reset Screwdriver
        $ docker-compose -p screwdriver down
      - If your internal IP changes, update the docker-compose.yml and your SCM OAuth application
      - In-a-box does not support Webhooks including PullRequests for triggering builds
      - To create your own cluster, see https://docs.screwdriver.cd/cluster-management/kubernetes
      - For help with this and more, find us on Slack at https://slack.screwdriver.cd

❤️   Screwdriver Crew
```
做两个别名来启动和关闭它。
`$ vim ~/.bashrc`
```sh
# for SD-in-a-box
alias sdup='cd ~/.sd-in-a-box; docker-compose -p screwdriver up'
alias sddown='docker-compose -p screwdriver down'
```
然后，修改`docker-compose.yml`文件，把域名改成`sd.screwdriver.cd`。然后，在`/etc/hosts`里加上下面一行：
```sh
127.0.0.1	sd.screwdriver.cd
```
### User Guide
参考：https://docs.screwdriver.cd/user-guide/local

搞了半天，进行`create pipeliine`之后一直停在这个画面，也搞不懂什么原因。
![file](https://i.imgur.com/vvCpKr9.png)

没有其他好办法，看`docs`试着加入了`slack.screwdriver.cd`群（Thx for accepted me!），
希望以后能解决这个问题。

我估计是`SD-in-a-box`的`docker images`那个地方出问题了，那就试试`local build`吧。

参考：
* [sd-local](https://docs.screwdriver.cd/ja/user-guide/local)
* [screwdriver-cd / sd-local](https://github.com/screwdriver-cd/sd-local)

安装：
```sh
$ brew tap screwdriver-cd/sd-local https://github.com/screwdriver-cd/sd-local.git
$ brew update --auto-update
$ brew install sd-local
$ which sd-local
/usr/local/bin/sd-local
$ sd-local version
1.0.46
platform: darwin/amd64
go: go1.19.3
compiler: gc
$ sd-local update
INFO   [0001] Current version: 1.0.46
WARNING[0001] Current version is latest
```
### Quick Start
#### Create user API token
在`http://sd.screwdriver.cd:9000/user-settings/access-tokens`这个页面（`Screwdriver.cd'sUI`）创建了一个`Access Token`，命其名为`token_sd-local`。

#### Get repository for build
```sh
$ git clone https://github.com/screwdriver-cd-test/quickstart-generic.git
$ cd quickstart-generic
```

#### Build configuration
```sh
$ sd-local config set api-url http://sd.screwdriver.cd:9001
$ sd-local config set store-url http://sd.screwdriver.cd:9002
$ sd-local config set token <API Token>
$ sd-local config set launcher-version latest
```
指定完这些后，它们会被生成在`./sdlocal/config`这个文件里。
```sh
configs:
  default:
    api-url: http://sd.screwdriver.cd:9001
    store-url: http://sd.screwdriver.cd:9002
    token: <user access token>
    UUID: <uuid>
    launcher:
      version: latest
      image: screwdrivercd/launcher
current: default
```
文件里面的`UUID`是第一次执行`sd-local build`命令是选择`[y/N]`时选了`y`时创建的。

#### Execute build
```sh
$ sd-local build main
sd-local collects UUIDs for statistical surveys.
You can reset it later by removing the UUID key from config.
Would you please cooperate with the survey? [y/N]:y
UUID key has been added to /Users/<my-account>/.sdlocal/config
INFO   [0063] Prepare to start build...
INFO   [0213] Pulling docker image from buildpack-deps...
hello: $ echo $GREETING
hello: Hello, world!
hello:
sd-setup-launcher: set -e && export PATH=${PATH}:/opt/sd:/usr/sd/bin && finish() { EXITCODE=$?; tmpfile=/tmp/env_tmp; exportfile=/tmp/env_export; export -p | grep -vi "PS1=" > $tmpfile && mv -f $tmpfile $exportfile; echo $SD_STEP_ID $EXITCODE; } && trap finish ABRT EXIT;
sd-setup-launcher: echo ;
export: $ export GREETING="Hello, world!"
export:
export:
set-metadata: $ meta set example.coverage 99.95
```
看来，`local build`成功通过了。完了后，自动的创建了一个`./sd-artifacts`目录，有以下三个日志文件
```sh
$ ls ./sd-artifacts
builds.log		environment.json	steps.json
```
#### build command
This command runs builds in your local environment.
##### Usage
对特定的`job`进行构建（不会影响其他`job`）
```sh
$ sd-local build <job name>
```
对象是在当前目录下的`screwdriver.yaml`里的`job`，然后`build artifacts`会在`./sd-artifacts/`目录里生成。

#### Options
以下的选项可以被指定在`sd-local`命令行里执行。
(https://docs.screwdriver.cd/user-guide/local)
其中，`–src-url`可以用来指定`github.com`等`SCM`的`repo url`（https or ssh format）。

下面指定`--src-url`选项，对`github.com`的`repo`里的`main job`进行构建。
```sh
$ mkdir work
$ cd work
$ sd-local build main --src-url="git@github.com:gxliu28/quickstart-generic.git#master"
INFO   [0000] Pulling the source code from git@github.com:gxliu28/quickstart-generic.git#master...
INFO   [0002] Prepare to start build...
INFO   [0015] Pulling docker image from buildpack-deps...
export: $ export GREETING="Hello, world!"
export:
export:
sd-setup-launcher: set -e && export PATH=${PATH}:/opt/sd:/usr/sd/bin && finish() { EXITCODE=$?; tmpfile=/tmp/env_tmp; exportfile=/tmp/env_export; export -p | grep -vi "PS1=" > $tmpfile && mv -f $tmpfile $exportfile; echo $SD_STEP_ID $EXITCODE; } && trap finish ABRT EXIT;
sd-setup-launcher: echo ;
hello: $ echo $GREETING
hello: Hello, world!
hello:
set-metadata: $ meta set example.coverage 99.95
set-metadata:
$ ls sd-artifacts/
builds.log		environment.json	steps.json
```
在执行构建的目录下，同样生成了`./sd-artifacts`目录以及三个文件。

## 总结
在`macOS Catalina 10.15.7`本地构建`Screwdriver.cd`（SD-in-a-box ），在能操作其`ui`的状态下，进行了`Create pipeline`，但是画面总停留在最初的`sd-setup-ini`， 不能继续往下进行（失败）。在原因不明的情况下，安装`sd-local`，通过对`SD-in-a-box`构建的`ui`操作创建了`user access token`的前提下，设置好了`sd-local`，并能够在本地构建`job`（成功）。

验证目的完成。

## 参考資料
* [screwdriver-cd/in-a-box](https://github.com/screwdriver-cd/in-a-box#screwdriver-in-a-box)
* [DockerでNode.jsを動かすときのベストプラクティス](https://blog.shinonome.io/nodejs-docker/)

