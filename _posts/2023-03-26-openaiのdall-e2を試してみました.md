---
layout: post
title: OpenAIのDALL-E2を試してみました
date: 2023-03-26 17:23:00 +0900
subtitle: 
cover-img: [/assets/img/cover/technology1.jpg, /assets/img/cover/technology2.jpg, /assets/img/cover/technology3.jpg]
thumbnail-img: https://i.imgur.com/5Va6ZBF.png
share-img:
tags: [OpenAI, DALL-E2]
categories: [Technology]
---

# 概要
`openai.com`にあの有名な`ChatGPT`以外、画像生成AIとして`DALL-E2`もあります（日本語で「ダリ」）。どんなことができるか、使い方がどうなっているのかを試すために、今日使ってみました。

別の画像生成AI`Midjourney`についても記事もありますので、興味がある方はご覧になってください。
[画像生成AIのMidjourney（ミッドジャーニー）を試してみました](https://guaiguailei.net/it/%e7%94%bb%e5%83%8f%e7%94%9f%e6%88%90ai%e3%81%aemidjourney%ef%bc%88%e3%83%9f%e3%83%83%e3%83%89%e3%82%b8%e3%83%a3%e3%83%bc%e3%83%8b%e3%83%bc%ef%bc%89%e3%82%92%e8%a9%a6%e3%81%97%e3%81%a6%e3%81%bf)

# 画像生成
DALL-E2公式サイト
https://openai.com/product/dall-e-2

## 画像生成するためのやること
![file](https://i.imgur.com/5Va6ZBF.png)

「Try DALL-E」をクリックすると、

![file](https://i.imgur.com/NxsBetk.png)

「Continue」をクリックすると、

![file](https://i.imgur.com/kmJTz9y.png)
↑「15 free credits each month」 と表示されていますね。
つまり、

これで、下記画面にてAIアートを生成することが可能になります
![file](https://i.imgur.com/i1gRiLN.png)

### About free credits
https://help.openai.com/en/articles/6399305-how-dall-e-credits-work
によると、1 credit で1つの画像生成リクエストすることが可能です。

>What’s a DALL·E Credit?

>You can use a DALL·E credit for a single request at labs.openai.com: generating images through a text prompt, an edit request, or a variation request.

>Credits are deducted only for requests that return generations, so they won’t be deducted for content policy warnings and system errors.

### 画像生成
#### 中国有名な詩のAIアート
`Midjourney`と比較する意味も込めて、同じテキストを使ってAI画像を生成してみました。入力テキストは以下です

>The withered vine, the old tree, the crow, the small bridge, the flowing water, the house. The ancient road has a lean horse in the west wind, and the sun is setting in the west. Heartbroken people are on the horizon.

![file](https://i.imgur.com/6qRgDFb.png)

同じ英語のテキストでしたが、`Midjourney`のほうがよりイメージに近い絵が生成されました。

`DALL-E2`は中国語の入力も処理可能なため、原文の中国語も入力して生成してみました。
>枯藤老树昏鸦，小桥流水人家。古道西风瘦马，夕阳西下。断肠人在天涯。

![file](https://i.imgur.com/GFct4cT.png)

1回目に生成した絵では、枯れた藤、古木、夕暮れ時の寂しい画風（1,2,4枚）がみえますが、2回目の絵では1枚目にしかそのような雰囲気があり、残り3枚にはそのような画風がみられない感じでした。

#### 孫悟空大鬧天空のAiアート
今回は、
>孫悟空大鬧天空

と中国語で直接入力して生成してみました↓
![file](https://i.imgur.com/fDwSqjx.png)

100%「空」のイメージしかない。
英語で試してみたい気持ちが湧きませんでした。

#### 日本語で試してみる
入力テキスト
>我が家のネコが大きなネズミを捕まえて、庭で遊んでいる

![file](https://i.imgur.com/DIr8O0U.png)
ネコやネズミが出てこなくて、鳥が出てきた意外な展開。日本語を正しく理解できていないみたいですが、ここが`ChatGPT`と大きく違う所ですね。

同じ意味で英語ではどうか
>Our cat caught a big mouse and is playing in the garden

![file](https://i.imgur.com/pHjN8rV.png)
ようやく`DALL-E2`が意味を理解してくれたようです。

個人的に、APIとかの裏側で日本語を英語に訳してから絵を書けばいいのになと思いました。

## 生成履歴
下記画面のように、生成履歴が画面右側にあり、どのぐらいのcreditsが残っているのかもわかるようなUIになっています。とても分かりやすいですね。

![file](https://i.imgur.com/XeNOuqR.png)

# まとめ
`DALL-E2`では使い方が簡単です。すでに`ChatGPT`のアカウントを持つ人なら、手間かからずにすぐ利用できます。しかも、毎月15 free creditsが付与されて、理論上最大15リクエスト/月（最大15 x 4 = 60枚）の画像を作成できるので、個人で試して見たい程度ならば、課金せずに事が足りるでしょう。

しかし、日本語には非対応のようなのと、生成した画像は`Midjourney`と比べると劣っているように感じました。これからの進化を期待します。

