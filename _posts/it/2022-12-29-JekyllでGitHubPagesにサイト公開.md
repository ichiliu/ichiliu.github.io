---
layout: post
title: JekyllでGitHub Pagesにサイト公開を試す
permalink: /it/github-pagesを理解する
subtitle: 
cover-img: [/assets/img/cover/it1.jpg, /assets/img/cover/it2.jpg, /assets/img/cover/it3.jpg]
thumbnail-img: https://i.imgur.com/YlRnWhB.png
share-img:
tags: [Jekyll, Github Pages]
categories: [IT]
---

# 概要
github pagesを理解するためにまとめたものです。

![file](https://i.imgur.com/YlRnWhB.png)

# GitHub Pagesとは
https://docs.github.com/ja/enterprise-server&#64;3.5/pages/getting-started-with-github-pages/about-github-pages
によると
>GitHub Pages は、GitHub Enterprise Server のリポジトリから HTML、CSS、および JavaScript ファイル を直接取得し、任意でビルドプロセスを通じてファイルを実行し、ウェブサイトを公開できる静的なサイトホスティングサービス

ということ。
簡単にいうと、`github.com`にアカウントがある人はどなたでも利用可能で、`HTML`や`Markdown`などで記述したコンテンツをWeb上公開させることが仕組みです。

`GitHub Pages`サイトには、次の使用制限があります
* `PHP`、`Ruby`、`Python`などのサーバーサイド言語をサポートしていない。
* ソースリポジトリには、1 GB の推奨上限があります。
* サイトは1GB以上であってはなりません。

# Jekyll（ジキル）について
https://docs.github.com/ja/enterprise-server@3.5/pages/setting-up-a-github-pages-site-with-jekyll/about-github-pages-and-jekyll
によると
>Jekyllは、GitHub Pagesに組み込まれている静的サイトジェネレータで、ビルドプロセスを容易化できます。 JekyllはMarkdownおよびHTMLファイルを取り込み、選択したレイアウトに基づいて、完成された静的ウェブサイトを作成します。 Jekyllは、Markdownと、サイトに動的コンテンツを読み込むテンプレート言語のLiquidをサポートします。

[Wikipedia](https://en.wikipedia.org/wiki/Jekyll_(software)?oldid=1008472594) によると、`Jekyll`は`GitHub.com`の創業者や前CEOである [Tom Preston-Werner](https://en.wikipedia.org/wiki/Tom_Preston-Werner) さんが2008年に最初に作られたという。

## Jekyllを理解する
[Jekyllの本家](https://jekyllrb.com/)
Features
1. Simple
  No more databases, comment moderation, or pesky updates to install—just your content. 
1. Static
  Markdown, Liquid, HTML & CSS go in. Static sites come out ready for deployment.
1. Blog-aware
  Permalinks, categories, pages, posts, and custom layouts are all first-class citizens here. 

## Jekyllを使用してGitHub Pagesサイトを作成する
ref: [参考資料](https://zenn.dev/sasakiki/articles/e4d5dd28700b16)　（この方の [github.comのリポジトリ](https://github.com/katsuharu/test-test)）

### 前提条件
[Quickstart](https://jekyllrb.com/docs/) のPrerequisitesを満たしているかをまず確認します。

#### rubyをインストール

`ruby`は`macOS`デフォルトの`/usr/bin/ruby`であるため、`brew`を使って最新バージョンをインストールします（参考：[Installing Ruby](https://www.ruby-lang.org/en/documentation/installation/)）。

```shell
$ brew install ruby
...省略...
```
<details>
  <summary>インストール直後にterminalに出ていた以下のメッセージ</summary>
  <div>
  
  ```shell
  ==> ruby
By default, binaries installed by gem will be placed into:
  /usr/local/lib/ruby/gems/3.1.0/bin

You may want to add this to your PATH.

ruby is keg-only, which means it was not symlinked into /usr/local,
because macOS already provides this software and installing another version in
parallel can cause all kinds of trouble.

If you need to have ruby first in your PATH, run:
  echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> /Users/xxxxxxxx/.bash_profile

For compilers to find ruby you may need to set:
  export LDFLAGS="-L/usr/local/opt/ruby/lib"
  export CPPFLAGS="-I/usr/local/opt/ruby/include"
  ```
  </div>
</details>
に従って`.bashrc`に設定しておきました。

最新の`ruby`をインストール後の環境。

|Softwares | Version Conditions | My Environment |
|:--|:--|:--|
| Ruby | ≧ 2.5.0 | 3.1.3p185 |
| RubyGems | - | 3.3.26 |
| GCC and Make | - | Apple clang version 14.0.0<br>GNU Make 3.81 |

#### bundlerとjekyllをインストール
```sh
$ sudo gem install jekyll bundler
...省略...
29 gems installed
```
上の状態では、`bundler`が`/usr/local/opt/ruby/bin/`にインストールされましたが、`jekyll`は正しくインストールされませんでした、なぞです。いろいろ調べました所、下記

[Troubleshooting](https://jekyllrb.com/docs/troubleshooting/#installation-problems) の「On macOS, you may need to update RubyGems (using sudo only if necessary):」からヒントを得ることができました。

```shell
$ sudo gem update --system
```
<details>
  <summary>上記コマンドラインの出力結果</summary>
  <div>
  
  ```shell
  Updating rubygems-update
Fetching rubygems-update-3.4.1.gem
Successfully installed rubygems-update-3.4.1
Parsing documentation for rubygems-update-3.4.1
Installing ri documentation for rubygems-update-3.4.1
Done installing documentation for rubygems-update after 116 seconds
Parsing documentation for rubygems-update-3.4.1
Done installing documentation for rubygems-update after 0 seconds
Installing RubyGems 3.4.1
  Successfully built RubyGem
  Name: bundler
  Version: 2.4.1
  File: bundler-2.4.1.gem
Bundler 2.4.1 installed
RubyGems 3.4.1 installed
Regenerating binstubs
Regenerating plugins
/usr/local/lib/ruby/site_ruby/3.1.0/bundler/version.rb:4: warning: already initialized constant Bundler::VERSION
/usr/local/lib/ruby/gems/3.1.0/gems/rubygems-update-3.4.1/bundler/lib/bundler/version.rb:4: warning: previous definition of VERSION was here
Parsing documentation for rubygems-3.4.1
Installing ri documentation for rubygems-3.4.1

# 3.4.1 / 2022-12-24

## Enhancements:

* Installs bundler 2.4.1 as a default gem.

# 3.4.0 / 2022-12-24

## Breaking changes:

* Drop support for Ruby 2.3, 2.4, 2.5 and RubyGems 2.5, 2.6, 2.7. Pull
  request #6107 by deivid-rodriguez
* Remove support for deprecated OS. Pull request #6041 by peterzhu2118

## Features:

* Add 'call for update' to RubyGems install command. Pull request #5922 by
  simi

## Enhancements:

* Add `mswin` support for cargo builder. Pull request #6167 by ianks
* Validate Cargo.lock is present for Rust based extensions. Pull request
  #6151 by simi
* Clean built artifacts after building extensions. Pull request #6133 by
  deivid-rodriguez
* Installs bundler 2.4.0 as a default gem.

## Bug fixes:

* Fix crash due to `BundlerVersionFinder` not defined. Pull request #6152
  by deivid-rodriguez
* Don't leave corrupted partial package download around when running out
  of disk space. Pull request #5681 by duckinator


------------------------------------------------------------------------------

RubyGems installed the following executables:
	/usr/local/Cellar/ruby/3.1.3/bin/gem
	/usr/local/Cellar/ruby/3.1.3/bin/bundle
	/usr/local/Cellar/ruby/3.1.3/bin/bundler

Ruby Interactive (ri) documentation was installed. ri is kind of like man
pages for Ruby libraries. You may access it like this:
  ri Classname
  ri Classname.class_method
  ri Classname#instance_method
If you do not wish to install this documentation in the future, use the
--no-document flag, or set it as the default in your ~/.gemrc file. See
'gem help env' for details.

RubyGems system software updated
  ```
  </div>
</details>

その後、次のように`jekyll`をインストールすることができました
```shell
$ sudo gem install jekyll
Password:
Successfully installed jekyll-4.3.1
Parsing documentation for jekyll-4.3.1
Done installing documentation for jekyll after 0 seconds
1 gem installed
$ which jekyll
/usr/local/opt/ruby/bin/jekyll
$ jekull -v
jekyll 4.3.1
```
ようやく`jekyll`コマンドをローカルで実行可能な状態にできました（長かった）。

### サイトを作成する
1. 公開対象用のプロジェクトを作成してgit初期化する。
  ```shell
  $ mkdir pages-test
  $ cd pages-test
  $ git init
  ```
1. 公開サイト用のテンプレートを生成する。
  ```
  $ jekyll new --skip-bundle .  
  New jekyll site installed in /Users/xxxxxxxx/dev/github/pages-test.  
  Bundle install skipped.   
  $ tree  
  .  
  ├── 404.html  
  ├── Gemfile   
  ├── _config.yml  
  ├── _posts  
  │   └── 2022-12-28-welcome-to-jekyll.markdown  
  ├── about.markdown  
  └── index.markdown  
  1 directory, 6 files
  ```
  このコマンドにより、デフォルトのテンプレート用の`markdown`ファイルや`Gemfile`などが生成されます。
1. `Gemfile`の内容を修正する。
  * gem "jekyll" の行をコメントアウト。
  * \# gem "github-pages" で始まる行を編集し、 行を次のように変更します。
    ```shell
	gem "github-pages", "~> GITHUB-PAGES-VERSION", group: :jekyll_plugins
	```
	GITHUB-PAGES-VERSION を、サポートされる最新バージョンの`github-pages gem`で置き換えますが、[Dependency versions](https://pages.github.com/versions/) をみると、最新が227でありました（2022/12/28時点）
1. `bundle install` により依存ライブラリをダウンロード。
  ```shell
  $ bundle install
  ```
1. 必要に応じて`jekyll`の設定ファイル`_config.yml`の内容を修正。
  ```shell
  $ vim _config.yml
url: ""  # the base hostname and protocol for your site, e.g. http://example.com
baseurl: /pages-test      # place folder name if the site is served in a subfolder
  ```
1. 変更内容を`git commit`してリモートリポジトリに`push`。
  ```shell
  $ git branch -m main
  $ git add .
  $ git commit -m 'Initial'
  $ git remote add origin git@github.com:USER/pages-test.git
  $ git push origin main
  ```

### Pagesをローカルでテストする
ref: [参考資料](https://docs.github.com/ja/enterprise-server&#64;3.5/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll)
* ローカルでJekyllサイトを実行する
  ```shell
  $ bundle add webrick # This may be needed if you use ruby 3 or higher
  $ bundle exec jekyll serve
  Configuration file: /Users/xxxxxxxx/dev/github/pages-test/docs/_config.yml
To use retry middleware with Faraday v2.0+, install `faraday-retry` gem
            Source: /Users/xxxxxxxxx/dev/github/pages-test/docs
       Destination: /Users/xxxxxxxxx/dev/github/pages-test/docs/_site
 Incremental build: disabled. Enable with --incremental
      Generating...
       Jekyll Feed: Generating feed for posts
                    done in 0.183 seconds.
 Auto-regeneration: enabled for '/Users/xxxxxxxx/dev/github/pages-test/docs'
    Server address: http://127.0.0.1:4000/
  Server running... press ctrl-c to stop.
  ```
  ブラウザから`http://127.0.0.1:4000/`にアクセスすると、
  ![file](https://i.imgur.com/8BlncHT.png)
  のように表示されました！　（Webサーバを止める時は`foregrand`で実行中の`terminal`にて`ctrl-c`で）。
  
  上のページの「Welcome to Jekyll!」リンクをクリックすると、次のような画面が表示されます。
  
  ![file](https://i.imgur.com/xnkyb9B.png)

## GitHub Pages上公開します
ref: [参考資料](https://docs.github.com/ja/enterprise-server&#64;3.5/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)

1. Deploy from a branch
　　![file](https://i.imgur.com/2QuSkYD.png)
1. `main`ブランチで`/root`配下を使う
  ![file](https://i.imgur.com/AzKB15L.png)
  「Save」ボタンを押します。
1. 設定後、自動で`GitHub Actions`の`workflow`が実行されてビルドとデプロイが実行される。
  ![file](https://i.imgur.com/GKAC6ZR.png)
1. 公開されたページを確認する。
  ![file](https://i.imgur.com/nlwVsRM.png)
1. デフォルト以外に追加したページの確認。
  上記ページにある [GitHub Pages Study](https://gxgliu.github.io/pages-test/blog/2022/12/29/github-pages.html) は`push`する前に新規作成したページ（`Post`ともいう）であり、作成方法とその中身は以下に説明します。
  `_post`フォルダに`2022-12-29-github-pages.md`ファイルを作成し、その先頭の一部を以下に示します。
  
  ```markdown
  ---
layout: post
title:  "GitHub Pages Study"
date:   2022-12-29 18:18:00 +0900
categories: blog
  ---

 # 概要
 github pagesを理解するためにまとめたものです。

 # GitHub Pagesとは
 ```

 `Post`を追加する際の書き方や注意事項などは、[この資料](https://e-joint.jp/321/) がいい参考になります。
  
# まとめ
`Jekyll`を使って`GitHub Pages`に`Markdown`形式のファイルを公開する方法を試しました。純粋なテキストファイルベースで、手軽に利用できることが一番の魅力かなと感じました。当然、`Jekyll`を使わないで、静的な`index.html`ファイルを作って公開する方法ももちろん可能ですが、これについて今回は割愛します。

# 参考資料
* [Jekyll Step by Step Tutorial](https://jekyllrb.com/docs/step-by-step/01-setup/)
  * [Themes](http://jekyllrb-ja.github.io/docs/themes/)
* [ekyllのテーマを自作する方法基本編の連載](https://e-joint.jp/348/)
* [Jekyll でCSVファイルを読み込んでHTMLとして表示](https://qiita.com/gatespace/items/2ba2268f2cb4880eb66c)
* [[Shopify] Liquidで日付を取得して比較する方法](https://ec-penguin.com/blogs/shopify/compare-date-values)
* [HTMLの表tableやリストデータを並べ替える方法（ソートボタン実装）](https://lpeg.info/html/table_list_sort.html)

