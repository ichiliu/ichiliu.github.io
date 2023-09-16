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

# やりたいこと
- GitHub Pagesを使う。
  - 無料で1GBまで使える  
    → 画像の管理はimgur.comを利用するため、実質Github Pages上はテキストしか管理しない。
- 静的ファイルのジェネレーターにJekyllを使う。
- Custom domainに取得した独自ドメインを使う。
- Enforce HTTPSを使う。
- `https://<独自ドメイン>/<postのdirectory>`を引き継がせたい。
  - https://\<domain\>/travel/冲绳到此一游 にアクセスすると
  - DNSのAレコードによりGitHub PagesのIPアドレスを指します
  - http://\<domain\>を、https://\<user\>.github.ioに転送します
  - 転送後のURLには\<domain\>を維持します

# 手順
## GitHub Pagesに引越
### JekyllのTheme選定
TBD

### Blog記事の移行
TBD、大変だった。。

### Custom Ddomain設定
Ref:[Apexドメインを設定する](https://docs.github.com/ja/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain)

![file](https://i.imgur.com/NlBs8Xk.png)

独自ドメインにSSL証明書が発行されていないため、Enforce HTTPSがUnavailableに。

## DNS設定変更
### Aレコードの作成
Ref:[Apexドメインを設定する](https://docs.github.com/ja/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain)

やることは、onamae.comにおいてDNSのAレコードにGithub PagesのIPアドレスを追加します。

![file](https://i.imgur.com/BB3Yij3.png)

IPv4のをだけ設定することにしました。

onamae.com上に設定完了の画面↓

![file](https://i.imgur.com/tkhG4Ys.png)

## SSL証明書の設定
onamae.com上で購入すると、年間2.5万円程度かかるので、無料で作れないものがないか、
ChatGPTに聞いてみた。すると、以下を回答してくれた。いいですね

>Cloudflareを利用する:
Cloudflareは、無料でSSLを提供するサービスで、カスタムドメインのHTTPSを利用するのに適しています。Cloudflareに独自ドメインを追加し、DNSをCloudflareに向けることで、SSLを強制することが可能です。

更に、詳細なやり方を聞いてみたら、以下を回答してくれました
>具体的な手順は以下の通りです：

    Cloudflare アカウントの作成:
    Cloudflareのウェブサイトにアクセスして、新しいアカウントを作成します。

    サイトの追加:
    ダッシュボードで「Add a Site」をクリックし、ドメイン名を入力して追加します。

    DNS レコードの設定:
    Cloudflare はドメインの DNS レコードの管理を行うため、現在の DNS レコードを自動で読み取ります。これにより、既存の DNS 設定が引き継がれます。

    ネームサーバーの変更:
    Cloudflareから提供される新しいネームサーバー情報を、ドメインを管理しているレジストラで設定します。これにより、ドメインのトラフィックが Cloudflare に流れるようになります。

    このステップで、abcde.net のドメインは Cloudflare を経由してアクセスされるようになります。

    SSL の設定:
    Cloudflare のダッシュボードで SSL の設定を行い、SSL を有効にします。
    これで、abcde.net のドメインが Cloudflare を介してアクセスされるようになり、Cloudflare の機能を利用できます。


## Cloudflareの設定
早速、`cloudfare`のアカウントを作成しました。上記の手順に沿ってやっていきます。

- Add a Site  
  guaiguailei.netを入力
- Select a Plan 
  - 3種類の有料プラン
    - Pro: $20/month
    - Business: $200/month
    - Enterprise: Custom
  - 無料プラン
![file](https://i.imgur.com/0rUdZop.png)

    無料の割に、こんなに機能がいっぱい付いているのですか、素晴らしい！
- Review your DNS records

![file](https://i.imgur.com/tGB62Q8.png)

  DNSレコードは引き継がれているみたい。

- Change your nameservers
![file](https://i.imgur.com/a3fbD4C.png)

  現在のNS（onamae.comのもの）を削除して、cloudfareのNSを使うようにと。
  ということで、onamae.com上にてネームサーバーを変更します。

![file](https://i.imgur.com/FQqe2XR.png)

  設定完了させて、次はcloudflare画面の「Done,check nameservers」ボタンを押す。

- Quick Start Guide
![file](https://i.imgur.com/XrESMU6.png)

  1つずつ開いてみてみます
  - Improve security
![file](https://i.imgur.com/RDpqACR.png)

  - Always use HTTPS
![file](https://i.imgur.com/uJ6ofsV.png)

- Optimize performance
![file](https://i.imgur.com/W8zVFYF.png)

全部「Save」して最後のSummary画面
![file](https://i.imgur.com/HMR51wj.png)

「Finish」ボタンを押します。

## SSL/TLS設定
- Overview
  cloudflareのSSL共用証明書を使います、「Advanced Certificate」は別の用途なので、今回は関係ない。

![file](https://i.imgur.com/MBqiAXi.png)

  Flexibleを選択するようにします。
  - Browserとcloudflare間は「HTTPS」、cloudflareとGithub Pages間は「HTTP」になります。
  - Fullを選択すると、cloudflareとGithub Pages間がHTTPSとなり、SSL証明書エラーになります。

## Github PagesにてEnforce HTTPS設定
上記のcloudflare設定が無事完了していれば、cloudflare->HTTP->Github Pagesになります。
セキュリティを強化するため、Enforce HTTPS設定をします。

![file](https://i.imgur.com/ax2fH6o.png)

この設定が完了すると、Github Pagesのサイトは`https://<custom domain>`になります。

![file](https://i.imgur.com/kf67k70.png)

## 動作確認
Github Pagesに引越前と同いURLでBlogを閲覧することができました。
めでだしめでだし。

# AWS EC2を削除
動作確認で問題なかったため、いよいよAWS EC2を削除するタイミングが来ました。

- AMIsを削除

![file](https://i.imgur.com/fQMG6oa.png)

  削除する前のスクショを取るのを忘れましたが、AMIsを全部選択して「Deregister AMI」のActionをしました。

- Snapshotsを削除

![file](https://i.imgur.com/nWkk3Nu.png)

- EC2を削除

![file](https://i.imgur.com/N1BKVwv.png)

  Terminate instanceで完全に削除しようとすると、以下の警告画面が表示されました

![file](https://i.imgur.com/B4U3LSz.png)

  Elastic IPsを削除しないと、まだ時間単位で費用発生するよと。後で削除するので、Terminate。

- Elastic IPsを削除

![file](https://i.imgur.com/pbzIHI3.png)

  "Release Elastic IP address"でIPを開放と削除します。

- Cloudfrontを削除

![file](https://i.imgur.com/Yoj0oN2.png)

  画面にあるDisableを選択しましたら、以下の警告画面が表示されました

![file](https://i.imgur.com/HLt0qxH.png)

  Disableを選択します。

- Route 53を削除

![file](https://i.imgur.com/hUsXSJd.png)

![file](https://i.imgur.com/NaYG5Oo.png)

  Deleteを押しますと、以下の警告画面が出ましたが、deleteを入力します。

![file](https://i.imgur.com/KnhGzlO.png)

  きれいに削除し終わった後の画面

![file](https://i.imgur.com/4h9h8CF.png)

- VPCを削除

![file](https://i.imgur.com/kEYjaq9.png)

  順番に選択し、1つずつActionsのDelete VPCで削除します。
  VPCが削除されると、作成されたSubnetsInternet Gatewaysなども一緒に削除されるみたい。



# 参考資料
- [GitHub Pages + CloudFlare で独自ドメインをSSL化する](https://zenn.dev/noraworld/articles/use-ssl-on-github-pages-with-cloudflare))
- 
