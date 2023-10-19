---
layout: post
title: Blogの各記事の可読性を自動チェック
subtitle: 
cover-img: [/assets/img/cover/it1.jpg, /assets/img/cover/it2.jpg, /assets/img/cover/it3.jpg]
thumbnail-img: https://i.imgur.com/D4pD7kM.png
share-img:
tags: [Web Monitoring, Automation]
categories: [IT]
---

## 概要
Blogサイトの各記事が正しく訪問できるかの自動チェックを導入（簡単にいうと、404になっていないかの自動チェック）。

![file](https://i.imgur.com/D4pD7kM.png)

<!-- vim-markdown-toc GFM -->

* [Why](#why)
* [How](#how)
* [Steps](#steps)
  * [自動チェックのスクリプト作成](#自動チェックのスクリプト作成)
  * [`github.com`の`workflow`作成](#githubcomのworkflow作成)
* [動作確認](#動作確認)
* [まとめ](#まとめ)

<!-- vim-markdown-toc -->

## Why
`Jekyll`を色々設定いじると、稀にこれまで問題なく読めていた記事が`404`のエラー画面になってしまう場合があります。気づかないまま時間がたってしまい、後になって慌てて対応した記憶があるので、自動チェックしようと思ったのがきっかけ。

## How
まずすぐ思いついたのは`CI`での自動チェック。なぜかというと、`Jekyll`で構築しているため、`git push`するために、Webページが再ジェネレートされるので、それをトリガーに自動チェックするのが、一番効率がよくてすぐ気づくから。

## Steps
### 自動チェックのスクリプト作成
一番手取り早いのは、`sitemap.xml`から各記事のURLを取得し、それをループ回してチェックする。正常に訪問可能の判断条件は、レスポンスヘッダーの`HTTP/2 200`から、`200`なら正常、それ以外なら異常と簡単に判断する方法にしました。

また、 チェックする度に、URLの一覧をテキストファイルに落とし、異常判定した場合に、該当のURLと`http code`をログに落とすようにしました（配置場所は`scripts/check_urls.sh`）

```bash
#!/usr/bin/env bash

# Anti UTC
export TZ=Asia/Tokyo

# URL of your sitemap.xml
SITEMAP_URL="https://guaiguailei.net/sitemap.xml"

# Function to URL decode
urldecode() {
  # URL decode using Bash built-ins
  echo -e "$(sed 's/+/ /g; s/%\([0-9a-fA-F][0-9a-fA-F]\)/\\x\1/g')"
}

# Function to log messages with timestamp
log_message() {
  local message="$1"
  local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  echo "$timestamp $message" >&2
}

# Log start time
log_message "Execution started."

# Download sitemap.xml and decode URLs
curl -sL "$SITEMAP_URL" | grep -o "<loc>[^<]*" | sed 's/<loc>//' > decoded_sitemap.txt
urls=($(cat decoded_sitemap.txt))

# Iterate through URLs
for url in "${urls[@]}"; do
  decoded_url=$(urldecode <<< "$url")
  response=$(curl -Is "$decoded_url" | head -n 1)
  http_status=$(echo "$response" | cut -d' ' -f2)
  
  if [[ -z "$http_status" ]]; then
    http_status="N/A"
  fi
  
  echo "$decoded_url" # Save the URL for investigation
  
  if [[ "$http_status" != "200" ]]; then
    log_message "URL $decoded_url failed (HTTP $http_status)"
  fi
done

# Log end time
log_message "Execution completed."

# Clean up temporary files
rm -f decoded_sitemap.txt
```

URLの一覧を標準出力、ログをエラー出力にしたのは、後で説明する`workflow`から1行で両方を取れるようにしたいから。

簡単なテストで問題なくできていることをまず確認しました。

### `github.com`の`workflow`作成
`check_urls.yml`というファイルを作成しました。

```yml
name: Check URLs

on:
  push:
    branches:
      master

jobs:
  check-urls:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout code
      uses: actions/checkout@v2 # repoのコードをCheck Out

    - name: Set up Node.js
      uses: actions/setup-node@v2
      with:
        node-version: 16

    - name: Run Script and Save Output
      run: |
        ./scripts/check_urls.sh > urls.txt 2> crawl.log

    - name: Move and save output
      run: |
        mkdir -p logs
        mv urls.txt crawl.log logs/

    - name: Commit and push changes
      run: |
        git config --global user.email "<my mail address>"
        git config --global user.name "ichiliu"
        git add logs/{urls.txt,crawl.log}
        git commit -m "Check URLs"
        git push
```

## 動作確認
ファイルを作ったので、`git push origin master`したら、ジョブが走り、約30秒くらいに無事完了しました（途中で何回もジョブ失敗しましたが、何とか原因を突き止めて解決しました）

直前で成功したジョブのスクショ

![file](https://i.imgur.com/5h1SJ04.png)

問題なく、意図した通りに、`logs/`配下に、`urls.txt`と`crawl.log`が正しく出力されました。

![file](https://i.imgur.com/n1iLpe3.png)

`crawl.log`の中身

```text
2023-10-20 01:29:23 Execution started.
2023-10-20 01:29:37 Execution completed.
```

`urls.txt`の中身

```html
https://guaiguailei.net/2020-02-26-flake-it-till-you-make-it
https://guaiguailei.net/2020-02-28-sample-markdown
https://guaiguailei.net/gourmet/2022-05-01-今日の晩ごはん
https://guaiguailei.net/travel/2022-05-02-アンデルセン公園
https://guaiguailei.net/gourmet/2022-05-03-海底撈火鍋上野店
https://guaiguailei.net/cat/2022-05-05-美貓魚
https://guaiguailei.net/it/2022-05-05-EC2からSES経由でメール送信する
https://guaiguailei.net/life/2022-05-05-市川市的鲤鱼旗
https://guaiguailei.net/other/2022-05-05-東京三越前散策
https://guaiguailei.net/travel/2022-05-06-流山之行
https://guaiguailei.net/it/2022-05-09-blog環境改造記
https://guaiguailei.net/study/2022-05-09-cissp_chapter13
https://guaiguailei.net/travel/2022-05-20-寻踪周树人and藤野先生at仙台
https://guaiguailei.net/gourmet/2022-05-30-食and夜at仙台
https://guaiguailei.net/travel/2022-06-18-冲绳到此一游
https://guaiguailei.net/study/2022-06-23-cissp_chapter14
https://guaiguailei.net/security/2022-06-26-about-sso
https://guaiguailei.net/life/2022-08-07-TAKAGI製の水栓修理DIY
https://guaiguailei.net/study/2022-08-25-cissp_chapter15
https://guaiguailei.net/study/2022-09-18-cissp_chapter16
https://guaiguailei.net/travel/2022-09-18-福岡市出張
https://guaiguailei.net/other/2022-09-25-global-famous-cars
https://guaiguailei.net/study/2022-09-26-about-toefl-ibt-test
https://guaiguailei.net/study/2022-10-04-cissp_chapter17
https://guaiguailei.net/it/2022-10-17-EC2のディスク使用量の解決方法
https://guaiguailei.net/it/2022-11-04-CloudFrontでSSL通信させる
https://guaiguailei.net/it/2022-11-06-BackupEBStoS3byAMI
https://guaiguailei.net/life/2022-11-13-BBQat水元公園
https://guaiguailei.net/study/2022-11-17-cissp-chapter18
https://guaiguailei.net/it/2022-11-17-macOSのpache2にSSLの自己証明書を導入
https://guaiguailei.net/it/2022-11-19-DXレポートの読後感
https://guaiguailei.net/life/2022-11-21-日本で定年退職後に変わることメモ
https://guaiguailei.net/security/2022-11-21-aboutopenssf
https://guaiguailei.net/study/2022-12-07-大学入学共通テストまとめ
https://guaiguailei.net/it/2022-12-13-macOSのApacheのhttpdの自動再起動設定
https://guaiguailei.net/cat/2022-12-25-我家猫的新小伙伴
https://guaiguailei.net/it/2022-12-29-JekyllでGitHubPagesにサイト公開
https://guaiguailei.net/it/2023-01-01-WordPress的用法TIPS
https://guaiguailei.net/life/2023-01-03-2023年お正月東京浜離宮庭園で放鷹術を見学
https://guaiguailei.net/technology/2023-01-31-lotsoftip10of2022
https://guaiguailei.net/it/2023-02-10-mac本地使用screwdriver验证
https://guaiguailei.net/it/2023-02-11-nodejs-npm-study
https://guaiguailei.net/study/2023-02-16-ChatGPTをお試し
https://guaiguailei.net/study/2023-02-21-Flutterを使ってみた
https://guaiguailei.net/security/2023-03-02-penetration-testing-study
https://guaiguailei.net/study/2023-03-02-cissp-chapter19
https://guaiguailei.net/it/2023-03-07-gmailでPGPを使ったメール暗号化の検証
https://guaiguailei.net/study/2023-03-15-finance-study
https://guaiguailei.net/life/2023-03-18-梅と桃のお花見
https://guaiguailei.net/it/2023-03-21-macos-usage-tips
https://guaiguailei.net/it/2023-03-26-openaiのdall-e2を試してみました
https://guaiguailei.net/it/2023-03-26-画像生成aiのmidjourney
https://guaiguailei.net/books/2023-04-16-issueからはじめようの読書筆記
https://guaiguailei.net/security/2023-04-16-pcidssv4読書筆記
https://guaiguailei.net/study/2023-04-27-about-nft
https://guaiguailei.net/books/2023-04-30-基本から学ぶテストプロセス管理の読書筆記
https://guaiguailei.net/travel/2023-05-05-2023年黄金周自驾游东日本走起
https://guaiguailei.net/life/2023-05-14-修心養性
https://guaiguailei.net/travel/2023-05-26-天満宮and東照宮at仙台
https://guaiguailei.net/travel/2023-05-27-再游冲绳at2023-05
https://guaiguailei.net/study/2023-05-30-cissp-chapter20
https://guaiguailei.net/security/2023-06-20-owasp-api-security-top10-study
https://guaiguailei.net/security/2023-06-24-owasp-top10
https://guaiguailei.net/study/2023-07-19-ソフトウェアライセンスの学習メモ
https://guaiguailei.net/it/2023-07-21-coding-styles
https://guaiguailei.net/life/2023-08-26-在macOS上看网络电视
https://guaiguailei.net/it/2023-09-15-good-bye-aws-ec2-wp
https://guaiguailei.net/life/2023-09-16-my-hometown
https://guaiguailei.net/it/2023-09-17-add-disqus
https://guaiguailei.net/security/2023-09-20-aws-security-services
https://guaiguailei.net/security/2023-09-28-vuln-mgt-cvss-ssvc
https://guaiguailei.net/study/2023-10-03-cissp-chapter21
https://guaiguailei.net/it/2023-10-17-seo
https://guaiguailei.net/aboutme
https://guaiguailei.net/category/books
https://guaiguailei.net/category/cat
https://guaiguailei.net/category/gourmet
https://guaiguailei.net/
https://guaiguailei.net/category/it
https://guaiguailei.net/category/life
https://guaiguailei.net/category/other
https://guaiguailei.net/category/security
https://guaiguailei.net/category/study
https://guaiguailei.net/tags
https://guaiguailei.net/category/travel
https://guaiguailei.net/logs/
https://guaiguailei.net/page2/
https://guaiguailei.net/page3/
https://guaiguailei.net/page4/
https://guaiguailei.net/page5/
https://guaiguailei.net/page6/
https://guaiguailei.net/page7/
https://guaiguailei.net/page8/
```

## まとめ
今回は、Webページが正しく開けるかの簡単な判定方法を使って、`CI`の自動ビルドを利用して自動チェックする仕組みを導入しました。結果確認するには、`logs/crawl.log`を開いて確認することにとどまっていますが、異常判定があったら、うまくWeb通知することもできるといいかもですね。

