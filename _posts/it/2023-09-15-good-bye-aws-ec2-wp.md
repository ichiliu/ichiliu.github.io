---
layout: post
title: Good-bye AWS EC2 WordPress
permalink: /it/good-bye-aws-ec2-wordpress
subtitle: 
cover-img: [/assets/img/cover/it1.jpg, /assets/img/cover/it2.jpg, /assets/img/cover/it3.jpg]
thumbnail-img: 
share-img:
tags: [Jekyll, Github Pages]
categories: [IT]
---

# 概要
2022-05-01に、はてなブログで記事（[AWS無料枠で1台のEC2上にWordPressを構築](https://gxliu.hatenablog.com/entry/2022/05/02/144244)）を書いた以来、AWS EC2を1台で、Blogサイトを運営して1年数ヶ月を経過しました。

AWSで運営する上で、 勉強することも兼ねて得るものがあるので、、、

TBD...

# GitHub Pagesに引越
## JekyllのTheme選定
TBD

## Blog記事の移行
TBD、大変だった。。


## DNS設定変更
ISP（onamae.com）側で以下いずれの方法が考えられる

- ALIASレコード作成
- URL転送設定

調べたら、なんとonamae.comには、ALIASレコードの作成機能がない！
URL転送設定を利用するには、DNS追加オプションを購入する必要があり、2023/09/15時点133円（税込）/月。
仕方なく、購入することにしました。

### URL転送設定

![file](https://i.imgur.com/EHp6XaI.png)

onamae.comの「ドメイン設定」画面にて、以下のようにURL転送を利用する。

![file](https://i.imgur.com/edolzBX.png)

転送情報設定画面を開きます。まずはまだ何も入力していないデフォルト状態は以下のようになります。
画面が縦長いため、2枚に分けてキャプチャを貼ります。

転送元、転送先の設定

![file](https://i.imgur.com/m0aRrP9.png)

リダイレクト転送か、フレーム転送かの設定

![file](https://i.imgur.com/VzV8Td7.png)

入力内容ですが、
- 転送元：デフォルトのまま
- 転送先：転送先URLをhttps://<username>.github.or にします

個人的には、転送後もブラウザのアドレスバーには転送元の独自ドメインを表示させたいため、
「フレーム転送」を選択しました。

![file](https://i.imgur.com/Z49a3G7.png)

設定完了した画面には以下の表示があります。

![file](https://i.imgur.com/BPm1fTT.png)

## 動作確認
正しく転送できているのかを確認します。
