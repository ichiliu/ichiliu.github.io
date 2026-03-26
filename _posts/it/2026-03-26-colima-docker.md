---
layout: post
title: macOSでColimaを使用したDocker環境構築
subtitle: 
cover-img: [/assets/img/cover/it1.jpg, /assets/img/cover/it2.jpg, /assets/img/cover/it3.jpg]
thumbnail-img: https://i.imgur.com/9Acm2hM.png
share-img:
tags: [Colima, Docker]
categories: [IT]
---

# macOSでColimaを使用したDocker環境構築

<!-- vim-markdown-toc GFM -->

* [はじめに](#はじめに)
  * [Colimaの特徴](#colimaの特徴)
  * [Colimaのインストール](#colimaのインストール)
  * [テストコンテナの起動](#テストコンテナの起動)
* [まとめ](#まとめ)

<!-- vim-markdown-toc -->

## はじめに

  このガイドでは、macOSでColimaを使用してDocker環境を構築する方法について説明します。Colimaは、macOS上で軽量なLinux仮想マシンを提供し、Dockerを実行するための便利なツールです。

  自分のmacOS上でDockerを使用するのに、Colimaを使用するのは、古いスペックのサブ機上で構築するため、GUIのDocker Desktopだと重くて、軽量&CLI中心のColimaが適していると考えたから。

![file](https://i.imgur.com/9Acm2hM.png)

### Colimaの特徴
  - Lima（仮想化）＋containerd/Docker
  - 必要最小限だけ動かす
  - Docker Desktopよりかなり軽量  
  古いmacOS上でも快適に動作する
  - 軽量＆CLI中心  
  使い方（超基本）
  - 起動  
    ```bash
    colima start  
    ```
  - 停止  
    ```bash
    colima stop  
    ```
  - 状態確認  
    ```bash
    colima status  
    ```
  - Docker互換  
  普通のDockerコマンドがそのまま使える
  - 無料・オープンソース  
  ライセンス問題なし

### Colimaのインストール
  - Homebrewを使用してColimaをインストールします。ターミナルを開いて、以下のコマンドを実行します
    ```bash
    % brew install docker colima
    ```
  - 念の為に確認する
    ```bash
    % docker version
    Client: Docker Engine - Community
    Version:           29.3.1
    API version:       1.54
    Go version:        go1.26.1
    Git commit:        c2be9ccfc3
    Built:             Wed Mar 25 14:22:32 2026
    OS/Arch:           darwin/amd64
    Context:           default

    % colima version
    colima version 0.10.1
    git commit: ed905203afdbc6fd4eae6cc301918099ff31e86e

    runtime: docker
    arch: x86_64
    client: v29.3.1
    server: v29.2.1
    ```

### テストコンテナの起動
- Colima起動
  ```bash
  % colima start
  INFO[0001] starting colima
  INFO[0001] runtime: docker
  INFO[0005] creating and starting ...                     context=vm
  INFO[0006] downloading disk image ...                    context=vm
  INFO[0102] provisioning ...                              context=docker
  INFO[0106] starting ...                                  context=docker
  INFO[0108] done
  ```
- hello-worldコンテナの起動
  ```bash
  % docker run hello-world
  Unable to find image 'hello-world:latest' locally
  latest: Pulling from library/hello-world
  4f55086f7dd0: Pull complete
  d5e71e642bf5: Download complete
  Digest: sha256:452a468a4bf985040037cb6d5392410206e47db9bf5b7278d281f94d1c2d0931
  Status: Downloaded newer image for hello-world:latest

  Hello from Docker!
  This message shows that your installation appears to be working correctly.

  To generate this message, Docker took the following steps:
   1. The Docker client contacted the Docker daemon.
   2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
      (amd64)
   3. The Docker daemon created a new container from that image which runs the
      executable that produces the output you are currently reading.
   4. The Docker daemon streamed that output to the Docker client, which sent it
      to your terminal.

  To try something more ambitious, you can run an Ubuntu container with:
   $ docker run -it ubuntu bash

  Share images, automate workflows, and more with a free Docker ID:
   https://hub.docker.com/

  For more examples and ideas, visit:
   https://docs.docker.com/get-started/
  ```
- Colima状態確認
  ```bash
  % colima status
  INFO[0001] colima is running using macOS Virtualization.Framework
  INFO[0001] arch: x86_64
  INFO[0001] runtime: docker
  INFO[0001] mountType: virtiofs
  INFO[0001] docker socket: unix:///Volumes/ST500LT/<user_name>.colima/default/docker.sock
  INFO[0001] containerd socket: unix:///Volumes/ST500LT/<user_name>.colima/default/containerd.sock
  ```
- Colima停止
  ```bash
  % colima stop
  INFO[0000] stopping colima
  INFO[0001] stopping ...                                  context=docker
  INFO[0001] stopping ...                                  context=vm
  INFO[0006] done
  ```

## まとめ
Colima+Dockerで古いスペックのmacOS上でもCLIで快適なDocker環境を構築することができた。今後は、この環境を活用して、様々なDockerプロジェクトを試してみたいと思います。
