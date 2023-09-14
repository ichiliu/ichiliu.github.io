---
layout: post
title: 画像生成AIのMidjourneyを試してみました
subtitle: 
cover-img: [/assets/img/cover/technology1.jpg, /assets/img/cover/technology2.jpg, /assets/img/cover/technology3.jpg]
thumbnail-img: https://i.imgur.com/vR95DaN.png
share-img:
tags: [Midjourney, 生成AI]
categories: [Technology]
---

# 概要
画像生成AIで、`Midjournet`が有名な存在の1つですが、まだ使ったことがなく、今日はアカウント登録し、無料で使ってみました。

[Wikipedia - Midjourney](https://ja.wikipedia.org/wiki/Midjourney)

[Midjourney公式サイト](https://www.midjourney.com)

# アカウント登録
下記ページにアクセスします。
![file](https://i.imgur.com/42Z3jKU.png)

右下の「Join the Beta」をクリックすると、アカウント作成画面に遷移しますが、ドメインが`discord.com`に変わっています。実は、`Midjourney`は`dicord.com`というフリーのチャットサービス上で動くツールなので、AI画像を生成するには、`discord.com`にログインする必要があるため、まずアカウントを作成する必要があります。
![file](https://i.imgur.com/vR95DaN.png)

ユーザー名を入力して、次に進みます。
![file](https://i.imgur.com/m8LpOb5.png)

その後の操作の説明は割愛。アカウント作成時に入力必要なのは、メールアドレスと、生年月日になる。作成後、メール受信詩メール認証まで終わらせば、正常に作成されることになります。

メール認証完了し、`Midjourney`の公式サイトに戻ると、`didcord.com`へログインの`OAuth認証`画面が表示され、正しくログインすると、個人情報提供の認可画面が表示される、「認証」ボタンを押すと、`Midjourney`サイト上、`discord.com`のユーザー名が表示されるようになっています。
![file](https://i.imgur.com/W9Eqvso.png)

上記画面にある「Join the Discord to start creating!」リンクをクリックすると、以下のような「`Midjourney`があなたを招待しています」画面が表示される
![file](https://i.imgur.com/fQ1Kr4d.png)
「招待を受ける」ボタンを押すと、以下のような画面が表示される（ちょっと間に挟む画面が多くない？）
![file](https://i.imgur.com/IktzGzu.png)

「Discordを開く」と、やっと以下の画面が表示されました
![file](https://i.imgur.com/PeJMVu5.png)

# 画像生成
生成された1枚目の画像を先にアップします。ちなみに、作成に使ったテキストは「Sun Wukong havoc in the sky」（中国語での「孫悟空大鬧天空」を、Google Translaeした英語になります）
![file](https://i.imgur.com/kmBWmPr.jpg)

## 画像生成するためのやること
### チャットルームに入室
`discord.com`はいろいろチャットルーム名が画面左側にあり、そこに入室して会話したりすることができます。今回の`Midjourney`のAI画像生成も、チャットルームに入室して作成することになります。

画面左側の「NEWCOMER ROOMS」にあるどの部屋に入っても大丈夫です（newbiesは「初心者」の意味）。

### 画像生成コマンド
チャットルーム似て、以下のコマンドを打つ
```sh
/imagine
```
すると、
![file](https://i.imgur.com/oaaoDSR.png)
のように、`prompt`と表示され、その後ろに英語で画像生成するためのテキストを入力すればいい。

## 生成した画像の見方
![file](https://i.imgur.com/vtLPlS1.png)
まず、画像は4名作成されます、番号はそれぞれ
1枚目：左上
2枚目：右上
3枚目：左下
4枚目：右下
そして、U1〜U4の意味：
>指定した番号の画像を高解像度化する機能。

V1〜V4の意味：
>指定した番号の画像と似たデザインのものを新たに4枚生成する機能。

U4右にある ![file](https://i.imgur.com/svxqNte.png) （「更新」ボタン）は、最初から新しく作り直す時に使えます。
しかし、注意しないといけないのは、無料で使える作成回数は合計で「25」回に制限されているみたい。

### もう何枚かを試す
最初に試した「Sun Wukong havoc in the sky」をうっかり2回生成しましたので、その2回目の画像はこれです（1枚目との優劣評価は難しいが、おり孫悟空のイメージに近づいている？）
![file](https://i.imgur.com/1c8s8yN.png)

名詞が多くあるとよりイメージに違い絵になるかという自分の中の「仮設」を基に、中国で有名な「天净沙·秋思」（元·马致远）の詩の絵をAIに生成してもらおうと考えました。
>天净沙·秋思
枯藤老树昏鸦，
小桥流水人家，
古道西风瘦马。
夕阳西下，
断肠人在天涯。

ちなみに、中国のサイトで検索したら、以下の絵がありました（AIアートではない）↓
![file](https://i.imgur.com/3eLihFJ.png)

これを英訳してから`Midjourney`に与える必要があるので、`fanyi.baidu.com`を使って以下のように翻訳しました。
>The withered vine, the old tree, the crow, the small bridge, the flowing water, the house. The ancient road has a lean horse in the west wind, and the sun is setting in the west. Heartbroken people are on the horizon.

英訳では中国語の「博大精深」を再現することが難しいが、今回の場合はほぼ形容詞と名詞になるので、割と70%ぐらいの「意境」を表せているのかなと思いました。

ちなみに、原文を日本語に訳すると以下になりますので、この詩の意味を理解するのにご参考になれればと思います。
>枯れた藤の老木がカラスを気絶させ、
小さな橋が人を流す。
古道西風痩馬、
夕日が沈む。
断腸の人は天涯にいる。

さすが漢字文化、英訳よりはもっと原文の意味に近づきましたが、「カラスを気絶させ」は行けていないですねｗ

最終的にできた絵はこれです、なかなかよさそう！
![file](https://i.imgur.com/xM1wjGh.png)

# まとめ
`Midjourney`はすごい！
イメージに近い絵を素早く作成してくれて、しかも4枚作成し、解像度向上や、各枚に近い別の画像を作成する機能も付いたり、簡単に再作成する機能も付いています。
無料での利用枚数に制限はありますが、ビジネス用でしたら、有料プランを購入して利用するニーズは多いでしょう。
