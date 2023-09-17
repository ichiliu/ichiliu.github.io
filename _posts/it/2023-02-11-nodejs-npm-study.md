---
layout: post
title: Node.js NPM Study
permalink: /it/node-js-study
subtitle: 
cover-img: [/assets/img/cover/it1.jpg, /assets/img/cover/it2.jpg, /assets/img/cover/it3.jpg]
thumbnail-img: https://i.imgur.com/a70XpT1.png
share-img:
tags: [node.js, npm]
categories: [IT]
---

<!-- vim-markdown-toc GFM -->

* [概要](#概要)
* [NPM](#npm)
  * [プロジェクト=パッケージ](#プロジェクトパッケージ)
  * [package.json](#packagejson)
    * [パッケージ作成](#パッケージ作成)
      * [dependenciesの表記](#dependenciesの表記)
      * [scripts](#scripts)
      * [main](#main)
      * [bin](#bin)
  * [package-lock.json](#package-lockjson)
  * [package.jsonとpackage-lock.jsonの優先順位](#packagejsonとpackage-lockjsonの優先順位)
  * [ユースケース](#ユースケース)
    * [npm install](#npm-install)
    * [npm install <package>](#npm-install-package)
    * [npm audit](#npm-audit)
* [参考資料（THX）](#参考資料thx)

<!-- vim-markdown-toc -->
# 概要
`Node.js`を仕事上で最近1,2ヶ月初めて使うようになったので、調べて理解したものをまとめる（といっても内容的なは初歩的なものである）。

![file](https://i.imgur.com/a70XpT1.png)

# NPM
`npm（node package manager）`は、`node.js`のパッケージを関するする`CLI`。パッケージの
* 作成
* インストール
* `npm`への公開

などができる。別の`CLI`である`Yarn`（「ヤーン」、`Facebook`が開発した）もあるが、やはり`npm`が一番メジャーである。

## プロジェクト=パッケージ
プロジェクト=コードのまとめり（`repo`単位とリニアイコールと考えてもいいかもしれない）。

## package.json
パッケージ管理の設計書みたいなもので、`package.json`を読み込むことで同じパッケージをインストールすることができるような仕組みになっている。

`npm`では、「パッケージ=`package.json`がいる**親ディレクトリ**に含まれるファイル群」であり、`npm`のコマンドは、通常`package.json`がいるプロジェクトの「ルートディレクトリ」で実行される。

### パッケージ作成
パッケージの「ルートディレクトリ」にて、下記コマンドを実行し、`package.json`を生成する。インタラクティブの質問をスキップするには`-y`オプションを付ける。

以下に、`npm init`を実行した際に出てきた質問のデフォルトと意味あいを書いておく。
```sh
$ npm init
This utility will walk you through creating a package.json file.
It only covers the most common items, and tries to guess sensible defaults.

See `npm help init` for definitive documentation on these fields
and exactly what they do.

Use `npm install <pkg>` afterwards to install a package and
save it as a dependency in the package.json file.

Press ^C at any time to quit.
```

|質問|説明|
|:--|:--|
|package name: (user_details)|デフォルトは括弧内のディレクトリ名|
|version: (1.0.0)|デフォルト`1.0.0`|
|description:|説明|
|entry point: (user_details.js)|エントリポイント。デフォルトは中にある`js`ファイル名（複数ある場合は？）|
|test command:|テスト用のスクリプト|
|git repository:|`git repo URL`|
|keywords:|パッケージ公開時のための検索キーワード|
|author:|著者|
|license: (ISC)|パッケージのライセンス|

#### dependenciesの表記
`Semver (Semantic Versioning）`の規則に従う必要がある（`3.1.4`があるとする場合、`3`は`Major`、利用側は一般的にプログラム修正が必要、`1`は`Minor`、新機能追加だが、利用側は修正しなくてもそのまま使える。`4`は`Patch`で、不具合修正などでバージョンが上がる）。
```
  "dependencies": {
    "express": "^4.17.1",
    "request": "~2.88.0"
  },
```
`^`（キャレット， `caret`）や`~`（チルダ、`tilde`）を先頭に付ける場合とつけない場合の意味合いを下表にまとめた。

|例|意味あい|
|:--|:--|
|`^3.1.4`|`Major`は一致し`Minor`と`Patch`は指定されたもの以上。`3.2.5`は合致、`3.1.3`は合致しない|
|`~2.7.18`|`Major`と`Minor`は一致し`Patch`は指定されたもの以上。`2.7.20`は合致、`2.8.8`は合致しない|
|`0.6.18`|先頭に何も付いていない場合はちょうどそのバージョンである|

`package-lock.json`がなく、`dependencies`がローカルにインストールされていない状態で`npm install`が実行されると、`package.json`　にある`dependencies`のルールに従い、指定されたバージョンにマッチする中で**最も新しいバージョン**がインストールされる。

`dependencies`を編集（追加/バージョン変更など）をする際、`package.json`は直接編集しないで、`npm`を通じて行うべき。
注意：`npm v4`までは、`dependencies`として追加するときに`--save`を指定しないと`package.json`に反映されないが、`npm v5`以降はデフォルトで反映するようになった。

`devDependency（devDep）`として追加する場合は`-D（--save-dev`のエイリアス）を指定する。

バージョン指定する場合は、`package@version`の形を書けばいい、例：
```
$ npm install react@latest
$ npm install request@2.88.2
```
パッケージの削除は`npm uninstall <package>`。

#### scripts
```
"scripts": {
    "start": "node index.js",
    "lint": "eslint",
    "cmd": "command arg",
	"precmd": "pre command arg",
	"postcmd": "post command arg"
  },
```
コマンドの別名（エイリアス）であり、`npm run <name>`のように実行できる。`pre<name>`や`post<name>`の別名があると、`cmd`の実行前に`precmd`が、実行後`postcmd`が実行される具合。

#### main
そのパッケージを外からインポートするときにどの JavaScript ファイルが入り口であるかを指定するものである。例えば、パッケージ`request`を利用する場合、
```
const req = require('request');
```
その`request`の`package.json（node_modules/request/package.json)`をみると、
```
省略
  "license": "Apache-2.0",
  "engines": {
    "node": ">= 6"
  },
  "main": "index.js",
  "files": [
    "lib/",
    "index.js",
    "request.js"
  ],
  "dependencies": {
    "aws-sign2": "~0.7.0",
省略
```
のように、`main: index.js,`になっている。これは、`index.js`がエクスポートした値が、`require('request')`の戻り値になることを表している。

`index.js`の中身をみると、`module.exports = request`になっている。その値が、`const req`に代入されていることになる。

```
// Exports

module.exports = request
request.Request = require('./request')
request.initParams = initParams
```
`package.json`の`main`は、そのパッケージを`NPM`で公開しない限り重要ではない。

#### bin
`bin`も、外から使われるものでなければ重要ではないものなので、割愛する。

## package-lock.json
`dependency`のバージョンを`lock`(固定)するためのファイルであり、`npm install`の実行時に自動的に作成される。`npm v5`以降に導入され、`dependency、dependency`の`dependency`...と間接的なものも含めすべての`dependency`のバージョン(とその`integrity`）が記録される。

## package.jsonとpackage-lock.jsonの優先順位
* `package-lock.json`が存在しないとき
	`package.json`に基づいて`dependency`がインストールされ、実際にインストールされたバージョンが`package-lock.json`に記録する。
* `package-lock.json`が存在するとき
	`package-lock.json`に基づいてインストールされるが、`package.json`との矛盾があれば、`package.json`が優先され、実際にインストールされたバージョンが`package-lock.json`に記録する。

## ユースケース
### npm install
開発中のソースコードだけあり、`dependencies`がインストールされていないとき。

### npm install <package>
`dependencies`はインストールされたが、新たにパッケージを追加したいとき。

### npm audit
脆弱性のある`dependency`があるか自動でチェックすることができる（報告されているものならば）。

# 参考資料（THX）
* [【初心者向け】NPMとpackage.jsonを概念的に理解する](https://qiita.com/righteous/items/e5448cb2e7e11ab7d477)

