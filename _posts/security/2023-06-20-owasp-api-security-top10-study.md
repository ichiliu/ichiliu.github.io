---
layout: post
title: OWASP API Security Top 10 Study 
subtitle: 
cover-img: [/assets/img/cover/security1.jpg, /assets/img/cover/security2.jpg, /assets/img/cover/security3.jpg]
thumbnail-img: https://i.imgur.com/slPpf5D.png
share-img:
tags: [owasp, top10]
categories: [Security]
---


# Summary
This is my studying note of OWASP API Security Project.
+ The page of [OWASP API Security Project](https://owasp.org/www-project-api-security/).
+ The other [OWASP Top 10 Series](https://github.com/OWASP/API-Security/blob/master/editions/2023/en/0x03-introduction.md).

![file](https://i.imgur.com/slPpf5D.png)

# Editions
There are two ediitons of API Security Top 10, which are 2019 and 2023.
+ [Editions](https://github.com/OWASP/API-Security/tree/master/editions)
  + [2019](https://github.com/OWASP/API-Security/blob/master/editions/2019/en/0x11-t10.md)
  + [2023](https://github.com/OWASP/API-Security/blob/master/editions/2023/en/0x11-t10.md)

![file](https://i.imgur.com/WhMfzv8.png)
ref : https://www.anquanke.com/post/id/288466

# API Security Top 10 – 2023

|Risk|Description|要約|
|:-|:-|:-|
|[API1 - Broken Object Level Authorization](https://github.com/OWASP/API-Security/blob/master/editions/2023/en/0xa1-broken-object-level-authorization.md)</br></br>BOLA</br></br>对象级别授权失效</br></br>オブジェクト・レベル認証の失敗|APIs tend to expose endpoints that handle object identifiers, creating a wide attack surface of Object Level Access Control issues. Object level authorization checks should be considered in every function that accesses a data source using an ID from the user.|APIはオブジェクト識別子を扱うエンドポイントを公開し、これによりアクセス制御の問題が生じやすい。ユーザからのIDを使ってデータにアクセスする全ての機能において、オブジェクトレベルでの認証チェックが必要である。|
|[API2 - Broken Authentication](https://owasp.org/API-Security/editions/2023/en/0xa2-broken-authentication/)</br></br>BA</br></br>身份认证失效</br></br>認証の不備|Authentication mechanisms are often implemented incorrectly, allowing attackers to compromise authentication tokens or to exploit implementation flaws to assume other user's identities temporarily or permanently. Compromising a system's ability to identify the client/user, compromises API security overall.|認証メカニズムの誤った実装により、攻撃者が認証トークンを侵害するか、または実装の欠陥を悪用して他人の身元を詐称する可能性がある。システムのユーザー識別能力が損なわれると、APIの全体的なセキュリティが低下する。|
|[API3 - Broken Object Property Level Authorization](https://github.com/OWASP/API-Security/blob/master/editions/2023/en/0xa3-broken-object-property-level-authorization.md)</br></br>BOPLA</br></br>对象属性级别授权失效</br></br>オブジェクトプロパティレベルの認可不備|This category combines API3:2019 Excessive Data Exposure and API6:2019 - Mass Assignment, focusing on the root cause: the lack of or improper authorization validation at the object property level. This leads to information exposure or manipulation by unauthorized parties.|「API3:2019 過度なデータ公開」と「API6:2019 - 大量割り当て」を組み合わせたもので、問題の根源であるオブジェクトのプロパティレベルにおける認証検証の欠如または不適切さに焦点を当てている。このことが原因で、情報が不正な第三者に公開されたり、操作されたりすることがある|
|[API4 - Unrestricted Resource Consumption](https://github.com/OWASP/API-Security/blob/master/editions/2023/en/0xa4-unrestricted-resource-consumption.md)</br></br>URC</br></br>资源消耗无限制</br></br>制限なきリソース消費|Satisfying API requests requires resources such as network bandwidth, CPU, memory, and storage. Other resources such as emails/SMS/phone calls or biometrics validation are made available by service providers via API integrations, and paid for per request. Successful attacks can lead to Denial of Service or an increase of operational costs.|APIリクエストの処理には各種リソースが必要で、その一部はリクエスト毎に課金される。攻撃が成功すると、サービス停止や運用コストの増加を引き起こす可能性がある。|
|[API5 - Broken Function Level Authorization](https://github.com/OWASP/API-Security/blob/master/editions/2023/en/0xa5-broken-function-level-authorization.md)</br></br>BFLA</br></br>功能级授权失效</br></br>関数レベルの認可不備|Complex access control policies with different hierarchies, groups, and roles, and an unclear separation between administrative and regular functions, tend to lead to authorization flaws. By exploiting these issues, attackers can gain access to other users’ resources and/or administrative functions.|異なる階層、グループ、役割を持つ複雑なアクセス制御ポリシーと、管理機能と一般機能の間の不明確な分離は、認可の欠陥を引き起こす傾向がある。これらの問題を攻撃者が悪用すると、他のユーザーのリソースや管理機能にアクセスできるようになる。|
|[API6 - Unrestricted Access to Sensitive Business Flows](https://github.com/OWASP/API-Security/blob/master/editions/2023/en/0xa6-unrestricted-access-to-sensitive-business-flows.md)</br></br>UAtSBF</br></br>对敏感业务流程的无限制访问</br></br>敏感な業務フローへの無制限アクセス|APIs vulnerable to this risk expose a business flow - such as buying a ticket, or posting a comment - without compensating for how the functionality could harm the business if used excessively in an automated manner. This doesn't necessarily come from implementation bugs.|このリスクに対して脆弱なAPIは、自動化による過度な使用がビジネスに損害をもたらす可能性を考慮せず、ビジネスフローを公開する。これは必ずしも実装のバグから起こるわけではない。|
|[API7 - Server Side Request Forgery](https://github.com/OWASP/API-Security/blob/master/editions/2023/en/0xa7-server-side-request-forgery.md)</br></br>SSRF</br></br>服务端请求伪造</br></br>サーバーサイドリクエストフォージェリ|Server-Side Request Forgery (SSRF) flaws can occur when an API is fetching a remote resource without validating the user-supplied URI. This enables an attacker to coerce the application to send a crafted request to an unexpected destination, even when protected by a firewall or a VPN.|APIがユーザーから提供されたURIを検証せずにリモートリソースを取得する場合、SSRFの脆弱性が生じる可能性がある。これにより、攻撃者はファイアウォールやVPNの保護下にある状態でも、アプリケーションが意図しない宛先に対して操作を行うことができる。|
|[API8 - Security Misconfiguration](https://github.com/OWASP/API-Security/blob/master/editions/2023/en/0xa8-security-misconfiguration.md)</br></br>SM</br></br>安全配置错误</br></br>セキュリティの設定ミス|APIs and the systems supporting them typically contain complex configurations, meant to make the APIs more customizable. Software and DevOps engineers can miss these configurations, or don't follow security best practices when it comes to configuration, opening the door for different types of attacks.|APIとそれをサポートするシステムは、一般的に複雑な構成を持ち、APIをよりカスタマイズ可能にするためのものである。ソフトウェアやDevOpsエンジニアはこれらの構成を見逃すことがあるか、または構成に関するセキュリティのベストプラクティスを遵守しないことがあり、それによってさまざまな種類の攻撃の可能性が生じる。|
|[API9 - Improper Inventory Management](https://github.com/OWASP/API-Security/blob/master/editions/2023/en/0xa9-improper-inventory-management.md)</br></br>IIM</br></br>存量资产管理不当</br></br>適切でない在庫管理|APIs tend to expose more endpoints than traditional web applications, making proper and updated documentation highly important. A proper inventory of hosts and deployed API versions also are important to mitigate issues such as deprecated API versions and exposed debug endpoints.|APIは通常、従来のWebアプリケーションよりも多くのエンドポイントを公開しており、正確かつ最新のドキュメントが重要である。また、適切なホストと展開されたAPIバージョンの管理も重要であり、非推奨のAPIバージョンやデバッグエンドポイントの問題を防ぐのに役立つ。|
|[API10 - Unsafe Consumption of APIs](https://github.com/OWASP/API-Security/blob/master/editions/2023/en/0xaa-unsafe-consumption-of-apis.md)</br></br>UCoA</br></br>API的不安全使用</br></br>APIの危険な利用|Developers tend to trust data received from third-party APIs more than user input, and so tend to adopt weaker security standards. In order to compromise APIs, attackers go after integrated third-party services instead of trying to compromise the target API directly.|開発者は、第三者APIから受け取るデータをユーザーの入力よりも信頼し、そのために弱いセキュリティ基準を採用することがある。APIを侵害するために、攻撃者は直接的に対象のAPIを攻撃するのではなく、統合された第三者サービスを標的にすることもある。|

# API Security Risks
## Common（共通リスク）
|Threat Agents|Business Impacts|
|:-|:-|
|API Specific|Business Specific|

## Specific（特定リスク）
|#|Risk|Exploitability|Prevalence|Detectability|Technical Impacts|
|:-|:-|:-|:-|:-|:-|
|API1|Broken Object Level Authorization|Easy</br>3|Widespread</br>3|Easy</br>3|Moderate</br>2|
|API2|Broken Authentication|Easy</br>3|Common</br>2|Easy</br>3|Severe </br>3|
|API3|Broken Object Property Level Authorization|Easy</br>3|Common</br>2|Easy</br>3|Moderate  </br>2|
|API4|Unrestricted Resource Consumption|Average </br>2|Widespread </br>3|Easy</br>3|Severe   </br>3|
|API5|Broken Function Level Authorization|Easy </br>3|Common </br>2|Easy</br>3|Severe   </br>3|
|API6|Unrestricted Access to Sensitive Business Flows|Easy </br>3|Widespread </br>3|Average </br>2|Moderate</br>2|
|API7|Server Side Request Forgery|Easy </br>3|Common</br>2|Easy </br>3|Moderate</br>2|
|API8|Security Misconfiguration|Easy </br>3|Widespread</br>3|Easy </br>3|Severe</br>3|
|API9|Improper Inventory Management|Easy </br>3|Widespread</br>3|Average</br>2|Moderate</br>2|
|API10|Unsafe Consumption of APIs|Easy </br>3|Common</br>2|Average</br>2|Severe</br>3|

# Attacks & Preventive Measures
以下の疑似攻撃コードはイメージ的なものであり、かつ一部のコードを省略している可能性があるので、くれぐれも悪用しないよう自己責任でお願いします。
## API1 BOLA（Broken Object Level Authorization）
### Attack Example
以下の`JavaScript`コードは任意のshopnameの売上データを取得できうイメージを示している。
```js
// 攻撃者がショップ名を特定し、リクエストを送信して売上データにアクセスする例
// 攻撃対象のショップ名を指定します
const targetShop = 'example-shop';

async function sendRequest(shopName) {
  try {
    const url = `https://example.com/shops/${shopName}/revenue_data.json`;

    // リクエストを送信し、売上データを取得します
    const response = await axios.get(url);

    console.log(response.data);
  } catch (error) {
    console.error(error);
  }
}
sendRequest(targetShop);
```
### Preventive Measures
+ ユーザーポリシーや階層に依存する適切な認可メカニズムを実装。
+ ログインユーザーが要求されたアクションを実行権限を持っているか、DBのレコードにアクセスするためのクライアントからの入力を使用するすべての関数で認可メカニズムを使用。
+ レコードのIDにはランダムかつ予測不可能な値としてGUID（Globally Unique Identifier）を使用。
+ 認可メカニズムの脆弱性を評価するためのテストを作成。

## API2 Broken Authentication
### Vulnerable Behaviors
+ 攻撃者が有効なユーザー名とパスワードのリストを使用して総当たり攻撃を行うクレデンシャルスタッフィングを許可している。
+ キャプチャやアカウントロックアウトのメカニズムを提示せずに、攻撃者が同じユーザーアカウントに対して総当たり攻撃を行うことを許可している。
+ 弱いパスワードを許可している。
+ 認証トークンやパスワードなどの機密性の高い認証詳細をURLに送信している。
+ ユーザーにパスワード確認を求めずに、メールアドレスの変更や現在のパスワードの変更などの機密性の高い操作を許可している。
+ トークンの正当性を検証していない。
+ 未署名または弱く署名されたJWTトークン（{"alg":"none"}）を受け入れている。
+ JWTの有効期限を検証していない。
+ 平文、非暗号化、または弱いハッシュ化されたパスワードを使用している。
+ 弱い暗号化キーを使用している。

さらに、マイクロサービスは以下のような脆弱性がある場合：
+ 他のマイクロサービスが認証なしでアクセスできる。
+ 弱いまたは予測可能なトークンを使用して認証を強制している。

### Attack Example
```js
// サンプルユーザーの認証情報
const username = "admin";
const password = "password";

// 悪意のあるユーザーが攻撃対象のユーザー名とパスワードを入手した場合の攻撃コード
async function attack() {
  try {
    // 攻撃者が正当なユーザーのクレデンシャルを使用して認証をバイパスし、権限のあるリソースにアクセスします
    const response = await axios.get("https://example.com/admin_panel", {
      headers: { Authorization: "Bearer <attacker_token>" }
    });

    // 攻撃者が得た機密情報や操作結果を利用します
    if (response.status === 200) {
      console.log("機密情報を取得しました！");
    }
  } catch (error) {
    console.error(error);
  }
}
attack();
```
### Preventive Measures
+ APIへの認証フローを理解し、可能なフローを確認する。見落としているフローがないか、エンジニアに確認。
+ 認証メカニズムについて学び、それがどのように使われるのか理解。<font color=red>OAuthは認証ではなく、APIキーも同様ではない</font>。
+ 認証、トークン生成、パスワードの保存において車輪の再発明を避ける。標準を使用。
+ 認証回復/PW忘れのエンドポイントは、ブルートフォース、レート制限、ロックアウト保護の観点でログインエンドポイントと同様に扱う。
+ 機密な操作には再認証を要求。
+ OWASP Authentication Cheatsheetを使用。
+ 可能な場合は、多要素認証を実装。
+ 認証エンドポイントへのcredential staffing、辞書攻撃、ブルートフォース攻撃を緩和するための対策を実装。このメカニズムは、APIの通常のレート制限メカニズムよりも厳格であるべき。
+ 特定のユーザーに対するブルートフォース攻撃を防ぐために、アカウントロックアウト/キャプチャメカニズムを実装。弱いパスワードのチェックを実装。
+ <font color=red>APIキーはユーザー認証に使用すべきではなく、APIクライアントの認証にのみ使用する</font>。

## API3 Broken Object Property Level Authorization
### Vulnerable Behaviors
+ APIのエンドポイントは、ユーザーが読むべきでないとされるオブジェクトのプロパティを公開している（以前は「過剰なデータ露出」と呼ばれていた）。
+ APIのエンドポイントは、ユーザーがアクセスできないべきである敏感なオブジェクトのプロパティの値を変更、追加、または削除することを許可してる（以前は「マスアサインメント」と呼ばれていました）。

### Attack Example
下記の擬似コードでは、攻撃者は__proto__プロパティを使用して、リソースに新しいプロパティ（isAdmin）を追加し、セキュリティ制約を回避して不正な操作を行うことを示している。
```js
const axios = require('axios');
// 攻撃対象のリソースID
const resourceId = '12345';

// 攻撃ペイロード
const payload = {
  __proto__: {
    isAdmin: true
  }
};

// リソースの更新リクエストを送信
axios.patch(`https://example.com/resources/${resourceId}`, payload)
  .then((response) => {
    console.log(response.data);
  })
  .catch((error) => {
    console.error(error);
  });
```
### Preventive Measures
+ APIエンドポイントを使用してオブジェクトを公開する際には、公開するオブジェクトのプロパティにアクセス権があることを常に確認。
+ to_json()やto_string()などの汎用的なメソッドの使用は避け、返す特定のオブジェクトプロパティを選択的に取得（<font color=red>cherry-pick</font>）。

```js
// Sample object with sensitive properties
const user = {
  id: '123456',
  name: 'John Doe',
  email: 'johndoe@example.com',
  password: 'secretpassword',
};

// Cherry-picking specific properties to return
const publicUser = {
  id: user.id,
  name: user.name,
};

console.log(publicUser);
// Output: { id: '123456', name: 'John Doe' }
```
+ クライアントの入力をコード変数や内部オブジェクト、オブジェクトプロパティに自動的にバインドする関数の使用を避ける（<font color=red>「Mass Assignment」</font>）。

問題あるコード：
```js
// User model
class User {
  constructor(name, email) {
    this.name = name;
    this.email = email;
    this.isAdmin = false;
  }
}

// API endpoint to update a user's profile
app.put('/users/:id', (req, res) => {
  const { id } = req.params;
  const { name, email, isAdmin } = req.body;

  // Update the user's profile
  const user = findUserById(id);

  // Mass assignment without proper authorization checks
  Object.assign(user, req.body);

  // Save the updated user
  saveUser(user);

  res.json({ message: 'User profile updated successfully' });
});
```
問題ないコード：

```js
// User model
...省略...
// API endpoint to update a user's profile
app.put('/users/:id', (req, res) => {
  const { id } = req.params;
  const { name, email, isAdmin } = req.body;

  // Update the user's profile
  const user = findUserById(id);

  // Only update the allowed properties
  if (name) user.name = name;
  if (email) user.email = email;

  // Perform proper authorization checks for isAdmin
  if (isAdmin && user.isAdmin) {
    user.isAdmin = isAdmin;
  }

  // Save the updated user
  saveUser(user);

  res.json({ message: 'User profile updated successfully' });
});
```
+ クライアントによって更新されるべきオブジェクトのプロパティにのみ変更を許可。
+ 付加的なセキュリティレイヤーとして、スキーマベースの応答検証メカニズムを実装。このメカニズムでは、すべてのAPIメソッドで返されるデータを定義し、強制する。
+ エンドポイントのビジネス/機能要件に基づいて、返されるデータ構造を最小限に保つ。

## API4 Unrestricted Resource Consumption
### Vulnerable Behaviors
APIの脆弱性は、次のいずれかの制限が不足しているか、適切に設定されていない場合に生じる:
+ 実行タイムアウト
+ 最大割り当て可能メモリ
+ 最大ファイルディスクリプタ数
+ 最大プロセス数
+ 最大アップロードファイルサイズ
+ 1つのAPIクライアントリクエストで実行する操作の数（例：GraphQLバッチング）
+ 1つのリクエスト-レスポンスで返されるページごとのレコード数
+ 3rd Partyサービスプロバイダの支出制限

### Attack Example
```js
const express = require('express');
const app = express();

// Endpoint that performs a heavy computation
app.get('/process', (req, res) => {
  // Simulate a resource-intensive operation
  const result = performHeavyComputation();
  res.json({ result });
});

// Function that simulates a resource-intensive operation
function performHeavyComputation() {
  let sum = 0;
  for (let i = 0; i < Number.MAX_SAFE_INTEGER; i++) {
    sum += i;
  }
  return sum;
}
```
### Preventive Measures
+     メモリ、CPU、再起動回数、ファイルディスクリプタ、およびプロセスの制限を簡単に行うために、コンテナやサーバーレスコード（Lambdaなど）などを使用。
+ 文字列の最大長、配列の要素数の最大値、アップロードファイルの最大サイズなど、全ての受信パラメータとペイロードのデータに最大サイズを定義し、強制する。
+ クライアントがAPIとのやり取りを定義された時間枠内で何回行えるかを制限する（レート制限）。

```js
...省略...
const app = express();

// Apply rate limiting middleware
const limiter = rateLimit({
  windowMs: 60 * 1000, // 1 minute window
  max: 100, // limit each IP to 100 requests per windowMs
});

// Apply rate limiting to all requests
app.use(limiter);
// Rest of your application routes and logic
...
```
+ レート制限はビジネスのニーズに基づいて調整する必要がある。一部のAPIエンドポイントではより厳しいポリシーが必要な場合がある。
+ 同じAPIクライアント/ユーザーが特定の操作（例：OTPの検証、ワンタイムURLを訪れずにPWリカバリを要求など）を実行できる回数や頻度を制限。
+ 応答で返されるレコード数を制御するクエリ文字列とリクエストボディパラメータのサーバーサイドでの適切なバリデーションを追加。
+ 全てのサービスプロバイダー/API統合のために<font color=red>支出制限を設定する。支出制限を設定できない場合は、代わりに請求アラートを設定</font>。

## API5 Broken Function Level Authorization
### Vulnerable Behaviors
+ 一般ユーザーは管理用のエンドポイントにアクセスできるか？
+ ユーザーは、HTTPメソッドを変更するだけで（GETからDELETEなど）、アクセス権限のない操作（作成、変更、削除など）を実行できるか？
+ グループXのユーザーは、エンドポイントのURLやパラメーターを推測するだけで、本来グループYのユーザーだけがアクセスできる機能にアクセスできるか（例：/api/v1/users/export_all）？

### Attack Example
```js
// 擬似的なユーザーデータベース
const users = [
  { id: 1, name: 'Alice', role: 'user' },
  { id: 2, name: 'Bob', role: 'admin' }
];

// ユーザー情報を取得するAPIエンドポイント
app.get('/users/:id', (req, res) => {
  const userId = parseInt(req.params.id);
  const user = users.find(user => user.id === userId);

  // ユーザーが存在しない場合はエラーを返す
  if (!user) {
    return res.status(404).json({ error: 'User not found' });
  }
  // ユーザーが管理者権限を持っていない場合でもユーザー情報を返す（セキュリティチェック漏れ）
  res.json(user);
});
```
### Preventice Mesures
+ アクセス制御のメカニズムは、デフォルトですべてのアクセスを拒否し、特定の役割へのアクセスに明示的な権限付与を必要とする。
 + アプリのビジネスロジックとグループの階層を考慮しながら、APIエンドポイントを関数レベルの認可の欠陥に対してレビューをする。
 + 管理コントローラーは、ユーザーのグループ/役割に基づいて認可チェックを実装する管理用の抽象コントローラーを継承するようにする。
+ 通常のコントローラー内の管理機能は、ユーザーのグループと役割に基づいた認可チェックを実装するようにする。

```js
...省略...
  // ユーザーが存在しない場合はエラーを返す
  if (!user) {
    return res.status(404).json({ error: 'User not found' });
  }

  // ユーザーの権限をチェックする（認可）
  if (!isAdmin(req.user)) {
    return res.status(403).json({ error: 'Unauthorized' });
  }
  // ユーザー情報を返す
  res.json(user);
});
// ユーザーが管理者権限を持っているかどうかを判定するヘルパー関数
function isAdmin(user) {
  return user.role === 'admin';
}
```
## API6 Unrestricted Access to Sensitive Business Flows
### Vulnerable Behaviors
+ 商品の購入フローでは、攻撃者は高需要商品の在庫を一度に購入して、高値で転売することができる（スケーリング攻撃）。
+ コメント/投稿のフローでは、攻撃者はシステムにスパムを送ることができる。
+ 予約の作成では、攻撃者は利用可能な時間枠を全て予約し、他のユーザーがシステムを利用できないようにすることができる。

### Attack Example
```js
// 擬似的な在庫管理データベース
let stock = 100;

// 擬似的な購入APIエンドポイント
app.post('/purchase', (req, res) => {
  // 在庫がない場合はエラーを返す
  if (stock <= 0) {
    return res.status(400).json({ error: 'Out of stock' });
  }
  // 在庫を減らす
  stock--;
  // 購入が成功したメッセージを返す
  res.json({ message: 'Purchase successful' });
});
```
### Preventice Measures
+ ビジネス: ビジネスに過度に使用される場合に損害を与える可能性のあるビジネスフローを特定。
+ エンジニアリング: ビジネスリスクを軽減するために適切な保護メカニズムを選択。
  + デバイスのフィンガープリント: 脅威アクターがより高度なソリューションを使用する必要があるため、予期しないクライアントデバイス（ヘッドレスブラウザなど）に対してサービスを拒否。
  + 人間の検出: captchaやより高度なバイオメトリックソリューション（タイピングパターンなど）を使用。
  + 非人間のパターン: ユーザーフローを分析し、非人間のパターン（例：「カートに追加」と「購入完了」の機能へのアクセスが1秒未満で行われるなど）を検出。
  + Torの出口ノードやよく知られたプロキシのIPアドレスをブロック。

```js
...省略...
  // 同じユーザーからの連続した購入リクエストを制限する
  if (isRequestLimitReached(userId)) {
    return res.status(429).json({ error: 'Too many requests' });
  }
  // 在庫を減らす
  stock--;
  // 購入が成功したメッセージを返す
  res.json({ message: 'Purchase successful' });
});
// ユーザーごとのリクエスト制限を管理するオブジェクト
const requestLimits = {};
// 同じユーザーからの連続した購入リクエストを制限する関数
function isRequestLimitReached(userId) {
  const limit = 3; // 同じユーザーからの許可される連続したリクエストの最大数
  // ユーザーのカウンタをインクリメント
  requestLimits[userId] = (requestLimits[userId] || 0) + 1;
  // カウンタが制限を超えている場合はtrueを返す
  return requestLimits[userId] > limit;
}
```
## API7 Server Side Request Forgery
### Attack Example
```js
// プロフィール画像のアップロードAPIエンドポイント
app.post('/api/profile/upload_picture', async (req, res) => {
  const pictureUrl = req.body.picture_url;

  // SSRF攻撃の脆弱性があるコード
  try {
    const response = await axios.get(pictureUrl);
    // レスポンスの処理（例えば、レスポンス時間を判定するなど）
    // ... 
    res.json({ message: 'Picture uploaded successfully' });
  } catch (error) {
    res.status(400).json({ error: 'Failed to upload picture' });
  }
});
```
### Preventive Measures
+ NW内のリソース取得メカニズムを分離。通常、これらの機能は内部のリソースではなく、リモートのリソースを取得することを目的としている。
+ 可能な限り、以下の許可リストを使用:
  + ユーザーがリソースをダウンロードすることが期待されるリモート元（例：Google Drive、Gravatarなど）
  + URLスキームとポート
  + 特定の機能に対して許可されるメディアタイプ
+ HTTPリダイレクションを無効にする。
+ URLの解析の一貫性に起因する問題を回避するため、信頼性の高いURLパーサーを使用。
+ クライアントからの入力データを検証し、無害化する。
+ クライアントに生のレスポンスを送信しない。

```js
// プロフィール画像のアップロードAPIエンドポイント
app.post('/api/profile/upload_picture', async (req, res) => {
  const pictureUrl = req.body.picture_url;

  // 信頼されたドメインのみを許可するフィルタリング
  if (!isAllowedDomain(pictureUrl)) {
    return res.status(400).json({ error: 'Invalid picture URL' });
  }

  try {
    const response = await axios.get(pictureUrl);
    // レスポンスの処理
    // ... 
    res.json({ message: 'Picture uploaded successfully' });
  } catch (error) {
    res.status(400).json({ error: 'Failed to upload picture' });
  }
});

// 信頼されたドメインのフィルタリング関数
function isAllowedDomain(url) {
  // 許可されたドメインのリストを定義
  const allowedDomains = ['example.com', 'example.net'];

  // URLからホスト部分を抽出
  const host = new URL(url).hostname;

  // ホストが許可されたドメインのリストに含まれているかをチェック
  return allowedDomains.includes(host);
}
```
## API8 Security Misconfiguration
### Vulnerable Behavors
+ APIスタックのどの部分でも適切なセキュリティ強化が欠けているか、またはクラウドサービスの権限が適切に設定されていない場合。
+ 最新のセキュリティパッチが欠けているか、システムが最新ではない場合。
+ 不要な機能が有効になっている（例：HTTP動詞、ロギング機能）。
+ HTTPサーバーチェーン内のサーバーによって着信リクエストの処理方法に不整合がある。
+ Transport Layer Security (TLS) が欠けている。
+ セキュリティやキャッシュ制御の指示がクライアントに送信されていない。
+ Cross-Origin Resource Sharing (CORS) ポリシーが欠けているか、不適切に設定されている。
+ エラーメッセージにスタックトレースが含まれているか、他の機密情報が露出している。

### Attack Example
```js
// ロギングミドルウェアの設定
app.use(loggingMiddleware);

// ヘルスチェックAPIエンドポイント
app.get('/health', (req, res) => {
  res.send('Server is healthy');
});

// ログ出力ミドルウェア
function loggingMiddleware(req, res, next) {
  const method = req.method;
  const apiVersion = req.headers['x-api-version'];
  const path = req.path;
  const statusCode = res.statusCode;

  // ログフォーマットの作成
  const logEntry = `${method} ${apiVersion}/${path} - ${statusCode}`;

  // サードパーティのロギングユーティリティにログエントリを書き込む
  writeLogEntry(logEntry);

  next();
}

// サードパーティのロギングユーティリティにログエントリを書き込む関数
function writeLogEntry(logEntry) {
  // ログエントリをファイルに書き込む（サードパーティのロギングユーティリティ）
  // ...
}
```
セキュリティリスク：攻撃者がX-Api-Versionヘッダーを利用して、リモートサーバーからのMalicious.classオブジェクトの読み込みと実行を引き起こす可能性がある。これにより、攻撃者はサーバー上で悪意のある操作を実行できてしまう。

### Preventive Mesasures
APIライフサイクルの要点は以下の通り:
+ 適切にロックダウンされた環境の迅速かつ容易な展開を可能にする、繰り返し可能な強化プロセスの導入。
+ APIスタック全体の設定のレビューと更新を行うタスク。レビューには、オーケストレーションファイル、APIコンポーネント、クラウドサービス（例：S3バケットの権限）が含まれる。
+ すべての環境で設定と設定の有効性を継続的に評価するための自動化プロセス。

さらに:
+ <font color=red>クライアントからAPIサーバーおよび上流/下流のコンポーネントへのすべてのAPI通信は、暗号化された通信チャネル（TLS）を介して行われるようにする（内部のAPIであっても、公開APIであっても）</font>。
+ <font color=red>各APIにアクセス可能なHTTP動詞を明示的に指定し、他のすべてのHTTP動詞を無効にする（例：HEAD）</font>。
+ ブラウザベースのクライアント（例：Webアプリのフロントエンド）からアクセスされることを想定したAPIは、少なくとも以下を実装する必要があります：
  + 適切なCross-Origin Resource Sharing (CORS) ポリシーの実装。
  + 適用可能なセキュリティヘッダーを含める。
+ ビジネス/機能要件を満たす形式のみが受け入れられるように、着信コンテンツの種類/データ形式を制限。

```js
// ロギングミドルウェアの設定
app.use(loggingMiddleware);

// ヘルスチェックAPIエンドポイント
app.get('/health', (req, res) => {
  res.send('Server is healthy');
});

// ログ出力ミドルウェア
function loggingMiddleware(req, res, next) {
  const method = req.method;
  const apiVersion = req.headers['x-api-version'];
  const path = req.path;
  const statusCode = res.statusCode;

  // ログフォーマットの作成
  const logEntry = `${method} ${apiVersion}/${path} - ${statusCode}`;

  // サニタイズされたログエントリをロギングユーティリティに渡してログを書き込む
  writeLogEntry(sanitizeLogEntry(logEntry));

  next();
}

// サードパーティのロギングユーティリティにログエントリを書き込む関数
function writeLogEntry(logEntry) {
  // ログエントリをファイルに書き込む（サードパーティのロギングユーティリティ）
  // ...
}

// ログエントリのサニタイズ処理
function sanitizeLogEntry(logEntry) {
  // ログエントリをサニタイズする処理を実装する
  // 例えば、特殊文字のエスケープや入力の正規化を行う
  // 具体的な実装は、セキュリティポリシーや要件に基づきます
  const sanitizedLogEntry = // サニタイズされたログエントリ
  return sanitizedLogEntry;
}

// サーバーを起動
app.listen(3000, () => {
  console.log('Server started on port 3000');
});

```
+ HTTPサーバーチェーン（LB、リバース/フォワードプロキシ、BEサーバーなど）の<font color=red>すべてのサーバーが一貫した方法で着信リクエストを処理するようにし、デシンクの問題を回避する</font>。
+ 該当する場合、攻撃者に送り返される例外トレースや他の貴重な情報を防ぐため、すべてのAPIのレスポンスペイロードスキーマ（エラーレスポンスを含む）を定義し、強制する。

## API9 Improper Inventory Management
### 下記該当する場合は盲点が存在する
文書上の盲点：

+ APIホストの目的が明確ではなく、以下の質問に明確な回答がない場合：
  + APIはどの環境で実行されているか（例：本番、ステージング、テスト、開発）？
  + APIへのNWアクセスは誰が持つべきですか（例：公開、内部、パートナー）？
  + 実行中のAPIバージョンは何か？
+ ドキュメンテーションが存在しないか、既存のドキュメンテーションが更新されてない。
+ 各APIバージョンの廃止計画がない。
+ ホストの在庫が欠落している/更新されていない。

データフロー上の盲点

+ APIにおいて、第三者との間で機密データを共有する「機密データフロー」が存在するが、以下の問題点がある場合：
  + フローのビジネス上の正当性や承認が明確にされていない。
  + フローの在庫や可視性がない状態。
  + 共有される機密データの詳細な可視性がない。

### Attack Example
```js
// リセットトークンをブルートフォースで推測する攻撃の擬似コード
async function bruteForceResetToken() {
  const baseUrl = 'http://beta.api.socialnetwork.example.com';

  // ユーザーIDや他の必要な情報を取得するためのリクエストなどがある場合は、適宜追加してください

  for (let i = 0; i < 1000000; i++) {
    const resetToken = String(i).padStart(6, '0'); // 6桁のトークンを推測

    try {
      // リセットパスワードAPIエンドポイントにリクエストを送信
      const response = await axios.post(`${baseUrl}/reset_password`, { token: resetToken });

      // レスポンスのステータスコードやメッセージなどをチェックし、成功したかどうかを判断する
      if (response.status === 200 && response.data.success) {
        console.log(`Password reset successfully. Token: ${resetToken}`);
        break;
      }
    } catch (error) {
      // エラーレスポンスの場合は何もしないか、適切なエラーハンドリングを行う
    }
  }
}

// ブルートフォース攻撃を実行
bruteForceResetToken();
```
### Preventive Mesures
+ APIホストの在庫を作成し、各ホストの重要な要素を文書化する。重点的には、APIの環境（本番、ステージング、テスト、開発）、ホストへのネットワークアクセス権限（公開、内部、パートナー）、およびAPIバージョンである。
+ 統合されたサービスの在庫を作成し、システム内での役割、データのやり取り（データフロー）、およびセンシティビティなどの重要な要素を文書化。
+ APIのすべての側面（認証、エラー処理、リダイレクト、レート制限、Cross-Origin Resource Sharing（CORS）ポリシー、エンドポイントなど）を文書化する。これには、パラメータ、リクエスト、レスポンスも含まれる。
+ 公開標準を採用してドキュメンテーションを自動的に生成し、CI/CDパイプラインに組み込む。
+ <font color=red>APIドキュメントは、APIの利用を許可されたユーザーのみに提供</font>。
+ 公開されているAPIのバージョンだけでなく、すべてのバージョンに対してAPIセキュリティ専用の外部保護措置を使用。
+ <font color=red>非本番のAPIデプロイには本番データを使用しない</font>。使用する場合は、本番と同じセキュリティ処理を適用。
+ より新しいAPIバージョンにセキュリティ改善が含まれる場合、古いバージョンに必要な対策を明確にするためにリスク分析を実施。たとえば、改善を互換性を壊さずに適用できるかどうか、または古いバージョンを迅速に削除してすべてのクライアントを最新バージョンに移行させる必要があるかなど。

## API10 Unsafe Consumption of APIs
### Vulnerable Behiviors
+ 他のAPIとのやり取りが暗号化されていないチャネルを介して行われている。
+ 他のAPIから取得したデータを適切に検証・無害化せずに処理したり、下流コンポーネントに渡したりしている。
+ リダイレクションに盲目的に従っている。
+<font color=red>3rd Partyのサービスの応答を処理するために使用可能なリソースの数を制限していない</font>。
+ <font color=red>3rd Partyのサービスとのやり取りにタイムアウトを実装していない</font>。

### Attack Example
```js
const app = express();
app.use(bodyParser.json());

// ユーザーからのリクエストを処理するエンドポイント
app.post('/api/submit_address', async (req, res) => {
  const userAddress = req.body.address;

  try {
    // サードパーティのAPIを呼び出してユーザーの住所情報を取得
    const enrichedData = await callThirdPartyAPI(userAddress);

    // ローカルデータベースに住所情報を保存
    saveEnrichedData(enrichedData);

    res.status(200).json({ message: 'Address enrichment successful' });
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
});

// サードパーティのAPIを呼び出す関数
async function callThirdPartyAPI(userAddress) {
  const thirdPartyEndpoint = 'http://third-party-api.example.com/enrich';
  const response = await axios.post(thirdPartyEndpoint, { address: userAddress });

  return response.data;
}

// ローカルデータベースに住所情報を保存する関数
function saveEnrichedData(enrichedData) {
...省略...
```
### Preventive Measures
+ サービスプロバイダを評価する際には、彼らのAPIセキュリティの姿勢を評価。
+ すべてのAPIのやり取りが安全な通信チャネル（TLS）を介して行われるようにする。
+ 統合されたAPIから受け取ったデータは常に検証し、適切に無害化するようにする。

```js
...省略...
const app = express();
app.use(bodyParser.json());

// ユーザーからのリクエストを処理するエンドポイント
app.post('/api/submit_address', async (req, res) => {
  const userAddress = req.body.address;

  try {
    // サニタイズとエスケープを行った住所情報を作成
    const sanitizedAddress = sanitizeAndEscape(userAddress);

    // サードパーティのAPIを呼び出してユーザーの住所情報を取得
    const enrichedData = await callThirdPartyAPI(sanitizedAddress);

    // ローカルデータベースに住所情報を保存
    saveEnrichedData(enrichedData);

    res.status(200).json({ message: 'Address enrichment successful' });
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
});

// サニタイズとエスケープを行う関数
function sanitizeAndEscape(userInput) {
  // 適切なサニタイズとエスケープ処理を実施する
  // ...
  return sanitizedInput;
}

// サードパーティのAPIを呼び出す関数
async function callThirdPartyAPI(userAddress) {
  const thirdPartyEndpoint = 'http://third-party-api.example.com/enrich';
  const response = await axios.post(thirdPartyEndpoint, { address: userAddress });

  return response.data;
}

// ローカルデータベースに住所情報を保存する関数
function saveEnrichedData(enrichedData) {
  const dbConfig = {
    host: 'localhost',
    user: 'root',
    password: 'password',
    database: 'my_database',
  };

  const connection = mysql.createConnection(dbConfig);

  connection.connect((error) => {
    if (error) {
      console.error('Database connection failed');
      throw error;
    }
    // パラメータのプレースホルダ化: SQLクエリを実行する際には、パラメータをプレースホルダ化して、データベースクエリとパラメータを分離し、SQLインジェクション攻撃を防止
    const query = 'INSERT INTO addresses (street, city, state, country) VALUES (?, ?, ?, ?)';
    const values = [enrichedData.street, enrichedData.city, enrichedData.state, enrichedData.country];

    connection.query(query, values, (error, results) => {
      if (error) {
        console.error('Error saving enriched data');
        throw error;
      }

      console.log('Enriched data saved successfully');
    });

    connection.end();
  });
}
...省略...
```
+ 統合されたAPIがリダイレクトする可能性のあるよく知られた場所を許可リストで管理し、盲目的にリダイレクトに従わないようにする。

## References
+ [OWASP API Security Top 10 (2023-RC更新)](https://www.anquanke.com/post/id/288466)
