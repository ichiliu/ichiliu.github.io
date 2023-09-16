---
layout: post
title: Migrate AWS EC2 WordPress to Github Pages
permalink: /it/migrate-aws-ec2-wordpress-to-github-pages
subtitle: 
cover-img: [/assets/img/cover/it1.jpg, /assets/img/cover/it2.jpg, /assets/img/cover/it3.jpg]
thumbnail-img: https://i.imgur.com/N1BKVwv.png
share-img:
tags: [Jekyll, Github Pages, Cloudflare]
categories: [IT]
---

<!-- vim-markdown-toc GFM -->

* [概要](#概要)
* [やりたいこと](#やりたいこと)
* [GitHub Pagesへの引越手順](#github-pagesへの引越手順)
  * [JekyllのTheme選定](#jekyllのtheme選定)
  * [Blog記事の移行](#blog記事の移行)
    * [imgur.com APIを利用した画像Upload](#imgurcom-apiを利用した画像upload)
    * [Vim編集時imgur.comの画像urlを貼り付ける](#vim編集時imgurcomの画像urlを貼り付ける)
  * [Custom Domain設定](#custom-domain設定)
  * [DNS設定変更](#dns設定変更)
    * [Aレコードの作成](#aレコードの作成)
  * [SSL証明書の設定](#ssl証明書の設定)
  * [Cloudflareの設定](#cloudflareの設定)
    * [SSL/TLS設定](#ssltls設定)
  * [Github PagesにてEnforce HTTPS設定](#github-pagesにてenforce-https設定)
  * [動作確認](#動作確認)
* [AWS EC2を削除](#aws-ec2を削除)
* [参考資料](#参考資料)

<!-- vim-markdown-toc -->

# 概要
2022-05-01に、はてなブログで記事（[AWS無料枠で1台のEC2上にWordPressを構築](https://gxliu.hatenablog.com/entry/2022/05/02/144244)）を書いた以来、AWS EC2を1台で、Blogサイトを運営して1年数ヶ月を経過しました。

AWSで運営する上で、勉強することも兼ねて得るものはありますが、毎月2~3千円の出費が発生します。
最近、記事を書く頻度が下がってきたこともあり、無料のサイトに記事を移行しようかと考えてました。

そこで思いついたは、Github Pagesです。
この記事は、AWS EC2で運営しているWordPressのBlogを、GitHub Pagesに移行するために書いたもの。

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

# GitHub Pagesへの引越手順
## JekyllのTheme選定
Jekyll Themes(http://jekyllthemes.org/) からいろいろ探して、Moonwalkを検討して途中まで
試しましたが、総合的に考えて結果、  
Beautiful Jekyll(http://jekyllthemes.org/themes/beautiful-jekyll)に決定。

## Blog記事の移行
要件：
- 移行前と移行後は同じURL。
- post記事にあるcover画像(フル幅)を、categoriesごとに3枚程度スライドショーさせる。
- WordPressの時のPrivate記事の一部を捨てるが、残したいものでそのまま公開したくない場合は、Jekyllの_drafts(下書き、ドラフト)ディレクトリ配下に移行。
- 基本はMarkdown(一部HTML形式も許容)形式のファイルにする。
- 画像ファイルは基本cover画像以外、すべて`imgur.com`にUploadする。
- 基本はVimでファイルを編集するため、画像はなるべくスクショをコピペ程度で簡単に`imgur.com`へUploadし、ついでにそのURLをMarkdownファイルに貼り付けられるようにしたい。

### imgur.com APIを利用した画像Upload
以下`macOS`上で動かす前提のbashスクリプトを書きました

```
#!/usr/local/bin/bash

IMAGEDIR="/tmp"
CURRENTTIME=`date +%s`
IMAGEFILENAME="imgur-${CURRENTTIME}.png"
TARGET="${IMAGEDIR}/${IMAGEFILENAME}"

screencapture -i "${TARGET}"

# ffmpegで幅を画像を600ピクセルにリライズ、高さを自動計算してアスペクト比を保つ
TMPIMG="${IMAGEDIR}/resized_img.png"
ffmpeg -i "${TARGET}" -vf scale=600:-1 ${TMPIMG} > /dev/null 2>&1

# imgru.comで作成したapplicationのclient-id
CLIENTID="<Client-ID>"

JSON_RES=$(curl --request POST --url https://api.imgur.com/3/image \
	-s --header "Authorization: Client-ID ${CLIENTID}" -F "image=@${TMPIMG}")

success=$(echo $JSON_RES | jq ".success")
if [ "$success" = "true" ]; then
	url=$(echo $JSON_RES | jq ".data.link")
	echo '![file]('$url')' | tr -d '"'
	rm -f ${TARGET}
fi

rm -f $TMPIMG
exit 0
```

このスクリプトのやっていること
- スクショーで画像を取得し、/tmp/に一時的に保存
- ffmpegで画像ファイルを横幅600ピクセルに変換
- imgur.com上で取得したOAuth2.0用のClient-IDを用いて、画像をimgur.comにupload
- 成功すると、レスポンスからimgur.comにあるupload後画像のurlを取得
- 標準出力に\![file]\(画像url\)を出力する

このスクリプトを利用して、`Vim`でmdファイルを編集中に画像urlを現在行に貼り付けるために、`.vimrc`に以下のようなplugin機能を作りました。

### Vim編集時imgur.comの画像urlを貼り付ける

```
function! InsertImgur2Markdown()
  " 外部コマンドを実行し、結果を取得
  let result = system('sh paste2md.sh')
  " 結果を現在の行に挿入
  call setline('.', trim(result))
endfunction
" Upload screenshot to imgur.com, insert its url to the current line
nnoremap <Leader>im :call InsertImgur2Markdown()<CR>
```
この記事にあるすべての画像もこの方法で`Vim`編集中に貼り付けました、結構便利。

## Custom Domain設定
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
  しばらくしてから、以下のように確認します

  ```
  $ dig <domain> +noall +answer -t A
      
  ; <<>> DiG 9.10.6 <<>> \<domain\> +noall +answer -t A
  ;; global options: +cmd
  <domain>.	240	IN	A	185.199.110.153
  <domain>.	240	IN	A	185.199.111.153
  <domain>.	240	IN	A	185.199.108.153
  <domain>.	240	IN	A	185.199.109.153
  ```
  - NSレコードの確認

  ```
  $ dig <domain> +noall +answer -t NS
  ; <<>> DiG 9.10.6 <<>> <domain> +noall +answer -t NS
  ;; global options: +cmd
  <domain>.	85282	IN	NS	sandy.ns.cloudflare.com.
  <domain>.	85282	IN	NS	nicolas.ns.cloudflare.com.
  ```

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

### SSL/TLS設定
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

削除Done(2023-09-16)。

# 参考資料
- [GitHub Pages + CloudFlare で独自ドメインをSSL化する](https://zenn.dev/noraworld/articles/use-ssl-on-github-pages-with-cloudflare))
- 
