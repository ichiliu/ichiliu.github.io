---
layout: post
title: CloudFront+EC2でSSL通信させる
permalink: /it/cloudfrontec2でssl通信させる
subtitle: 
cover-img: [/assets/img/cover/it1.jpg, /assets/img/cover/it2.jpg, /assets/img/cover/it3.jpg]
thumbnail-img: https://i.imgur.com/6HXCtWF.png
share-img:
tags: [AWS, CloudFront, SSL]
categories: [IT]
---

## 背景
AWSの1年の無料枠の利用が終わり、10月に丸々課金されるようになりました。超円安が拍車を掛けて、なんと、EC2が1台だけなのに、4,400円もかかりました。超痛いです。。

課金明細をみてみますと
![file](https://i.imgur.com/oUfdeo1.png)
と、EC2よりもALBのほうが高く、16.75ドルも掛かりました。ALBは開始しただけで、利用がなくても毎月約740時間の料金が掛かりますので、自分のような利用状況では、本当に無駄な出費です。

![file](https://i.imgur.com/6HXCtWF.png)

## やりたいこと
ALBを使わないで、無料で発行されたSSL証明書を使ってSSL通信させるたい。

### 調査
[AWSでWebサイトをHTTPS化 全パターンを整理してみました](https://recipe.kc-cloud.jp/archives/11067/) を見つけました。

その中にある「パターン7：CloudFront(+証明書)→EC2」がまさに自分のニーズに一番あっています。CloudFrontはEdgeとして、キャッシュしてくれるだけでなく、SSL終端としてACMで発行された証明書をおけます。何より一番のメリットは、通信トラフィックの従量制であること、自分がブログはトラフィックが少ないので、費用を小さく抑えられそう（仮説）。

また、浮いた費用をEC2のスケールアップやスケールアウト、or/and S3によるデータバックアップにも使えます（今後TBD）。

## 構築手順
### CloudFront構築
『CloudFront』サービスを検索する。
![file](https://i.imgur.com/tQqiIFf.png)

ちなみに、下記料金表をみると、自分の場合は毎月ほぼ「無料」でいけます。
![file](https://i.imgur.com/zkiAqnT.png)

#### オリジン
「CloudFrontディストリビューションを作成」 を押下。
![file](https://i.imgur.com/po7lDop.png)
`オリジンドメイン`のプラダウンには、以前設定済のALBが選択可能になっているが、今回はそれを使わないで、EC2を直接オリジンにするため、EC2のパブリックDNSを入力する必要があるようです。

しかし、以前作成したEC2には、何とパブリックDNSが付いていませんでした（「-」と表示）。焦りましたが、下記資料を参考に、以前作成したVPCを編集して、DNSホスト名を有効化しました。

[AWSでPublic DNS(パブリックDNS)が割り当てられない時の解決法](https://qiita.com/sunadoridotnet/items/4ea689ce9f206e78a523)

![file](https://i.imgur.com/rwwOjBz.png)

プロトコルに「HTTP のみ」 にします（CloudFront->(HTTP)->オリジンの意味）。
![file](https://i.imgur.com/naORM7V.png)

オリジンの他の設定はそのまま。
![file](https://i.imgur.com/nroIWnx.png)

追加設定の所で、接続タイムアウトをデフォルトの10から20に変更しました。
![file](https://i.imgur.com/GM1URbQ.png)

#### デフォルトのキャッシュビヘイビア
下図：HTTPメソッドは「GET, HEAD, OPTIONS, PUT, POST, PATCH, DELETE」にしました。理由は`WordPress`は動的HTMLコンテンツのため。また、「HTTPメソッドをキャッシュ」のオプションにチェックをしておきます。

![file](https://i.imgur.com/uHhVfv4.png)

下図：キャッシュキーとオリジンリクエストは一旦デフォルトのまま。

![file](https://i.imgur.com/2Sav6Ps.png)

下図：追加設定もデフォルトのまま。

![file](https://i.imgur.com/rGh2eK2.png)

#### 関数の関係付け（オプション）
これもデフォルトのままで。
![file](https://i.imgur.com/YwjFSoM.png)

#### 設定
料金クラスを、すべてのエッジロケーションを使用することにします。
「代替ドメイン名 (CNAME) - オプション」に項目を追加し、自分が取得したドメインを入力します。更に、「カスタム SSL 証明書 - オプション」 のプルダウンから、以前作たACM 証明書を選択します。

![file](https://i.imgur.com/wd54bIj.png)

残り項目はデフォルトのままにします。
![file](https://i.imgur.com/a4bzWk2.png)

最後に、「ディストリビューションを作成」ボタンを押して作成すると、以下のエラーが出ました。
![file](https://i.imgur.com/ioAZ5Hf.png)

なるほど、接続タイムアウトは最大でも10秒という制約があるようです。仕方なく、「オリジン」の「追加設定」の所に戻り、10秒に戻しました。そうしたら、無事にディストリビューションの作成ができました。

### CloudFrontでWordPressを配信
ディストリビューションの作成まで完了したら、静的なコンテンツページは問題なく閲覧できました。やった！と思って、費用が高かったALBをすぐ削除しました。

が、しかし、、問題発生、  
管理画面に入るためのログインページからのログインがうまく行かず、ずっと`Cookie`エラー画面が表示されていました。

![file](https://i.imgur.com/lIGV8E1.png)

ここで、ブラウザのCookieやアクセス履歴のキャッシュを削除したり、ネットでいろいろ検索結果を参考し`wp-config.php`をいじったりして、4,5時間を費やしましたが、解決できませんでした。

ブラウザやWordPressの設定を変えていないのに、ALBを利用した時にはできたのに、ALBを削除してCloudFrontをSSL終端にしたら、こういう現象が起きたのはなぜ？

#### 調査
CloudFrontがオリジンへリクエストする際、必要な`Cookie`が渡されていないから、オリジン側で正しくログイン処理ができていないではないかと、疑いをしました。

特に、下記2つの参考資料をみたら、間違いなく原因はそこにあると思って、次のキャッシュポリシーや、オリジンリクエストポリシーの作成に取り掛かることにしました。

* [CloudFront + WordPress 構成の必須設定](https://oji-cloud.net/2021/01/03/post-5293/)
* [【CloudFront】WordPressサイトを高速化してみた話](https://tech-blog.rakus.co.jp/entry/20220909/cloudfront)

#### キャッシュポリシーの作成
次のようにキャッシュポリシーを作成しました。名前はわかりやすければ何でもOK。
![file](https://i.imgur.com/gOn0ceD.png)

キャッシュキーに含めるヘッダーに、`Host`と`CloudFront-Forwarded-Proto`を設定し、クエリー文字列と`Cookie`は「すべて」を選択しました。

![file](https://i.imgur.com/DfRFVHG.png)

#### オリジンリクエストポリシーの作成
次のようにオリジンリクエストポリシーを作成しました。

![file](https://i.imgur.com/KKryAZM.png)

オリジンリクエストに含める文字列に「*preview*」を入力しました（previewは毎回オリジンにリクエストすると理解しましたが、間違っていたらごめんなさい）。

![file](https://i.imgur.com/o6oTo6K.png)

#### ビヘイビアのデフォルトに反映
次のように反映していきます。

![file](https://i.imgur.com/bbcIAiw.png)

#### キャッシュさせないビヘイビアを追加
下記3つのパスパターンごとに、それぞれビヘイビアを新規作成します。
* *.php
* *preview*
* /wp-admin/*

![file](https://i.imgur.com/SIiO0Xu.png)

他の設定項目は同じです。

![file](https://i.imgur.com/NXEgJT1.png)

最終的に、ディストリビューションにあるビヘイビアの一覧は以下です

![file](https://i.imgur.com/1cQSXLH.png)

## まとめ
ALBのかかる費用を節約するために、ALBを使わないで、これまでSSL終端をALBにしていたのを、CloudFrontに変更し、CDNによる高速化も得られるように`WordPress`の利用環境を変更しました。

しかし、将来1台のEC2ではものが足りなくて、嬉しい悲鳴をあげるぐらいBlogのPVが増えると、ALBをまた使う必要があります。その時の構成は、CloudFront->ALB->EC2 x 2（+S3）に変更する必要があるかもしれません。

## 参考リンク（特別THX!）
* [CloudFront + WordPress 構成の必須設定](https://oji-cloud.net/2021/01/03/post-5293/)
* [【CloudFront】WordPressサイトを高速化してみた話](https://tech-blog.rakus.co.jp/entry/20220909/cloudfront)
