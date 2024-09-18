---
layout: post
title: CyberSecurity Study
subtitle: 
cover-img: [/assets/img/cover/study1.jpg, /assets/img/cover/study2.jpg, /assets/img/cover/study3.jpg]
thumbnail-img: https://i.imgur.com/skFANEd.png
share-img:
tags: [cybersecurity]
categories: [Study]
---

学习网络安全 / サイバーセキュリティを勉強する。

![file](https://i.imgur.com/skFANEd.png)

# Cloud Security
## Zero Trust Model
* [2010年Forrester Research 社のJohn Kindervag 氏が提唱した概念モデル](https://www.paloaltonetworks.jp/resources/videos/zero-trust)
	* Comparison
		* ペリメタモデル（境界防御型）
			信ぜよ、されど確認せよ（相信我，但要确认）
			* 前提
				* 守るべき情報資産は境界の内部にある。
				* 守るべき情報資産は境界内部からアクセスする。
			* 現実
				* 守るべき情報資産は境界の内外にある。
				* 守るべき情報資産は境界内部からアクセスされている。
		* ゼロトラストモデル
			決して信頼せず、必ず確認せよ（绝不相信，一定要确认）
			* 大規模の導入事例
			* Googleの[BeyondCorp](https://cloud.google.com/beyondcorp?hl=ja)
			* [Security Talks 2021](https://cloudonair.withgoogle.com/events/security-talks-december-2021?utm_source=cloud_sfdc&utm_medium=email&utm_campaign=fy21-q4-noram-smb950-onlineevent-er-securitytalks_dec&utm_content=confirmation&mkt_tok=ODA4LUdKVy0zMTQAAAGFXJfjp2r9VGC_e66aRe1Eehb-WkgAR8iFRezU4dYvQcCv1LbdGyFakR-2REVHTRyMMzlywbvB9Lpn-7Vm3Ax3l5CtOF-ABoEbj1mv6QIvZghsJpwAnA)
				* [Zero Trust Network Access (ZTNA)](https://www.gartner.com/en/information-technology/glossary/zero-trust-network-access-ztna-) / 零信任网络访问
				* [SASEとは？オールインワン製品でDX推進に向けた効率的なセキュリティ投資を！](https://www.nri-secure.co.jp/blog/secure-access-service-edge)

# Attack Analysis
## Authentication
[从扫码登录的原理分析QQ大量被盗事件](https://netsecurity.51cto.com/article/712891.html)

## XSS
* [徳丸浩の日記：メタップスペイメント不正アクセス事件の第三者報告書から攻撃の模様を読み解](https://blog.tokumaru.org/2022/07/metaps-card-info-leakage.html)
	* [ECサイトのクロスサイトスクリプティング脆弱性を悪用した攻撃](https://blogs.jpcert.or.jp/ja/2021/07/water_pamola.html)
	* [完全版:管理画面に対するXSS攻撃でクレジットカード情報を盗む手口（TBW）](https://www.youtube.com/watch?v=FpCabifwhKg)

## Phishing


# Security Tests
## Webアプリケーション診断
Webサーバ上で動作するアプリケーションの脆弱性を診断するもの。

## [Penetration Test](https://e-words.jp/w/%E3%83%9A%E3%83%8D%E3%83%88%E3%83%AC%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3%E3%83%86%E3%82%B9%E3%83%88.html)
渗透测试 / ペネトレーションテスト / 侵入テスト / 擬似アタックテスト / ペンテスト

## プラットフォーム診断
サーバやネットワーク機器等のOSやミドルウェアの脆弱性を診断するもの。


# Glossaries
* [AAA](https://e-words.jp/w/AAA.html)
  Authentication, Authorization, and Accounting / 認証・認可・アカウンティング
  
* [Active Directory](https://e-words.jp/w/Active_Directory.html)
	* ユーザ認証 → Kerberos version 5（KRB5）プロトコル。
	* ディレクトリサービス → LDAP version 3 プロトコル。
	* ファイル共有 → SMB version 1.0 / 2.x / 3.0 プロトコル。
  
* ASV
Approved Scanning Vendors/認定スキャニングベンダー

+ CaaS
Crypter as a Service / クリプター・アズ・ア・サービス / 加密器即服务

* [CASB](https://www.cybernet.co.jp/zerotrust/products/casb.html) (キャスビー)
  Cloud Access Security Broker / 云访问安全代理
  クラウドの利用状況の可視化、操作制御
  代表製品:Netskopeの主なCASB機能
  - 可視化・分析(Agent/Proxy導入により、通信内容検出、ログイン状況、DL/ALの状況可視化。シャドーIT検出可能)
  - データ保護(機密情報定義し、KWや多数の識別方法で、高精度のDLPを実施可能)
  - コントロール(解析されたコンテキストに基づき、非許可SaaSの利用を制御、許可SaaSでもクレカ番号などをALできない制御)
  - 脅威防御(SaaSにあるマルウェアやランサムウェアを検知し隔離。データコピー、大量DLなど異常値を検知)
  
* [Credential Stuffing Attack](https://e-words.jp/w/パスワードリスト攻撃.html)
  パスワードリスト攻撃 / クレデンシャルスタッフィング攻撃

* [CSRF](https://siteguard.jp-secure.com/blog/what-is-csrf)
  [Cross-site request forgery）：跨站请求伪造](https://www.51cto.com/article/744860.html)

* [DeepFake](https://ja.wikipedia.org/wiki/%E3%83%87%E3%82%A3%E3%83%BC%E3%83%97%E3%83%95%E3%82%A7%E3%82%A4%E3%82%AF) 深度伪造 / ディープフェイク
	* [聊聊深度伪造，换脸的戏码还有多少人不知道？](https://www.bilibili.com/video/av587255390/)
  
* [DLP](https://e-words.jp/w/DLP-1.html) 
  Data Leak Prevention / 数据泄漏预防 / データ漏洩対策
  Data Loss Prevention / 数据丢失防护 / データ消失対策

* [FWaaS](https://licensecounter.jp/engineer-voice/blog/articles/20211124_fwaas.html)
  Firewall as a Service / 防火墙即服务
  クラウドへFW機能をアウトソーシングするという考え方。

+ [IAB](https://www.sompocybersecurity.com/column/glossary/iab)
Initial Access Broker / イニシャル・アクセス・ブローカー / 初始访问代理
  
* [Kerberos Authentication](https://www.infraexpert.com/study/security18.html)
  * Windows Server Active Directoryのユーザ認証の際に使用しているプロトコル。

- Kill Chain  
  サイバーセキュリティや軍事戦術の分野で使用される概念であり、攻撃者が標的に対して実施する一連の段階的な攻撃手法や攻撃フェーズを指す。以下がその各段階
  1. Reconnaissance (偵察)  
    攻撃者がターゲットに情報収集、システムや脆弱性を調査するなど。
  1. Weaponization (武装化)  
    攻撃用のツールやマルウェアを準備。
  1. Delivery (配信)  
    武装化されたマルウェア等をターゲットに送り込む。
  1. Exploitation (悪用)  
    武器化されたマルウェア等がシステムの脆弱性を悪用して侵入。 
  1. Installation (インストール)  
    侵入したシステムにて、攻撃者が制御を維持するために必要なツールやバックドアをインストールする。
  1. Command and Control (C2) (コマンドと制御)  
    攻撃者は侵入したシステムを制御するためのバックドアを使用する。
  1. Actions on Objectives (AOO) (目的の実施)
    攻撃者は最終的な目的を達成するための活動を開始(情報窃取や改ざんなど)。

* MaaS（Malware as a Service）
	恶意软件即服务
  
* [MFM](https://licensecounter.jp/engineer-voice/blog/articles/20211124_fwaas.html)
  Managed Firewall
  
* Mimikatz
  Windowsのメモリ上に保持されているアカウントの認証情報にアクセスし、管理者権限の取得や他のアカウントのなりすましを行うためのツール。
	* [Mimikatz実行痕跡の発見手法](https://www.iij.ad.jp/dev/tech/techweek/pdf/171108_02.pdf)

+ MSS(Managed Security Service)
企業や組織の情報セキュリティシステムの運用管理を、社外のセキュリティ専門企業などが請け負うサービスのこと。

+ MSSP(Managed Security Service Provider)
MSSを提供するセキュリティベンダーを指す。

- Noware Ransome (ノーウェアランサム)  
データの暗号化をすることなく、窃取したデータのみを材料に脅迫を行うサイバー攻撃。

* OpenFlow

- PAM (Privileged Access Management)  
  特権アクセス管理 / 特权访问管理  
  IT環境内のユーザー、アカウント、プロセス、システムに対する高いレベルの（＝特権）アクセス権や各種権限をコントロールするためのサイバーセキュリティ戦略、及びそのためのテクノロジーを指す。

* [Password Spraying Attack](https://e-words.jp/w/%E3%83%91%E3%82%B9%E3%83%AF%E3%83%BC%E3%83%89%E3%82%B9%E3%83%97%E3%83%AC%E3%83%BC%E6%94%BB%E6%92%83.html)
  パスワードスプレー攻撃（= [Reverse Brute-force Attack](https://e-words.jp/w/%E3%83%AA%E3%83%90%E3%83%BC%E3%82%B9%E3%83%96%E3%83%AB%E3%83%BC%E3%83%88%E3%83%95%E3%82%A9%E3%83%BC%E3%82%B9%E6%94%BB%E6%92%83.html))

* [Pepper (cryptography)](https://en.wikipedia.org/wiki/Pepper_(cryptography))
  Secret salt

* [PoP](https://ja.wikipedia.org/wiki/PoP)
  Point of Presence
  通信エンティティ間の、人為的な境界ポイントまたはNWインターフェイスポイント。

* QSA
Qualified Security Assessors/認定セキュリティ評価機関。PCISSCにされたセキュリティ監査企業。

* [RaaS](https://www.cybereason.co.jp/blog/ransomware/7277/)（Ransomware as a Service）
	勒索软件即服务

* [RADIUS](https://e-words.jp/w/RADIUS.html)
  Remote Authentication Dial-In User Service / 远程认证服务 / ラディウス

* [RAT](https://e-words.jp/w/RAT.html) 
	Remote Access Trojan / 遠隔操作ウイルス / 远程操作病毒

* Remote Access
	* アクセス対象がPC
	Remote Desktop
	* アクセス対象が企業などのサーバ（orその中の仮想環境）
		* VPN
		* VDI
		* [SBC](https://e-words.jp/w/VDI.html)（Server-Based Computing）
      サーバーOS上でマルチユーザーに対応したデスクトップを動作させて、これを複数台の端末で共有する方式。リソース利用効率が高いため、コスト削減に向いている。
	* アクセス対象がクラウド上のサーバ
		* [Desktop as a Service（DaaS）](https://e-words.jp/w/DaaS.html)

* Remote Desktop
  あるPCのデスクトップ画面を、NWを通じて他のPCに転送して遠隔から操作すること。
	* 使用例
		* [Windowsのリモートデスクトップ（RDS）](https://e-words.jp/w/%E3%83%AA%E3%83%A2%E3%83%BC%E3%83%88%E3%83%87%E3%82%B9%E3%82%AF%E3%83%88%E3%83%83%E3%83%97%E3%82%B5%E3%83%BC%E3%83%93%E3%82%B9.html)
		* Citrix Remote PC Access
		* [Chromeリモートデスクトップ](https://ja.wikipedia.org/wiki/Chrome_%E3%83%AA%E3%83%A2%E3%83%BC%E3%83%88_%E3%83%87%E3%82%B9%E3%82%AF%E3%83%88%E3%83%83%E3%83%97)
		* [macOS ARD（Apple Remote Desktop）](https://ja.wikipedia.org/wiki/Apple_Remote_Desktop)

* [Sanctioned IT](https://e-words.jp/w/%E3%82%B7%E3%83%A3%E3%83%89%E3%83%BCIT.html) / サンクションIT
  認可されているIT

* [Salt（Cryptography）](https://ja.wikipedia.org/wiki/%E3%82%BD%E3%83%AB%E3%83%88_(%E6%9A%97%E5%8F%B7))

* [SASE](https://www.ntt.com/bizon/glossary/e-s/sase.html)
  Secure Access Service Edge / 安全访问服务边缘 / サッシー
	* ネットワーク的役割
		* SD-WAN
		* WAN最適化
	* セキュリティ的役割
		* SWG
		* ZTNA
		* WAAPaaS
		* FWaaS
	* メリット
		* ゼロトラスト実現によるセキュリティ強化
		* 働き方改革に対応したネットワーク環境の実現
		* 業務の生産性向上
		* 運用の一元化による負担減

* [SDN](https://www.ntt.com/bizon/glossary/e-s/sdn.html)
  Software Defined Networking / 软件定义网络

* [SDP](https://e-words.jp/w/SDP-1.html)
  Software-Defined Perimeter
	* SPA（Single Packet Authorization）

* [SD-WAN](https://www.ntt.com/bizon/glossary/e-s/sdwan.html)
  Software Defined-Wide Area Networ / 软件定义广域网

* [Shadow IT](https://e-words.jp/w/%E3%82%B7%E3%83%A3%E3%83%89%E3%83%BCIT.html) / 影子IT / シャドウIT

* [Sizing](https://e-words.jp/w/%E3%82%B5%E3%82%A4%E3%82%B8%E3%83%B3%E3%82%B0.html) / サイジング

- [SOAR](https://www.nec-solutioninnovators.co.jp/ss/insider/column17.html)
  Security Orchestration,Automation & Response / ソアー /  
  製品例：[RSA Netwitness Orchestrator](https://www.netwitness.com/ja/products/security-automation-orchestration/)

* SOC
  Security Operation Center

* SSE
  安全服务边缘

* SSH（Secure Shell）
  [SSHの暗号化とホスト認証](https://hostingstock.net/blog/20150516/)

* [SWG](https://e-words.jp/w/SWG.html)
  Secure Web Geteway / 安全Web网关
  プロキシにセキュリティ機能を追加したWebアクセスのゲートウェイのこと。
	* アプリケーション制御
	* マルウェア対策
	* SSLインスペクション etc.

* [TACACS+](https://e-words.jp/w/TACACS-_.html)
  Terminal Access Controller Access-Control System Plus / タカックスプラス

* [Threat Hunting](https://eset-info.canon-its.jp/malware_info/special/detail/201007.html)
  脅威ハンティング / スレットハンディング / 威胁处理
  企業のNWに潜んでいるハッカーやマルウェアを見つけ出すこと。
  * [White Paper](https://4c281b16296b2ab02a4e0b2e3f75446d.cdnext.stream.ne.jp/auth/bzt/production/2022/04/C22030173/C22030173-001.pdf?__token=uZY63e+x3N4uPV0QMhmbJAuv2Zk9yJpohjxWEkhJTkI=131e28afb57e43ed)

* [UTM](https://www.ntt.com/bizon/glossary/e-u/utm.html)
  Unified Threat Management

* [VDI](https://e-words.jp/w/VDI.html)
  Virturl Desktop Infrastructure / 虚拟桌面基础架构 / 仮想デスクトップインフラ。
  Desktop環境を仮想化してサーバ上に集約したもの。利用者は端末からNWを通じてサーバ上の仮想マシンに接続し、Desktop画面を呼び出して操作する。
	* 利用端末のできること
	* キーボードやマウスからの入力。

利用端末のできないこと
画面内容のコピー（情報漏えい防止。ただし携帯から写真撮影などは防げない）

* [VNC](https://e-words.jp/w/VNC.html)
  Virtual Network Computing

- Vulnerability Chaining (脆弱性連鎖)  
  サイバーセキュリティの分野で、複数の脆弱性を組み合わせることで、より大きな影響や攻撃を実現する手法。以下が例
  - Privilege Escalation Attack (権限昇格攻撃)  
    攻撃者は、まず低い権限の脆弱性を利用して侵入し、その後別の脆弱性を利用して権限を昇格させ、管理者権限を取得。
  - SQLiとXSSの連鎖  
    攻撃者は、まずWebアプリでSQLiを利用してDBを乗っ取り、次に取得したデータをXSS攻撃に利用してユーザーのブラウザで任意のスクリプトを実行させる。

* [VPN Gateway](https://e-words.jp/w/VPN%E3%82%B2%E3%83%BC%E3%83%88%E3%82%A6%E3%82%A7%E3%82%A4.html)
  内部NWと外部NWの境界に置かれ、別のNWとの間で暗号化された安全な通信経路を作り出す終端装置。
	* 機能
		* 接続
		* 承認
		* 暗号化
		* 複合
	* 実装形態
		 * 専用NW機器
		* SWとしてサーバに実装
		* Router/FW等一部の機能
	* 接続形態
		* VPN Gateway <->（VPN通信）<-> VPN Gateway 接続
		* 端末内VPN Client -> （VPN通信）VPN Gateway 接続

* VPT  
Vulnerability Prioritization Technology（漏洞优先级技术）

- WAAP  
Web Application and API Protection (Web アプリケーションと API の保護)   
ガートナー社が提唱する概念、Webアプリケーション保護対策に加えAPI保護機能を備えているソリューション。
主要な機能：  
  - WAF : iSQL攻撃、XSSなど攻撃から守る上で欠かせないツール。
  - API対策
  - Bot対策
  - DDoS攻撃

* [White Paper](https://www.onemarketing.jp/contents/whitepaper-re/) / 白皮书 / ホワイトペーパー / 白書
  商品やサービスに関する情報を記載し、課題解決に関するソリューションを提案する「報告書」。

- zero-day attack  
  漏洞尚未被软件或硬件供应商识别或修复，因此攻击者可以在漏洞曝光后的第零天就开始利用它们的漏洞。
  - 半日漏洞  
    漏洞信息已经在GitHub或国家漏洞数据库上披露，但仍然没有官方修复补丁的漏洞。
  - 0.75日漏洞  
    那些已经有官方修复程序，但没有分配CVE编号或CPE标识符的漏洞。  
    (这意味着漏洞扫描工具暂时无法检测到IT环境中的易受攻击组件，安全团队也不知道需要安装补丁)

  ||零日漏洞|半日漏洞|0.75日漏洞|1日~漏洞|
  |:-:|:-:|:-:|:-:|:-:|
  |官方的漏洞认知|x|o|o|o|
  |官方的漏洞修复提供|x|x|o|o|
  |漏洞公开(Github/NVD etc.)|x|o|o|o|
  |CVE编号|x|x|x|o|
  |最早发现漏洞的人|非恶意攻击者|-|-|-|

- [Zero Standing Privilege (ZSP)](https://mnb.macnica.co.jp/2024/02/zerotrust/ZSP.html)  
  攻撃経路の最小化:IDを悪用した攻撃経路を最小化する。  
  - ZSPの世界では、ターゲットシステムには特権IDを常時持たせない状態を目指す。
    ![file](https://i.imgur.com/5AjaFaW.png)
    (ref: https://mnb.macnica.co.jp/2024/02/zerotrust/ZSP.html)

* [ZTNA](https://www.nri-secure.co.jp/blog/explanation-of-zero-trust-network-access)
  Zero Trust Network Access / 零信任网络访问 / ゼロトラストネットワークアクセス  
特長
  * 急なユーザ追加にも柔軟にも対応可能
  * 社内に対する攻撃を受けにくくなる
  * 通信経路の最適化
  * ポリシーの一元管理が可能
  * ゼロトラスト推進に繋がる

* [アノマリ（Anomaly）](https://e-words.jp/w/%E3%82%A2%E3%83%8E%E3%83%9E%E3%83%AA.html)
システムの状態などが平常な値の範囲などから外れることを指す。

# Resources
## America

## China
* [安全客](https://www.anquanke.com/)
* [51CTO](https://www.51cto.com/netsecurity)

## Japan
* [JPCERT/CC Eyes]'https://blogs.jpcert.or.jp/ja/)（JPCERTコーディネーションセンター公式ブログ）

# Malwares
* AgentTesla
高级 RAT（Remote Access Trojan），用作键盘记录器和信息窃取器。
* AlienBot
适用于 Android 的银行木马，作为恶意软件即服务 (MaaS) 在地下出售。它支持键盘记录、用于凭据盗窃的动态覆盖以及用于绕过 2FA 的 SMS 收集。
* Anubis
一种专为 Android 手机设计的银行木马恶意软件。
* Emotet
* Formbook
针对 Windows 操作系统的信息窃取程序。
* Hydra
银行木马，旨在通过请求受害者启用危险权限来窃取金融凭证。
* IcedID
メールやブラウザなどの情報を窃取するトロイの木馬型の不正プログラム。
银行木马，通过垃圾邮件活动传播，并经常使用 Emotet 等其他恶意软件来帮助其扩散。
* Phorpiex
僵尸网络（又名 Trik），在其高峰期控制了超过一百万台受感染的主机。它以通过垃圾邮件活动分发其他恶意软件系列以及助长大规模垃圾邮件和性勒索活动而闻名。
* Qbot（Qbot AKA Qakbot）
银行木马，首次出现于 2008 年，旨在窃取用户的银行凭证和击键。
* Ramnit
模块化银行木马，窃取网络会话信息，使其运营商能够窃取受害者使用的所有服务的帐户凭据，包括银行、公司和社交网络帐户。
* Raspberry Robin
蠕虫，通过受感染的 USB 设备进行传播、使用多个合法的窗口实用程序来与其 C&C 服务器通信并执行恶意负载。
* SnakeKeylogger
模块化的 .NET 键盘记录器和凭证窃取程序。
* TLPT
Threat-Led Penetration Testing / 脅威ベースのペネトレーションテスト
* XMRig
用于挖掘 Monero 加密货币的开源 CPU 挖掘软件。

# Malicious Organizations
- 8220 Gang（別名: ReturnedLibra）
Cryptojacker / クリプトジャッカー / 加密挖矿者

- LockBit
勒索软件团伙 / Ransomware Group

- Monti
ランサムウェアグループ

- Qakbot
マルウェア・アズ・ア・サービス


# Best Practices
## GitHub.com
* [从Okta源代码泄露看GitHub的安全威胁与防护](https://www.51cto.com/article/743487.html)
	* 1.不要将私人账户用于工作
	* 2.通过单点登录进行身份验证（SSO）
	* 3.所有账户都采用2FA
	* 4.使用SSH密钥用于git操作
	* 5.使用角色限制特权访问
	* 6.严格限制外部合作者使用
	* 7.审核，分析，再审核

## 资产管理
* [安全基建下，如何建设资产识别能力](https://live.freebuf.com/activity/live/?id=5dbe8962c8270e76c3759ae0d02b69f2)

## App的安全防护
* [支付宝的全链路安全防护建设](https://live.freebuf.com/live/a61726a930f0592aa0f0df7f0caf8542/l_195e06b33aad0b5f3c62fce39194ee80)

# Security Organizations
+ [IPA 情報セキュリティ](https://www.ipa.go.jp/security/index.html)
  + Information-technology Promotion Agency, Japan
  + 独立行政法人情報処理推進機構
+ [NISC](https://www.nisc.go.jp/)
内閣サイバーセキュリティセンター(National center of Incident readiness and Strategy for Cybersecurity)
+ [JPCERT/CC](https://www.jpcert.or.jp/)
  + Japan Computer Emergency Response Team Coordination Center
  + 一般社団法人JPCERTコーディネーションセンター
  + 国民に広く影響をもたらす組織・団体のセキュリティ部署・CSIRTにセキュリティ脅威情報や分析対策情報を提供
+ [NCA](https://www.nca.gr.jp/)
  + Nippon CSIRT Association
  + 一般社団法人日本シーサート協議会
  + 日本で活動のCSIRT間の情報共有と連携を図るとともに、組織内CSIRTの活動を促進、支援していく
+ [JNSA](https://www.jnsa.org/)
  + Japan Network Security Association
  + 特定非営利活動法人日本ネットワークセキュリティ協会
  + セキュリティを提供するベンダーやSI、プロバイダが連携し、セキュリティに関わる諸問題の解決に取り込む
+ 各業界ISAC
  + Information Sharing and Analysis Center
  + 「アイザック」と読む
  + 同業界の事業者で構成される**民間組織**、セキュリティを共有することで業界全体での安全性向上を目指す

# Known Security Companies
* KnowBe4
	https://www.knowbe4.com/
	全球首屈一指的安全意识培训和模拟网络钓鱼平台供应商。
* 瑞数信息（瑞数信息技术(上海)有限公司）
	https://www.riversecurity.com/
	专注于提供业界最前沿的互联网动态业务应用安全防护解决方案。

# CyberAttacks
## RansomeWare
* 阪急性期・総合医療センター（2022-10-31）
	* [ランサムウエア被害の大阪の病院、初動から全面復旧まで2カ月間の全貌](https://xtech.nikkei.com/atcl/nxt/column/18/01157/012600079/?n_cid=nbpnxt_mled_itmh)
* ならコープ（2022-10-09）
		* [ランサムウエア被害のならコープ、身代金は支払わずシステム再構築に2カ月超](https://xtech.nikkei.com/atcl/nxt/column/18/01157/011200078/?n_cid=nbpnxt_mled_itmh)
		* [ならコープが配達サービス本格再開 サイバー攻撃から１か月余](https://www3.nhk.or.jp/lnews/nara/20221121/2050012207.html)
## Personal Information Leakages
* 2022-12-23
	* [Twitter Data Breach +400 million users](https://breached.vc/Thread-Selling-Twitter-Data-Breach-400-million-users)
	* [ツイッター、2.3億人超える情報流出か－ハッカーフォーラム掲載](https://news.yahoo.co.jp/articles/614aa773618655dcfbe44330384b5edbe54a3962)
	* [黑客论坛出售4亿Twitter用户数据库](https://www.anquanke.com/post/id/284658)

