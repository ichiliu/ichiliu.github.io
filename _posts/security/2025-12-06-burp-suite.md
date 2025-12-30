---
layout: post
title: Burp Suiteを初期設定
subtitle: 
cover-img: [/assets/img/cover/security1.jpg, /assets/img/cover/security2.jpg, /assets/img/cover/security3.jpg]
thumbnail-img: 
share-img:
tags: [Security, Burp Suite]
categories: [Security]
---

<!-- vim-markdown-toc GFM -->

* [Burp Suiteについて](#burp-suiteについて)
* [Burp Suiteのインストール](#burp-suiteのインストール)
* [Burp Suiteを起動する](#burp-suiteを起動する)
* [BurpのProxy機能](#burpのproxy機能)
  * [Burp Proxyを設定](#burp-proxyを設定)
* [Webブラウザのプロキシサーバ設定](#webブラウザのプロキシサーバ設定)
  * [警告画面が表示された原因](#警告画面が表示された原因)
* [Burp Suite証明書のインポート](#burp-suite証明書のインポート)
* [通信の書き換えの動作確認](#通信の書き換えの動作確認)
  * [やられサイトのダウンロード](#やられサイトのダウンロード)
  * [やられサイトをローカルで動作させる](#やられサイトをローカルで動作させる)
  * [ブラウザからやられサイトにアクセス](#ブラウザからやられサイトにアクセス)
  * [HTTP通信の書き換え](#http通信の書き換え)

<!-- vim-markdown-toc -->

# Burp Suiteについて
`Burp Suite` は、Web アプリケーションのセキュリティを検査するための強力な統合プラットフォーム。プロキシ、スキャナ、リピーター、インターセプターなど多彩なツールが統合されており、手動ペンテストから自動脆弱性スキャンまで柔軟に対応できる。初心者からベテランまで、幅広いレベルのセキュリティテストに対応可能な点が最大の特徴。

今回は、`macOS` に `Burt Suite Communication Edition` をインストールして初歩的な動作確認までやってみる。

# Burp Suiteのインストール
下記サイトから自分のPCに合うバージョンをインストールする（自分は`2022.3`をインストールした）

https://portswigger.net/burp/communitydownload

![file](https://i.imgur.com/JJ3hVBv.png)

# Burp Suiteを起動する
アプリケーションから `Burt Suite Communication Edition` を起動すると、最初から「Temporary project」が選択されているのでそのまま「Next」をクリック。

![file](https://i.imgur.com/yIjICPh.png)

デフォルト設定の「Use Burp defaults」が選択されたままで、右下の「Start Burp」をクリック。

![file](https://i.imgur.com/jdRm8GH.png)

しばらくすると、無事に起動することができた。

![file](https://i.imgur.com/TAQ4N7B.png)

# BurpのProxy機能
Burp の Proxy 機能は、ブラウザとサーバの通信を中継し、HTTP/HTTPS リクエストを任意に確認・改変できる仕組みである。通信内容をその場で止めて解析したり、任意の値を書き換えて再送したりすることで、Web アプリの挙動を深く理解しながらテストを進められる点が特徴。

## Burp Proxyを設定
Proxy Listenersの設定として、デフォルトの`127.0.0.1:8080` を使用。`Edit`をクリックし`proxy listener`画面にて`Binging`タブの設定をデフォルトの`8080`,「Bind to address:」項目は`Loopback only`設定のまま。

注：「Loopback only」とは、リスナーを**ローカルホスト（127.0.0.1）**のみにバインドすることを意味する。こうすることで、次のような通信が制限され、セキュリティ上より安全になる

- 接続可能：同じパソコン上で動いているWebブラウザやアプリケーション。
- 接続不可：外部のNWや、同じNW上の他のホストからこのプロキシに接続して通信することはできない。

# Webブラウザのプロキシサーバ設定
Webブラウザのプロキシ設定を管理する手間を削減するため、Firefoxの「FoxyProxy」拡張機能をインストールする。

![file](https://i.imgur.com/6Hnb7Gv.png)

`FoxyProxy` のプロキシを次のように設定する

![file](https://i.imgur.com/DmN1mCZ.png)

しかし、この状態でWebサイト（例：`https://www.yahoo.co.jp/`）にアクセスすると、次のような警告画面が表示されてしまう。理由は、Webブラウザに `Burp Suite` の証明書がインポートされていないから。

![file](https://i.imgur.com/vUj63Bx.png)

## 警告画面が表示された原因
1. FirefoxはHTTPSで`Yahoo!JAPAN`に接続しようとする  
    本来ならFirefox →（直接）→ YahooサーバへTLS（HTTPS）の暗号化通信が張られるはずである。
    しかし、`FoxyProxy` により"全ての通信は Burp（localhost:8080）に送れ" という設定になっている。
1. Firefox の HTTPS リクエストは “まず`Burp`へ” 送られる。つまり
    ```javascript
    Firefox → Burp Proxy（localhost:8080） → Yahooサーバ
    ```
1. BurpはHTTPSを解析するため、Yahoo用の“偽装証明書”を動的に生成
1. FirefoxはBurpが自動生成した"偽のYahoo証明書"を受け取る
1. FirefoxはBurpが自動生成した"偽のYahoo証明書"を受け取る  
    FirefoxはBurpのCA証明書を信頼していない状態であるため、
    - その偽装証明書は「不正な署名の証明書」
    - 「真正な認証局が発行したものではない」
    - 「中間者攻撃の可能性あり」  
  と判断する。
1. 結果、Firefoxが“接続は安全ではない”と警告表示

# Burp Suite証明書のインポート
別のWebブラウザ（Chromeなど）にて、Burp Suiteの証明書をダウンロードするため、
`http://127.0.0.1:8080`にアクセス

![file](https://i.imgur.com/xuo0sEG.png)

右上の「CA Certificate」をクリックし証明書を保存し、その後、`Firefox`の「設定」→「プライバシーとセキュリティ」画面にて、「証明書」項目の所に「証明書の表示」をクリック

![file](https://i.imgur.com/OECOk5G.png)

「読み込む...」で、先程DLした `Burp Suite` の証明書を読み込ませて、ポップアップに表示されているチェックボックスにチェックを入れて「OK」を押す。

![file](https://i.imgur.com/e1pnI4d.png)

インストールできた場合、次のように`PortSwigger CA`が証明書一覧に追加されるはず。

![file](https://i.imgur.com/hVUm4Iy.png)

これで、先程アクセスする際警告画面が表示されるWebページに問題なくアクセスできるはず（体感的に普段より若干遅い）

# 通信の書き換えの動作確認
## やられサイトのダウンロード
まず、ローカル環境に自由に診断できるやられサイトをダウンロード。

以下のサイトからjarファイルをダウンロードする

https://github.com/ankokuty/HakoniwaBadStore

![file](https://i.imgur.com/grSUHrp.png)

「ダウンロード」にある「HakoniwaBadstore.jarを[ここ](https://github.com/ankokuty/HakoniwaBadStore/releases)からダウンロードしてください」

[Hakoniwa.BadStore.jar](https://github.com/ankokuty/HakoniwaBadStore/releases/download/v1.3/Hakoniwa.BadStore.jar)

をDLし、専用のフォルダに保存しておくとよい。

## やられサイトをローカルで動作させる
Burp Suiteの「Extender」タブ→「Add」でExtension typeは「Java」を選択、「Select file」をクリックし、先ほどDLした「Hakoniwa.BadStore.jar」ファイルを選択。

新たに追加された「BadStore」タブを選択し、左側の「Port」に使用していないポート番号を設定（「8528」）。  
「Stopped」ボタンを押下し「Running」状態にする（http://127.0.0.1:8528）。

![file](https://i.imgur.com/7IDEOu9.png)

## ブラウザからやられサイトにアクセス
http://localhost:8528/cgi-bin/badstore.cgi

![file](https://i.imgur.com/MZyBvg4.png)

## HTTP通信の書き換え
「Proxy」タブの「Intercept」を選択し、「Intercept is on」をクリックして通信をキャプチャできる状態に。

![file](https://i.imgur.com/D5zhVS5.png)








