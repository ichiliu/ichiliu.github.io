---
layout: post
title: DISQUSのコメント投稿機能を追加
permalink: /it/DISQUSのコメント投稿機能を追加
subtitle: 
cover-img: [/assets/img/cover/it1.jpg, /assets/img/cover/it2.jpg, /assets/img/cover/it3.jpg]
thumbnail-img: 
share-img:
tags: [DISQUS]
categories: [IT]
---

<!-- vim-markdown-toc GFM -->

* [概要](#概要)
* [Disqusでの設定](#disqusでの設定)
  * [アカウント作成](#アカウント作成)
  * [プランの選択](#プランの選択)
  * [Ads Configuration](#ads-configuration)
  * [Installation](#installation)
* [JekyllにDisqusの情報を設置](#jekyllにdisqusの情報を設置)
  * [_config.ymlにDisqusのShortnameを記入](#configymlにdisqusのshortnameを記入)
  * [post.htmlのYAML Front Matterにcomments変数にtrueを設定](#posthtmlのyaml-front-matterにcomments変数にtrueを設定)
* [動作確認](#動作確認)

<!-- vim-markdown-toc -->

## 概要
先日、EC2で運用していたWordPressのBlogをGithub Pagesに移行しましたが、WordPressにはあったコメント機能がないため、付けたいモチベーションがあって、ネットで調べてみました（移行の記事は [ここ](https://guaiguailei.net/it/migrate-aws-ec2-wordpress-to-github-pages)を参考）

調べた結果、Disqusを使うことにしました。設定方法などを書いておきます。

## Disqusでの設定
### アカウント作成
[Disqus](https://disqus.com/)にアクセスし、アカウントを作成しました。
すると、Shortname をいうのがシステムから作成されました(後術のJekyllの設定で必要）

![file](https://i.imgur.com/LOZ8X8i.png)

他の入力項目に、
- Category : Techを選択した
- Language : Englishを選択した

### プランの選択
有料プランと、無料のBasicプランがあるらしく、Basicプランを選択しました。

![file](https://i.imgur.com/0NKD1La.png)

### Ads Configuration
デフォルトでは、Disqusはコメントの中、コメントの下の2箇所に、Adsを表示させることが可能になっています。
まずどんなAdsが表示されるか、状況をみてみたいので、一旦はそのままにします。

今後状況をみて、下記2箇所のチェックを外すことにします。

### Installation
Disqusサイトでの説明では、以下3つの設定が必要とされています。

1. What platform is your site on? を選択

![file](https://i.imgur.com/Nj6TXYt.png)

もちろんここではJekyllを選択しました。

1. Set comments variable to the YAML Front Matter and set it to true

![file](https://i.imgur.com/VDQRc20.png)

1. Copy and paste the [Universal Embed Code](https://guaiguailei-net.disqus.com/admin/install/platforms/universalcode) in the appropriate template
  The following code should be in between a {% if page.comments %} and a {% endif %} tag.

![file](https://i.imgur.com/AGRyj3W.png)

## JekyllにDisqusの情報を設置
[Beautiful Jekyll](https://github.com/daattali/beautiful-jekyll#readme)のREADME.mdを見ましたら、
2箇所の設置だけで、簡単にDisqusのコメント機能を組み込むことができることが分かりました。

### _config.ymlにDisqusのShortnameを記入
下記コメントアウトされている`disqus:""`コメントアウトを解除し、DisqusでのShortnameを記入します。  
これで、自分のDisqusアカウントに紐付けて、使うことが可能になりました。
```sh
# To use Disqus comments, sign up to https://disqus.com and fill in your Disqus shortname (NOT the userid)
# disqus: ""
```

### post.htmlのYAML Front Matterにcomments変数にtrueを設定
Blog投稿にだけコメント機能を付けたいので、`_layouts/post.html`に以下の一行を入れます。
```sh
comments: true
```

個別のpost記事にコメント機能を表示させたくない場合は、そのpost記事に`comments: false`を追加すればいい。

ちなみに、`Beautiful-Jekyll`には、以下のファイルがあり、DisqusのInstallationで必要とされているtagの挿入をマップしてくれています。

```
<div class="disqus-comments">
  <div class="comments">
    <div id="disqus_thread"></div>
    <script type="text/javascript">
	  var disqus_shortname = '{{ site.disqus }}';
	  /* ensure that pages with query string get the same discussion */
	  var url_parts = window.location.href.split("?");
	  var disqus_url = url_parts[0];
	  (function() {
		var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
		dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
		(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
	  })();
    </script>
    <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
  </div>
</div>
```

`Beautiful-Jekyll`は本当にカスタマイズ性と汎用性を両方よく兼ねて備えているものですね。

## 動作確認
特に問題なく`Disqus`のコメントが表示されています。

![file](https://i.imgur.com/kv9m5C3.png)

投稿されたコメントを、`Disqus`で確認してみたいので、自分から投稿してみました。

