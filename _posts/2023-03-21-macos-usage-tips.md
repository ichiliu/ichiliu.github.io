---
layout: post
title: macOS Usage Tips
subtitle: 
cover-img: [/assets/img/cover/technology1.jpg, /assets/img/cover/technology2.jpg, /assets/img/cover/technology3.jpg]
thumbnail-img: https://i.imgur.com/PMqR9QQ.png
share-img:
tags: [macOS, Tips]
categories: [Technology]
---

# 概要
普段`macOS`を使う上で、調べて応用することが多い。時間が経つと忘れてしまうことがあつため、覚えておきたい使い方を`Tips`としてメモ書きしておく。

![file](https://i.imgur.com/PMqR9QQ.png)

# Tips
## Finder関連
### Finderタイトルにフルパスを表示させる
初期設定の`Finder`タイトルは、ディレクトリ名のみを表示する。フルパス名を表示させる場合は以下のコマンドで設定する
```sh
$ defaults write com.apple.finder _FXShowPosixPathInTitle -boolean true
```
`Finder`を再起動すれば反映される。また、最後に`-boolean false`にすると、ディレクトリ名のみ表示されることになる。

