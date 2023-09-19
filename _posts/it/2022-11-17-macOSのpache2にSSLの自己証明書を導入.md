---
layout: post
title: macOSのapache2にSSLの自己証明書を導入
subtitle: 
date: 2022-11-17 02:10:00 +0900
cover-img: [/assets/img/cover/it1.jpg, /assets/img/cover/it2.jpg, /assets/img/cover/it3.jpg]
thumbnail-img: https://i.imgur.com/wlhPwWR.png
share-img:
tags: [macOS, apache2, SSL証明書]
categories: [IT]
---

# 概要
使っているMacBookProのローカルに立ち上がっている`apache`のWebサーバに自己証明書を導入したくなりました。その構築するための手順などを残しておく。

# 環境
下記環境
* OS
  macOS Monterey 12.6
* httpd
  Apache/2.4.54  
  macOSデフォルトのではなく、`brew install apache2`で導入したもの
* TLS
  1.2以上に限定したい

前提として
+ `localhost:80`に`httpd`がすでに起動されている状態
+ `openssl`コマンドが使える

# 構築の流れ
## VirtualHostが使えるようhttpd.confを変更
`/usr/local/etc/httpd/httpd.conf`を編集し、下記それぞれの行をコメントアウトする
```sh
LoadModule vhost_alias_module lib/httpd/modules/mod_vhost_alias.so
...省略...
Include /usr/local/etc/httpd/extra/httpd-vhosts.conf
...省略...
```

## VirtualHostを設定
`/usr/local/etc/httpd/extra/httpd-vhosts.conf`を開き、下記部分だけになるよう編集。
```sh
<VirtualHost *:80>
   ServerName localhost
   DocumentRoot "/usr/local/var/www"

   <Directory "/usr/local/var/www">
       Options Indexes FollowSymLinks
       AllowOverride All
       Order allow,deny
       Allow from all
       Require all granted
   </Directory>
</VirtualHost>
```

## Apache2を再起動できるか確認
```sh
$ sudo apachectl restart
```
`http://localhost`で確認して、
![file](https://i.imgur.com/h4Jsc4r.png)
になっているので問題ない。

## SSLを設定
### RSA秘密鍵を作成
```sh
$ mkdir -p /usr/local/etc/httpd/ssl
$ cd /usr/local/etc/httpd/ssl
$ sudo openssl genrsa 2048 > server.key
```
これで、RSA方式で`2048 bit`長の秘密鍵を作成できた。
今回はパスフレーズなしで秘密鍵を作成している例で、パスフレーズ付きで作成したい場合は、例えば、`sudo openssl genrsa -aes256 2048 > server.key`のようにする。しかし、この場合は、秘密鍵を使った作業（CSRの作成、署名）や`apache`起動する際にはパスフレーズを求められるようになる。今回は自己証明書なので、パスフレーズなしのやり方にした。
参考）https://turningp.jp/network_and_security/openssl_a-challenge-password

### CSRを作成
CSRは`Certificate Signing Request`、すなわち証明書署名要求のこと。今回は自己証明（オレオレ証明）なので、認証局（自分）にサーバの公開鍵に署名することになる。
```sh
$ openssl req -new -key server.key > server.csr
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:JP
State or Province Name (full name) [Some-State]:Tokyo
Locality Name (eg, city) []:
Organization Name (eg, company) [Internet Widgits Pty Ltd]:
Organizational Unit Name (eg, section) []:
Common Name (e.g. server FQDN or YOUR name) []:
Email Address []:

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
```
CSRを作成する際、各項目に対して空欄回答で大丈夫。

### サーバ証明書を作成
```sh
$ openssl x509 -req -days 3650 -signkey server.key < server.csr > server.crt
Certificate request self-signature ok
subject=C = JP, ST = Tokyo, O = Internet Widgits Pty Ltd
```
これでサーバ証明書を作成できた。

### サーバ証明書をキーチェーンアクセスへ登録
```sh
$ sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain /usr/local/etc/httpd/ssl/server.crt
Password:
```
Password入力にmacOSにログイン時のパスワードを入力し、その後下記のようなダイヤログが表示されたが、`Touch ID`を使用した。
![file](https://i.imgur.com/wlhPwWR.png)

### SSL用のVirtualHostを設定
`/usr/local/etc/httpd/httpd.conf`を編集し、下記各行をコメントアウトする。
```sh
LoadModule socache_shmcb_module lib/httpd/modules/mod_socache_shmcb.so
LoadModule ssl_module lib/httpd/modules/mod_ssl.so
Include /usr/local/etc/httpd/extra/httpd-ssl.conf
```
#### httpd-vhosts.confを編集
`/usr/local/etc/httpd/extra/httpd-vhosts.conf`を開き、SSL用の設定を追加。
将来、`http://localhost`と`https://localhost`の`DocumentRoot`を区別させるために、`https`の場合の`DocumentRoot`を`/usr/local/var/wws`にした。

```sh
<VirtualHost *:443>
   ServerName localhost
   DocumentRoot "/usr/local/var/wws"

   SSLEngine on
   SSLCipherSuite ALL:!ADH:!EXPORT56:RC4+RSA:+HIGH:+MEDIUM:+LOW:+SSLv2:+EXP:+eNULL
   SSLCertificateFile /usr/local/etc/httpd/ssl/server.crt
   SSLCertificateKeyFile /usr/local/etc/httpd/ssl/server.key

   <Directory "/usr/local/var/wws">
       Options Indexes FollowSymLinks
       AllowOverride All
       Order allow, deny
       Allow from all
       Require all granted
   </Directory>
</VirtualHost>
```

### httpd-ssl.confを設定
`/usr/local/etc/httpd/extra/httpd-ssl.conf`を編集し、待受ポート番号と`ServerName`を以下になるよう変更する。
```sh
Listen 443
...省略...
DocumentRoot "/usr/local/var/wws"
...省略...
ServerName localhost
...省略...
```
また、サーバ証明書と秘密鍵を記述する場所を、上で作ったものになるよう変更する。
```sh
SSLCerificateFile "/private/etc/apache2/server.crt"
SSLCertificateKeyFile "/private/etc/apache2/server.key"
↓書き換える
SSLCerificateFile "/usr/local/etc/httpd/ssl/server.crt"
SSLCertificateKeyFile "/usr/local/etc/httpd/ssl/server.key"
```
## Apacheを再起動
ここまで、SSL設定の手続きが一通り完了したので、`apache`を再起動する。
```sh
$ sudo apachectl restart
```
ブラウザから`https://localhost`でアクセスすると、最初は安全な接続ではありませんの警告画面が出る（自己証明書なので想定内）。その後、承知した上で接続すると、問題なく表示できた。
![file](https://i.imgur.com/ClMenr4.png)

## ブラウザから証明書の詳細を確認
### Firefox
![file](https://i.imgur.com/ih6xYdo.png)

### Chrome
![file](https://i.imgur.com/zomba4b.png)

![file](https://i.imgur.com/biwkCSg.png)

## サーバ側でTLS1.2未満リクエストを遮断
### サーバが対応しているSSL/TLSバージョンを確認
参考）https://kazuhira-r.hatenablog.com/entry/2020/11/19/020208

まず`TLS1.2`バージョンのリクエストが受けられるかを確認
```sh
$ echo | openssl s_client -connect localhost:443 -tls1_2
CONNECTED(00000005)
Can't use SSL_get_servername
depth=0 C = JP, ST = Tokyo, O = Internet Widgits Pty Ltd
verify error:num=18:self-signed certificate
verify return:1
depth=0 C = JP, ST = Tokyo, O = Internet Widgits Pty Ltd
verify return:1
---
Certificate chain
 0 s:C = JP, ST = Tokyo, O = Internet Widgits Pty Ltd
   i:C = JP, ST = Tokyo, O = Internet Widgits Pty Ltd
   a:PKEY: rsaEncryption, 2048 (bit); sigalg: RSA-SHA256
   v:NotBefore: Nov 16 14:31:37 2022 GMT; NotAfter: Nov 13 14:31:37 2032 GMT
---
Server certificate
-----BEGIN CERTIFICATE-----
MIIDBzCCAe8CFCjYt/eQcMFIJW6CRIbwz/fo4Ar/MA0GCSqGSIb3DQEBCwUAMEAx
CzAJBgNVBAYTAkpQMQ4wDAYDVQQIDAVUb2t5bzEhMB8GA1UECgwYSW50ZXJuZXQg
V2lkZ2l0cyBQdHkgTHRkMB4XDTIyMTExNjE0MzEzN1oXDTMyMTExMzE0MzEzN1ow
QDELMAkGA1UEBhMCSlAxDjAMBgNVBAgMBVRva3lvMSEwHwYDVQQKDBhJbnRlcm5l
dCBXaWRnaXRzIFB0eSBMdGQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
AQCW91nNc7umaUCNN7O9NP3r1DlEpu/MzWrqHFz5joGvnlX7s9HceMrN5lOxtcgN
7BNeGQZBXj5FKBdQcQBy4Db8D0XXuX9ZY3L4eBF6KT7fGOYjBjpfeFv+zjn719Y2
F/tiz03DlUk173xjaL9t1Pii3VOKQRDX8GO/RT8E2/U/cjdHqpdOgpKP0FdyKR9l
7hnrVsBuJNTWvU23jEhDq43ZRpaMESqXiRBvChiBMdSZSorMkkf/Erido33ViDXU
uQEr/jmfvfyDyqMFAOFAsVmM+KCAgEkBDMPDz7NXnsExfOAiQIgrB2/QG82PRDq3
Z39gIOm4UFzdLYEayf/QcUC9AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAEpVLWI
suk39uon9IMUo9hFSvTr4uNJCatz6Olig91pP9ubJ8Wune4NeUpoOJCATKHcvn0O
YsUrO6T1Bi0vyKvGaw97MiYEkLIcTXXjgMfEe4hSw7zRIudpLevGoQkdomMATQde
2LchsnLt1m5CLbO8cHSnEeKD9Hct0xY61vCzx+6UgN5Ywl1YCY4zrqdVyv3Po3su
DSPLuyfkflZLpsUajjh0Bz4YjdHfGWIg1Sfd0amTmlt1zANMHCyG6voxdaIn3jsd
Le3kXVifESHRnRlcmskbDrWoKQFQiWp7063fHPDNFHi8dL190Qir8Wg0JsUkm7Av
JqyUfGcCXAFb+Mw=
-----END CERTIFICATE-----
subject=C = JP, ST = Tokyo, O = Internet Widgits Pty Ltd
issuer=C = JP, ST = Tokyo, O = Internet Widgits Pty Ltd
---
No client certificate CA names sent
Peer signing digest: SHA256
Peer signature type: RSA-PSS
Server Temp Key: X25519, 253 bits
---
SSL handshake has read 1436 bytes and written 281 bytes
Verification error: self-signed certificate
---
New, TLSv1.2, Cipher is ECDHE-RSA-AES256-GCM-SHA384
Server public key is 2048 bit
Secure Renegotiation IS supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
SSL-Session:
    Protocol  : TLSv1.2
    Cipher    : ECDHE-RSA-AES256-GCM-SHA384
    Session-ID: AC509E77972734E3D291365A36E657F35271CDF3BDEA2515A70D36116398BA33
    Session-ID-ctx:
    Master-Key: 3B863598DB03087EFF35E42485126B21C6B8832594EA40F915664E82BEE0B44EB35E292795C7F5569A124F4DADC4B488
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    TLS session ticket lifetime hint: 300 (seconds)
    TLS session ticket:
    0000 - af c3 66 dd d7 18 04 12-df 77 07 63 ee 17 f3 88   ..f......w.c....
    0010 - db 1c 23 22 04 be 69 6d-be 5b aa 85 e9 b3 ae 72   ..#"..im.[.....r
    0020 - 93 34 fd 13 ef c9 91 38-91 cb 08 48 73 5b b4 99   .4.....8...Hs[..
    0030 - b0 f4 b6 c8 c0 c9 e5 eb-12 7a a0 05 e7 53 a8 3f   .........z...S.?
    0040 - 63 ad a6 40 1c 04 75 22-23 7a 65 56 a4 df aa 4e   c..@..u"#zeV...N
    0050 - f5 d5 03 f6 c1 d9 ac d4-7f 64 ab 8a 9a 2f 5a af   .........d.../Z.
    0060 - 69 f5 01 1b 2e 32 1a 0a-71 87 cb 62 5e a5 e9 6f   i....2..q..b^..o
    0070 - c3 22 9e 33 d7 93 a8 10-b2 85 34 f1 1d a1 29 f7   .".3......4...).
    0080 - 16 0d 9c aa 32 8f 14 b8-29 48 1d e7 50 7a 00 63   ....2...)H..Pz.c
    0090 - 64 3a bd 25 7e 01 99 01-17 d5 47 cb a9 c0 6e 54   d:.%~.....G...nT
    00a0 - 1d f0 8a db 71 3c 2c 31-f4 dd f8 12 30 8a e4 45   ....q<,1....0..E
    00b0 - 4b 85 0b 55 c4 ae 06 98-67 6e 26 e9 bb 4f 89 aa   K..U....gn&..O..

    Start Time: 1668617406
    Timeout   : 7200 (sec)
    Verify return code: 18 (self-signed certificate)
    Extended master secret: yes
---
DONE
```
TLS1.2に対応していることが分かる。オプションを以下のように変更して実行する
* -tls1_3
* -tls1_1
* -tls1
* -ssl3
* -ssl2

結果として、`TLSv1`以上に対応していることが分かった（いつの間にか`-ssl3`と`-ssl2`のオプションはサポートされなくなった模様）。
ちなみに、この時に、
`/usr/local/etc/httpd/extra/httpd-ssl.conf`の中では、以下の記述があるので、辻褄があうことになる。
```sh
SLProtocol all -SSLv3
SSLProxyProtocol all -SSLv3
```

### TLSv1.2以上のみ許可するように設定
`/usr/local/etc/httpd/extra/httpd-ssl.conf`を編集して、`TLSv1.2`の接続のみ許可するように設定変更する。
```sh
#SSLProtocol all -SSLv3
#SSLProxyProtocol all -SSLv3
SSLProtocol +TLSv1.2 +TLSv1.3
SSLProxyProtocol +TLSv1.2 +TLSv1.3
```
参考）https://httpd.apache.org/docs/current/mod/mod_ssl.html#sslprotocol

```
設定変更したら、`apache`を再起動しておく。

### 検証
TLSv1.1での接続では失敗↓
```sh
$ echo | openssl s_client -connect localhost:443 -tls1_1
CONNECTED(00000005)
00D6B10701000000:error:0A00042E:SSL routines:ssl3_read_bytes:tlsv1 alert protocol version:ssl/record/rec_layer_s3.c:1584:SSL alert number 70
---
no peer certificate available
---
No client certificate CA names sent
---
SSL handshake has read 7 bytes and written 104 bytes
Verification: OK
---
New, (NONE), Cipher is (NONE)
Secure Renegotiation IS NOT supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
SSL-Session:
    Protocol  : TLSv1.1
    Cipher    : 0000
    Session-ID:
    Session-ID-ctx:
    Master-Key:
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    Start Time: 1668617975
    Timeout   : 7200 (sec)
    Verify return code: 0 (ok)
    Extended master secret: no
---
```
TLSv1での接続も失敗↓
```sh
$ echo | openssl s_client -connect localhost:443 -tls1
CONNECTED(00000005)
0076FC1301000000:error:0A00042E:SSL routines:ssl3_read_bytes:tlsv1 alert protocol version:ssl/record/rec_layer_s3.c:1584:SSL alert number 70
---
no peer certificate available
---
No client certificate CA names sent
---
SSL handshake has read 7 bytes and written 104 bytes
Verification: OK
---
New, (NONE), Cipher is (NONE)
Secure Renegotiation IS NOT supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
SSL-Session:
    Protocol  : TLSv1
    Cipher    : 0000
    Session-ID:
    Session-ID-ctx:
    Master-Key:
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    Start Time: 1668618050
    Timeout   : 7200 (sec)
    Verify return code: 0 (ok)
    Extended master secret: no
---
```
念の為、`TLSv1.2`と`TLSv1.3`は問題なく受けられることがも確認した。
検証が無事に予定通りに完了した。

# まとめ
* `apache`サーバにSSLの自己証明書を導入できた。
* サーバが対応しているSSL/TLSのバージョンの確認方法を実行できた。
* 特定なSSL/TLSバージョンを指定（+/-）する方法を検証できた。
* 最終的にTLSv1.2以上のみ許可する方法を設定ができた。

# 参考資料（特別THX!）
* [macのApacheにSSLを導入した](https://qiita.com/Sidrami/items/02b848437844ba3cbb6c)

