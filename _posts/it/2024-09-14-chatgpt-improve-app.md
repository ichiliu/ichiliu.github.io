---
layout: post
title: ChatGPTを活用したWebアプリケーション作成
subtitle: 
cover-img: [/assets/img/cover/it1.jpg, /assets/img/cover/it2.jpg, /assets/img/cover/it3.jpg]
thumbnail-img: https://i.imgur.com/K2ZALZc.png
share-img:
tags: [AI, ChatGPT]
categories: [IT]
---

<!-- vim-markdown-toc GFM -->

* [ChatGPTとともに機能改善していくタスク管理アプリケーションの構築](#chatgptとともに機能改善していくタスク管理アプリケーションの構築)
  * [はじめに](#はじめに)
  * [ステップ1: 基本機能の実装](#ステップ1-基本機能の実装)
    * [アプリケーションの概要](#アプリケーションの概要)
  * [ステップ2: タスクの編集と削除機能の追加](#ステップ2-タスクの編集と削除機能の追加)
  * [ステップ3: ユーザー認証機能の追加](#ステップ3-ユーザー認証機能の追加)
  * [結論](#結論)

<!-- vim-markdown-toc -->

## ChatGPTとともに機能改善していくタスク管理アプリケーションの構築

### はじめに

この記事では、Node.jsを使用してシンプルなタスク管理アプリケーションを作成し、ChatGPTの力を借りてその機能を段階的に改善していく過程を追っていく。アプリケーションは最初は基本的なタスクの追加と表示機能のみを備えているが、段階的に機能を追加し、最終的には便利で実用的なツールへと進化させていく。ここでは、ChatGPTにプロンプトを与え、アプリケーションの改善を進めていく過程を詳しく見ていこう。

![file](https://i.imgur.com/K2ZALZc.png)

### ステップ1: 基本機能の実装

#### アプリケーションの概要

初めに、Node.jsを使用して簡単なタスク管理アプリケーションを作成する。このアプリケーションでは、タスクの追加と表示ができる基本的な機能を実装する。

**プロジェクトのセットアップ**

まずはプロジェクトのディレクトリを作成し、必要なパッケージをインストールする。

```bash
mkdir task-manager
cd task-manager
npm init -y
npm install express body-parser
```

**サーバーの基本設定**

`index.js`というファイルを作成し、Expressサーバーの基本設定を行う。

```javascript
// index.js
const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;

app.use(bodyParser.json());

let tasks = [];

// ルートパスのハンドラー
app.get('/', (req, res) => {
    res.send('Welcome to the Task Manager API');
});

// タスクの追加
app.post('/tasks', (req, res) => {
    const task = req.body.task;
    if (task) {
        tasks.push(task);
        res.status(201).json({ message: 'Task added' });
    } else {
        res.status(400).json({ message: 'Task is required' });
    }
});

// タスクの取得
app.get('/tasks', (req, res) => {
    res.json(tasks);
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
```

### ステップ2: タスクの編集と削除機能の追加

次に、タスクの編集と削除機能を追加し、アプリケーションをさらに便利にする。このステップでは、ChatGPTに以下のようなプロンプトを与えて機能を改善していく。

**プロンプト:**

「タスク管理アプリケーションに、タスクの編集と削除機能を追加したい。どのように変更すれば良いか教えてください。」

**ChatGPTの提案:**

- タスクの編集にはタスクIDを使い、指定したタスクを更新するエンドポイントを追加する。
- タスクの削除にはタスクIDを使い、指定したタスクを削除するエンドポイントを追加する。

**ソースコードの修正**

`index.js`に編集と削除機能を追加する。

```javascript
// タスクの編集
app.put('/tasks/:id', (req, res) => {
    const id = parseInt(req.params.id);
    const newTask = req.body.task;
    if (id >= 0 && id < tasks.length && newTask) {
        tasks[id] = newTask;
        res.json({ message: 'Task updated' });
    } else {
        res.status(400).json({ message: 'Invalid task ID or task' });
    }
});

// タスクの削除
app.delete('/tasks/:id', (req, res) => {
    const id = parseInt(req.params.id);
    if (id >= 0 && id < tasks.length) {
        tasks.splice(id, 1);
        res.json({ message: 'Task deleted' });
    } else {
        res.status(400).json({ message: 'Invalid task ID' });
    }
});
```

### ステップ3: ユーザー認証機能の追加

最後に、ユーザー認証機能を追加し、アプリケーションにセキュリティを強化する。ChatGPTに以下のようなプロンプトを与えて、このステップを進める。

**プロンプト:**

「タスク管理アプリケーションにユーザー認証機能を追加したい。どのように実装すれば良いか教えてください。」

**ChatGPTの提案:**

1. ユーザー認証機能の追加
- ユーザー登録エンドポイント (/register) を実装して、新しいユーザーを登録できるようにする。
- ログインエンドポイント (/login) を実装して、ユーザーがログインできるようにする。ログイン成功後にはセッションを作成し、ユーザーが認証されていることをセッションで管理する。
- ログアウトエンドポイント (/logout) を実装して、ユーザーのセッションを終了できるようにする。
1. セッション管理
- express-session を使用してセッションを管理する。セッションの設定には、セッション ID をクッキーで保存し、ユーザーのセッション状態をサーバーサイドで保持する。
- 認証が必要なエンドポイントには、ユーザーがログインしているかどうかをチェックするミドルウェアを追加する。このミドルウェアは、セッションに保存されたユーザー情報が存在するかどうかを検証し、認証されていない場合はアクセスを拒否する。
1. エンドポイント保護
- /tasks エンドポイントのように、認証が必要なエンドポイントには、ユーザーの認証状態を確認するためのミドルウェアを組み込む。これにより、ログインしていないユーザーからのアクセスを制限する。
- 認証済みのユーザーのみがタスクの追加、取得、編集、削除ができるようにする。

**ソースコードの修正**

必要なパッケージを追加し、`index.js`に認証機能を実装する。

```bash
npm install express-session
```

```javascript
// index.js
const express = require('express');
const bodyParser = require('body-parser');
const session = require('express-session');
const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(session({
    secret: 'your-secret-key',
    resave: false,
    saveUninitialized: true
}));

// データストレージ（メモリ内）
let users = [];
let tasks = [];

// ユーザー登録
app.post('/register', (req, res) => {
    const { username, password } = req.body;
    if (username && password) {
        // ユーザーが既に存在するかチェック
        const existingUser = users.find(u => u.username === username);
        if (existingUser) {
            return res.status(400).json({ message: 'User already exists' });
        }
        users.push({ username, password });
        res.status(201).json({ message: 'User registered' });
    } else {
        res.status(400).json({ message: 'Username and password required' });
    }
});

// ログイン
app.post('/login', (req, res) => {
    const { username, password } = req.body;
    const user = users.find(u => u.username === username && u.password === password);
    if (user) {
        req.session.user = user.username;
        res.json({ message: 'Logged in' });
    } else {
        res.status(401).json({ message: 'Invalid username or password' });
    }
});

// ログアウト
app.post('/logout', (req, res) => {
    req.session.destroy(err => {
        if (err) {
            return res.status(500).json({ message: 'Logout failed' });
        }
        res.json({ message: 'Logged out' });
    });
});

// 認証保護されたリソース
app.get('/protected', (req, res) => {
    if (req.session.user) {
        res.json({ message: 'This is a protected resource' });
    } else {
        res.status(401).json({ message: 'Unauthorized' });
    }
});

// タスクの追加
app.post('/tasks', (req, res) => {
    if (req.session.user) {
        const { task } = req.body;
        if (task) {
            const newTask = { id: tasks.length, task };
            tasks.push(newTask);
            res.status(201).json({ message: 'Task added', task: newTask });
        } else {
            res.status(400).json({ message: 'Task content required' });
        }
    } else {
        res.status(401).json({ message: 'Unauthorized' });
    }
});

// タスクの取得
app.get('/tasks', (req, res) => {
    if (req.session.user) {
        res.json(tasks);
    } else {
        res.status(401).json({ message: 'Unauthorized' });
    }
});

// タスクの編集
app.put('/tasks/:id', (req, res) => {
    if (req.session.user) {
        const id = parseInt(req.params.id);
        const { task } = req.body;
        if (id >= 0 && id < tasks.length && task) {
            tasks[id].task = task;
            res.json({ message: 'Task updated', task: tasks[id] });
        } else {
            res.status(400).json({ message: 'Invalid task ID or content' });
        }
    } else {
        res.status(401).json({ message: 'Unauthorized' });
    }
});

// タスクの削除
app.delete('/tasks/:id', (req, res) => {
    if (req.session.user) {
        const id = parseInt(req.params.id);
        if (id >= 0 && id < tasks.length) {
            tasks.splice(id, 1);
            // タスク ID の再割り当て
            tasks = tasks.map((task, index) => ({ id: index, task: task.task }));
            res.json({ message: 'Task deleted' });
        } else {
            res.status(400).json({ message: 'Invalid task ID' });
        }
    } else {
        res.status(401).json({ message: 'Unauthorized' });
    }
});

// サーバー起動
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
```

### 結論

このブログ記事では、ChatGPTを活用してNode.jsでのタスク管理アプリケーションの機能を段階的に改善していく過程を示した。基本機能の実装から始まり、編集・削除機能、そしてユーザー認証機能の追加へと進化させた。これにより、アプリケーションはより実用的でセキュアなものとなり、ChatGPTを使った機能改善の可能性を感じてもらえたのではないだろうか。
