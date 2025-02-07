---
layout: post
title: ローカルMacでWebUI付きのLLMを動かす
subtitle: 
cover-img: [/assets/img/cover/study1.jpg, /assets/img/cover/study2.jpg, /assets/img/cover/study3.jpg]
thumbnail-img: https://i.imgur.com/ei6MZ65.png
share-img:
tags: [AI, LLM, Llama, Ollama, DeepSeek]
categories: [Study]
---

## 概要
- ローカルMacに`Llama3`や`DeepSeek`のようなLLMを動かす環境を作る
- TerminalとWebUIの両方の使用方法を試す

以下が`Open WebUI`にて実行した時の画面キャプチャ
![file](https://i.imgur.com/QqwjslH.png)

<!-- vim-markdown-toc GFM -->

* [環境](#環境)
* [使用するツール](#使用するツール)
* [手順](#手順)
  * [Ollamaをインストール](#ollamaをインストール)
  * [OllamaをTerminalで試す](#ollamaをterminalで試す)
  * [別のLLMを入れてみる](#別のllmを入れてみる)
  * [Open WebUIで試す](#open-webuiで試す)
* [参考リンク](#参考リンク)

<!-- vim-markdown-toc -->

## 環境

- MacBook Pro 2012（おじちゃんMac）
- Memory 16GB

## 使用するツール
- Ollama
- Open WebUI
- Docker Desktop

## 手順
### Ollamaをインストール
`Ollama`は、`Llama3`や`DeepSeek`などオープンソースのLLM（大規模言語モデル）を、ローカルPCなどの環境に実行できるツール。
[https://ollama.com/](https://ollama.com) にてDownload

![file](https://i.imgur.com/ei6MZ65.png)

Installまで完了したら、MacのTerminalにて、Ollamaをコマンドラインで利用できるようになる。

### OllamaをTerminalで試す
Terminalを立ち上げて、
```sh
$ which ollama
/usr/local/bin/ollama
$ ollama run llama3.2
```

すると、`llama3.2:latest`の3.2B（32億個のパラメータ）のモデルがダウンロードされ、完了したら、Terminalには次のよう即`Llama`をチャットできる状態になる

![file](https://i.imgur.com/muYoTYt.png)

チャットを終了したい時は`/bye`を打てば会話終了できる。

### 別のLLMを入れてみる
2024年の年末の世界中を驚かせた`DeepSeek`の軽量版モデルを入れてみる。
[https://ollama.com/library/deepseek-r1/tags](https://ollama.com/library/deepseek-r1/tags) に1.5bのものを入れてみたい。

![file](https://i.imgur.com/Yf8zC9n.png)

```sh
$ ollama pull deepseek-r1:1.5b-qwen-distill-q4_K_M
```

Downloadし終わったら、`ollama run deepseek-r1:1.5b-qwen-distill-q4_K_M` の感じで使える。

### Open WebUIで試す

前提条件として、`Docker Desktop`がローカルMacにインストール済であること。まず`Docker Desktop`を立ち上げる、その後に、

```sh
$ docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
Unable to find image 'ghcr.io/open-webui/open-webui:main' locally
main: Pulling from open-webui/open-webui
22d97f6a5d13: Pull complete
b41a1d042542: Pull complete
be7f45f8a37f: Pull complete
bcb33e6fe64e: Pull complete
2dbc98364c88: Pull complete
53fd82458846: Pull complete
fbdf3f83c063: Pull complete
b40d6e00c708: Pull complete
54d67a42ae0e: Pull complete
2a95932c8382: Pull complete
002cefce91a8: Pull complete
93eed41d86d3: Pull complete
b395de805fe0: Pull complete
Digest: sha256:c75e215751eb741878f34fd841d910a018eb1bf2d17a9ffe731f24ab2bf3cca2
Status: Downloaded newer image for ghcr.io/open-webui/open-webui:main
350d732f7f1dfec5d9d62481966efcb2542e4223f5da7edb1264b380e17dc6a1
```

全部Pull completeになったら、`Docker Desktop`の画面には、以下のように`open-webui`のコンテナ`running`状態になる
![file](https://i.imgur.com/awvQNdy.png)

Terminalにて次のようにも確認できる
```sh
$ docker ps
CONTAINER ID   IMAGE                                COMMAND           CREATED       STATUS                   PORTS                    NAMES
4673d4ef04f2   ghcr.io/open-webui/open-webui:main   "bash start.sh"   2 hours ago   Up 5 minutes (healthy)   0.0.0.0:3000->8080/tcp   open-webui
```

ここまできたら、次のように`Open WebUI`を立ち上げて確認することができる `http://localhost:3000`
画面イメージは冒頭にキャプチャを貼ったので、ここでは割愛。


## 参考リンク
- [【蒸留モデル】DeepSeek-R1ローカル実行時におすすめのモデル](https://qiita.com/yonaka15/items/a69790be6eacd726f770)
- [OllamaでLLM（Llama 3等）をローカルMacで動かす with WebUI](https://zenn.dev/dara/articles/d09c62d3b55344)
- [Llama3もGPT-4も使える！オープンソースのChatGPT風アプリ「Open WebUI」完全ガイド](https://zenn.dev/dara/articles/d09c62d3b55344)

