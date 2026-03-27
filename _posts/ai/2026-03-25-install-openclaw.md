---
layout: post
title: Install OpenClaw to my MacBook Pro
subtitle: 
cover-img: [/assets/img/cover/ai1.jpg, /assets/img/cover/ai2.jpg, /assets/img/cover/ai3.jpg]
thumbnail-img: https://i.imgur.com/I4Hdy8o.png
share-img:
tags: [AI, OpenClas]
categories: [AI]
---

<!-- vim-markdown-toc GFM -->

* [概要](#概要)
  * [OpenClawの概要](#openclawの概要)
  * [環境構築](#環境構築)
    * [準備(npmpのインストール)](#準備npmpのインストール)
      * [Bug Credit of Claude](#bug-credit-of-claude)
      * [pnpmのインストール](#pnpmのインストール)
      * [openclawのクローン](#openclawのクローン)
    * [依存関係のインストール](#依存関係のインストール)
    * [インタラクティブ・セットアップの開始](#インタラクティブ・セットアップの開始)
    * [ゲートウェイを起動](#ゲートウェイを起動)
    * [TUI（ターミナルUI）を起動](#tuiターミナルuiを起動)
    * [OpenClawと会話する](#openclawと会話する)
      * [Web UI（ブラウザで会話）](#web-uiブラウザで会話)
      * [TUI（ターミナルUIで会話）](#tuiターミナルuiで会話)
  * [動作確認](#動作確認)
    * [Web UI](#web-ui)
      * [軽く挨拶](#軽く挨拶)
      * [軽く質問](#軽く質問)
      * [高度なコードを書かせる](#高度なコードを書かせる)
      * [株価データのグラフ化をさせてみる](#株価データのグラフ化をさせてみる)
  * [おまけ](#おまけ)
  * [まとめ](#まとめ)

<!-- vim-markdown-toc -->

# 概要
Personal AI AssistantのOpenClawの概要説明とMacBook Proへのインストール方法を紹介します。

## OpenClawの概要
OpenClawは、個人のAIアシスタントで、自然言語処理や機械学習を活用して、ユーザーのタスクを効率化するためのツールです。ここでは、個人用のMacBook Proにインストールすることで、日常の作業や情報検索をよりスムーズに行うことができることを検証します。

![file](https://i.imgur.com/I4Hdy8o.png)

## 環境構築
### 準備(npmpのインストール)
#### Bug Credit of Claude
まず$5のクレジットをチャージしました。

#### pnpmのインストール
OpenClawのインストールに必要なNode.jsのパッケージマネージャーであるpnpmをインストールします。pnpmは、npmやyarnと同様にNode.jsのパッケージ管理を行うツールですが、より高速で効率的な依存関係の管理が特徴。
```sh
% sudo corepack enable
% corepack prepare pnpm@latest --activate
% pnpm --version
10.33.0
```

#### openclawのクローン
```sh
% mkdir -p ~/Projects/openclaw-test
% cd openclaw-test
% git clone https://github.com/openclaw/openclaw.git
% cd openclaw
```

### 依存関係のインストール
```sh
% pnpm install
```
<details>
<summary>ここをクリックして展開</summary>
<pre>
! Corepack is about to download https://registry.npmjs.org/pnpm/-/pnpm-10.32.1.tgz
? Do you want to continue? [Y/n] Y

Scope: all 79 workspace projects
Lockfile is up to date, resolution step is skipped
Packages: +1235
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

   ╭───────────────────────────────────────────────╮
   │                                               │
   │     Update available! 10.32.1 → 10.33.0.      │
   │     Changelog: https://pnpm.io/v/10.33.0      │
   │   To update, run: corepack use pnpm@10.33.0   │
   │                                               │
   ╰───────────────────────────────────────────────╯

Downloading node-llama-cpp@3.18.1: 28.99 MB/28.99 MB, done
Downloading pdfjs-dist@5.5.207: 10.31 MB/10.31 MB, done
Downloading @napi-rs/canvas-darwin-x64@0.1.97: 13.37 MB/13.37 MB, done
Downloading koffi@2.15.1: 18.25 MB/18.25 MB, done
Downloading @napi-rs/canvas-darwin-x64@0.1.92: 13.33 MB/13.33 MB, done
Downloading @node-llama-cpp/mac-x64@3.18.1: 8.31 MB/8.31 MB, done
Downloading @img/sharp-libvips-darwin-x64@1.2.4: 8.27 MB/8.27 MB, done
Downloading @typescript/native-preview-darwin-x64@7.0.0-dev.20260322.1: 10.15 MB/10.15 MB, done
Downloading @oxlint-tsgolint/darwin-x64@0.17.1: 13.03 MB/13.03 MB, done
Downloading @rolldown/binding-darwin-x64@1.0.0-rc.9: 8.05 MB/8.05 MB, done
Downloading @rolldown/binding-darwin-x64@1.0.0-rc.10: 8.83 MB/8.83 MB, done
Downloading @tloncorp/tlon-skill-darwin-x64@0.3.0: 25.17 MB/25.17 MB, done
Packages are cloned from the content-addressable store to the virtual store.
  Content-addressable store is at: /Volumes/ST500LT/<user_name>/Library/pnpm/store/v10
  Virtual store is at:             node_modules/.pnpm
Downloading ogg-opus-decoder@1.7.3: 6.87 MB/6.87 MB, done
Downloading gifwrap@0.10.1: 5.89 MB/5.89 MB, done
Downloading @wasm-audio-decoders/opus-ml@0.0.2: 6.39 MB/6.39 MB, done
Progress: resolved 0, reused 0, downloaded 1187, added 1235, done
node_modules/protobufjs: Running postinstall script, done in 164ms
node_modules/esbuild: Running postinstall script, done in 3.2s
node_modules/sharp: Running install script, done in 19.4s
node_modules/@matrix-org/matrix-sdk-crypto-nodejs: Running postinstall script, done in 2.3s
node_modules/@tloncorp/tlon-skill: Running postinstall script, done in 176ms
node_modules/node-llama-cpp: Running postinstall script, done in 15.6s
node_modules/libsignal/node_modules/protobufjs: Running postinstall script, done in 169ms
node_modules/@whiskeysockets/baileys: Running preinstall script, done in 89ms
. prepare$ command -v git >/dev/null 2>&1 && git rev-parse --is-inside-work-tree >/dev/null 2>&1 && git config core.hooksPath git-hook…
└─ Done in 133ms
Done in 4m 20.7s using pnpm v10.32.1
786 [@My MBP(main):~/Projects/openclaw-test/openclaw]
% ls
AGENTS.md			assets				patches				vendor
CHANGELOG.md			docker-compose.yml		pnpm-lock.yaml			vitest.channel-paths.mjs
CLAUDE.md			docker-setup.sh			pnpm-workspace.yaml		vitest.channels.config.ts
CONTRIBUTING.md			docs				pyproject.toml			vitest.config.ts
Dockerfile			docs.acp.md			render.yaml			vitest.e2e.config.ts
Dockerfile.sandbox		extensions			scripts				vitest.extensions.config.ts
Dockerfile.sandbox-browser	fly.private.toml		setup-podman.sh			vitest.gateway.config.ts
Dockerfile.sandbox-common	fly.toml			skills				vitest.live.config.ts
LICENSE				git-hooks			src				vitest.pattern-file.ts
README.md			knip.config.ts			test				vitest.performance-config.ts
SECURITY.md			node_modules			test-fixtures			vitest.scoped-config.ts
Swabble				openclaw.mjs			tsconfig.json			vitest.unit-paths.mjs
VISION.md			openclaw.podman.env		tsconfig.plugin-sdk.dts.json	vitest.unit.config.ts
appcast.xml			package.json			tsdown.config.ts		zizmor.yml
apps				packages			ui
</pre>
</details>

### インタラクティブ・セットアップの開始
```sh
% pnpm dev
```
<details>
<summary>ここをクリックして展開</summary>
<pre>

\> openclaw@2026.3.24 dev /Volumes/ST500LT/<user_name>/Projects/openclaw-test/openclaw
\> node scripts/run-node.mjs

[openclaw] Building TypeScript (dist is stale).


🦞 OpenClaw 2026.3.24 (2a40612) — Your .zshrc wishes it could do what I do.

Usage: openclaw [options] [command]

Options:
  --container <name>   Run the CLI inside a running Podman/Docker container named <name> (default: env OPENCLAW_CONTAINER)
  --dev                Dev profile: isolate state under ~/.openclaw-dev, default gateway port 19001, and shift derived ports
                       (browser/canvas)
  -h, --help           Display help for command
  --log-level <level>  Global log level override for file + console (silent|fatal|error|warn|info|debug|trace)
  --no-color           Disable ANSI colors
  --profile <name>     Use a named profile (isolates OPENCLAW_STATE_DIR/OPENCLAW_CONFIG_PATH under ~/.openclaw-<name>)
  -V, --version        output the version number

Commands:
  Hint: commands suffixed with * have subcommands. Run <command> --help for details.
  acp *                Agent Control Protocol tools
  agent                Run one agent turn via the Gateway
  agents *             Manage isolated agents (workspaces, auth, routing)
  approvals *          Manage exec approvals (gateway or node host)
  backup *             Create and verify local backup archives for OpenClaw state
  browser *            Manage OpenClaw's dedicated browser (Chrome/Chromium)
  channels *           Manage connected chat channels (Telegram, Discord, etc.)
  clawbot *            Legacy clawbot command aliases
  completion           Generate shell completion script
  config *             Non-interactive config helpers (get/set/unset/file/validate). Default: starts guided setup.
  configure            Interactive configuration for credentials, channels, gateway, and agent defaults
  cron *               Manage cron jobs via the Gateway scheduler
  daemon *             Gateway service (legacy alias)
  dashboard            Open the Control UI with your current token
  devices *            Device pairing + token management
  directory *          Lookup contact and group IDs (self, peers, groups) for supported chat channels
  dns *                DNS helpers for wide-area discovery (Tailscale + CoreDNS)
  docs                 Search the live OpenClaw docs
  doctor               Health checks + quick fixes for the gateway and channels
  gateway *            Run, inspect, and query the WebSocket Gateway
  health               Fetch health from the running gateway
  help                 Display help for command
  hooks *              Manage internal agent hooks
  logs                 Tail gateway file logs via RPC
  mcp                  Manage embedded Pi MCP servers
  memory *             Search and reindex memory files
  message *            Send, read, and manage messages
  models *             Discover, scan, and configure models
  node *               Run and manage the headless node host service
  nodes *              Manage gateway-owned node pairing and node commands
  onboard              Interactive onboarding for gateway, workspace, and skills
  pairing *            Secure DM pairing (approve inbound requests)
  plugins *            Manage OpenClaw plugins and extensions
  qr                   Generate iOS pairing QR/setup code
  reset                Reset local config/state (keeps the CLI installed)
  sandbox *            Manage sandbox containers for agent isolation
  secrets *            Secrets runtime reload controls
  security *           Security tools and local config audits
  sessions *           List stored conversation sessions
  setup                Initialize local config and agent workspace
  skills *             List and inspect available skills
  status               Show channel health and recent session recipients
  system *             System events, heartbeat, and presence
  tui                  Open a terminal UI connected to the Gateway
  uninstall            Uninstall the gateway service + local data (CLI remains)
  update *             Update OpenClaw and inspect update channel status
  webhooks *           Webhook helpers and integrations

Examples:
  openclaw models --help
    Show detailed help for the models command.
  openclaw channels login --verbose
    Link personal WhatsApp Web and show QR + connection logs.
  openclaw message send --target +15555550123 --message "Hi" --json
    Send via your web session and print JSON result.
  openclaw gateway --port 18789
    Run the WebSocket Gateway locally.
  openclaw --dev gateway
    Run a dev Gateway (isolated state/config) on ws://127.0.0.1:19001.
  openclaw gateway --force
    Kill anything bound to the default gateway port, then start it.
  openclaw gateway ...
    Gateway control via WebSocket.
  openclaw agent --to +15555550123 --message "Run summary" --deliver
    Talk directly to the agent using the Gateway; optionally send the WhatsApp reply.
  openclaw message send --channel telegram --target @mychat --message "Hi"
    Send via your Telegram bot.

Docs: docs.openclaw.ai/cli

 ELIFECYCLE  Command failed with exit code 1.
</pre>
</details>
<br>
Geminiに聞いたら、上記のようなログが出たのは、エラーで落ちたのではなく、「オプションなしで実行されたので、ヘルプ（使い方）を表示して正常終了した」、あるいは**「初期設定が未完了なので、まずセットアップしてほしい」**という状態だそう。

OpenClawを動かすための初期設定（APIキーの登録など）を対話形式で行う必要がある。

```sh
% pnpm dev setup
```

<details>
<summary>ここをクリックして展開</summary>
<pre>

\> openclaw@2026.3.24 dev /Volumes/ST500LT/<user_name>/Projects/openclaw-test/openclaw
\> node scripts/run-node.mjs setup


🦞 OpenClaw 2026.3.24 (2a40612) — Finally, a use for that always-on Mac Mini under your desk.

Wrote ~/.openclaw/openclaw.json
Workspace OK: ~/.openclaw/workspace
Sessions OK: ~/.openclaw/agents/main/sessions
</pre>
</details>
<br>

```sh
% pnpm dev configure
```

<details>
<summary>ここをクリックして展開</summary>
<pre>

\> openclaw@2026.3.24 dev /Volumes/ST500LT/<user_name>/Projects/openclaw-test/openclaw
\> node scripts/run-node.mjs configure


🦞 OpenClaw 2026.3.24 (2a40612) — You had me at 'openclaw gateway start.'

┌  OpenClaw configure
│
◇  Existing config detected ─────────╮
│                                    │
│  workspace: ~/.openclaw/workspace  │
│  gateway.mode: local               │
│                                    │
├────────────────────────────────────╯
│
◇  Where will the Gateway run?
│  Local (this machine)
│
◇  Select sections to configure
│  Model
│
◇  Model/auth provider
│  Anthropic
│
◇  Anthropic auth method
│  Anthropic API key
│
◇  Enter Anthropic API key
│  \<API key\>
│
◇  Model configured ─────────────────────────────────╮
│                                                    │
│  Default model set to anthropic/claude-sonnet-4-6  │
│                                                    │
├────────────────────────────────────────────────────╯
│
◇  Models in /model picker (multi-select)
│  1 items selected
Config overwrite: /Volumes/ST500LT/<user_name>/.openclaw/openclaw.json (sha256 47b11455f907e76e79043c13b2bb18e522f85a922f39a711e3a5d858816a2868 -> 7a02861eceafea713eb586884cd4528089b542370382848afcc999a72abe2688, backup=/Volumes/ST500LT/<user_name>/.openclaw/openclaw.json.bak)
Updated ~/.openclaw/openclaw.json
│
◇  Select sections to configure
│  Continue
Control UI assets missing; building (ui:build, auto-installs UI deps)…
│
◇  Control UI ─────────────────────────────────────────────────────────────────╮
│                                                                              │
│  Web UI: http://127.0.0.1:18789/                                             │
│  Gateway WS: ws://127.0.0.1:18789                                            │
│  Gateway: not detected (gateway url override requires explicit credentials)  │
│  Docs: https://docs.openclaw.ai/web/control-ui                               │
│                                                                              │
├──────────────────────────────────────────────────────────────────────────────╯
│
└  Configure complete.
</pre>
</details>
<br>

### ゲートウェイを起動

### TUI（ターミナルUI）を起動
```sh
% pnpm dev gateway
```

<details>
<summary>ここをクリックして展開</summary>
<pre>

\> openclaw@2026.3.24 dev /Volumes/ST500LT/<user_name>/Projects/openclaw-test/openclaw
\> node scripts/run-node.mjs gateway


🦞 OpenClaw 2026.3.24 (2a40612)
   It's not "failing," it's "discovering new ways to configure the same thing wrong."

14:28:42 Config overwrite: /Volumes/ST500LT/<user_name>/.openclaw/openclaw.json (sha256 7a02861eceafea713eb586884cd4528089b542370382848afcc999a72abe2688 -> 1eea557a0d1f9dcb3d45c5ffea2abc4f7c03c43d7879da90414a23ac2c311cbe, backup=/Volumes/ST500LT/<user_name>/.openclaw/openclaw.json.bak)
14:28:42 [gateway] auth token was missing. Generated a new token and saved it to config (gateway.auth.token).
14:28:42 [canvas] host mounted at http://127.0.0.1:18789/__openclaw__/canvas/ (root /Volumes/ST500LT/<user_name>/.openclaw/canvas)
14:28:44 [heartbeat] started
14:28:44 [health-monitor] started (interval: 300s, startup-grace: 60s, channel-connect-grace: 120s)
14:28:44 [gateway] agent model: anthropic/claude-sonnet-4-6
14:28:44 [gateway] listening on ws://127.0.0.1:18789, ws://[::1]:18789 (PID 88993)
14:28:44 [gateway] log file: /tmp/openclaw/openclaw-2026-03-27.log
14:28:44 [browser/server] Browser control listening on http://127.0.0.1:18791/ (auth=token)
...省略...
</pre>
</details>
<br>

これで、OpenClawのゲートウェイがローカルで起動し、ターミナルUIも利用可能になりました。次のステップとして、チャットチャンネルの接続やエージェントの設定などを行うことができます。

### OpenClawと会話する
#### Web UI（ブラウザで会話）
`pnpm dev gateway`が動いている状態で、ブラウザのアドレスバーに `http://127.0.0.1:18789/` と入力します。

![file](https://i.imgur.com/mtZqS5L.png)

「网关令牌」が空欄になっていて、表示されている赤いエラーメッセージが示されているように、Gateway Tokenがないため、Gatewayに接続できない。`pnpm dev gateway`のログを確認したら、設定フィアル`/Volumes/ST500LT/<user_name>/.openclaw/openclaw.json`に書かれていることが分かったため、それをコピーして「网关令牌」欄に入力し、「连接」ボタンを押しました。そしたら、次のチャット画面が表示されるようになりました。

![file](https://i.imgur.com/f0TmO0R.png)

#### TUI（ターミナルUIで会話）
```sh
% pnpm dev tui
```

<details>
<summary>ここをクリックして展開</summary>
<pre>

\> openclaw@2026.3.24 dev /Volumes/ST500LT/<user_name>/Projects/openclaw-test/openclaw
\> node scripts/run-node.mjs tui

🦞 OpenClaw 2026.3.24 (2a40612) — Alexa, but with taste.

 openclaw tui - ws://127.0.0.1:18789 - agent main - session main

```sh
 hello
```

 Hello! 👋 How can I help you?
</pre>
</details>
<br>

上記の`hello`はこちらからのプロンプト入力で、それに対し、OpenClawが`Hello! 👋 How can I help you?`を返事してくれました。
`

## 動作確認
動作確認できる前提として、
- `pnpm dev gateway`が起動していること
- LLM（この場合はAnthropicのClaude）が正しく設定されて、チャージ料金の残高があること
### Web UI
`http://127.0.0.1:18789/`にアクセスします。

#### 軽く挨拶
- プロンプト
>hello
- 出力
>Hello! 👋 How can I help you?

#### 軽く質問
- プロンプト
>東京都今日の日付と天気を教えて
- 出力

![file](https://i.imgur.com/1x0gyte.png)

#### 高度なコードを書かせる
- プロンプト
>Reactを使って、マウスの動きに合わせて色が変化する、インタラクティブで幾何学的なアートを作って。古いMacでも滑らかに動くようにコードを最適化して
- 出力
>キャンバスベースで作ります。古いMacでも滑らかに動くよう、SVGではなくCanvas APIを使い、描画を最適化します。

![file](https://i.imgur.com/rvfhw99.png)

>成果物をブラウザで開くと、マウスの動きに合わせて色が変化するインタラクティブな幾何学的アートが表示されました。

なお、実際にマウスを動かした時に次から次へ変わる3種類の図形のイメージを以下に示します。

|六角形|三角形|ダイヤモンド|
|-|-|-|
|![file](https://i.imgur.com/2tE8YUo.png)|![file](https://i.imgur.com/zmqnOO1.png)|![file](https://i.imgur.com/gcMGpFq.png)|

なんと素晴らしい！

#### 株価データのグラフ化をさせてみる
- プロンプト
>必要に応じて yfinance と matplotlib を pip でインストールしてください。
>
>- 三井住友フィナンシャルグループ（8316.T）の過去1年間の株価データを取得してください。
>- 「終値（Close）」、「25日移動平均線」、「75日移動平均線」を重ねたグラフを描画し、画像ファイル（smfg_chart.png）として保存してください。
>- 保存した画像を表示するか、パスを教えてください。
>- 取得したデータに基づき、現在の株価が移動平均線に対してどの位置にあるか（ゴールデンクロス/デッドクロスの有無など）を解析し、直近のトレンドを要約してください。

- 出力

![file](https://i.imgur.com/tUYfgJc.png)

![file](https://i.imgur.com/fU6dBSG.png)

## おまけ
ここまでの動作確認で、ClaudeでチャージしたUS$5は、残りわずかUS$1.23になりました。何もプロンプトを入力していない時もわずかですが残高が減っているので、おかしいなと思ったら、理由はOpenClawが定期的にClaudeにヘルスチェックを送っているかららしい。ヘルスチェックは、Gatewayが正常に動作しているかを確認するためのもので、これもAPIリクエストとしてカウントされるため、少しずつ残高が減っていくことになります。↲

![file](https://i.imgur.com/hGIXxAT.png)

## まとめ
OpenClawをMacBook Proにインストールし、Web UIとTUIの両方で動作確認を行いました。Web UIでは、自然言語での対話やコード生成、データ分析などがスムーズに行えることが確認できました。TUIでも同様の対話が可能で、CLIベースでの操作が可能なことがわかりました。これにより、OpenClawを活用して、日常のタスクや情報検索を効率化することができるようになりました。今後は、さらに多くのチャットチャンネルの接続やエージェントの設定を行い、OpenClawの機能を最大限に活用していきたいと思います（APIキーの利用料金は値下げしないかな。。）
