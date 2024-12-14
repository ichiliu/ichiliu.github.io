---
layout: post
title: Secure By Design（セキュア・バイ・デザイン）
subtitle: 
cover-img: [/assets/img/cover/book1.jpg, /assets/img/cover/book2.jpg, /assets/img/cover/book3.jpg]
thumbnail-img: https://i.imgur.com/q568Giq.png
share-img:
tags: [secure by design, セキュア・バイ・デザイン]
categories: [Books]
---

# 概要
[CISA、日本のNISCらと協力し、セキュア・バイ・デザインに関する資料のアップデート版を提供](https://www.itmedia.co.jp/enterprise/articles/2310/19/news065.html#utm_source=ent-mag&utm_campaign=20231025) という記事を読んだ。これによると、

CISA（米国土安全保障省サイバーセキュリティ・インフラストラクチャセキュリティ庁）は2023年10月16日（現地時間）、米国および国際的なパートナーと共同で、セキュア・バイ・デザインの原則とアプローチに関するガイダンス「Secure-by-Design - Shifting the Balance of Cybersecurity Risk: Principles and Approaches for Secure by Design Software」のアップデート版を公開した。

日本からはJPCERTコーディネーションセンター（JPCERT/CC）と内閣官房内閣サイバーセキュリティセンター（NISC）も協力して、米国連邦調査局（FBI）、米国家安全保障局（NSA）の他、8つの新しい国際機関の共同作業によって作られた。

今回のアップデートで注目されるのは、企業が具体的にセキュリティ・バイ・デザイン原則へのコミットメントをどのように示すかが明示された点にある。企業は新しいガイドラインに基づいて具体的なアクションを示すことがこれまでもよりも明確になった。

![file](https://i.imgur.com/q568Giq.png)
Ref: [Secure-by-Design | CISA](https://www.cisa.gov/resources-tools/resources/secure-by-design?utm_source=EA%20Press%20Release&utm_medium=Press%20Release&utm_campaign=Secure%20by%20Design%20and%20Default%20Update)

<!-- vim-markdown-toc GFM -->

* [資料リンク](#資料リンク)
* [SECURITY BY DESGIN](#security-by-desgin)
  * [BACKGROUP](#backgroup)
  * [OVERVIEW](#overview)
  * [HOW TO USE THIS DOCUMENT](#how-to-use-this-document)
  * [Secure by Design](#secure-by-design)
  * [Secure by Default](#secure-by-default)
* [SOFTWARE PRODUCT SECURITY PRINCIPLES](#software-product-security-principles)
  * [Several operational tactics to evolve their development processes](#several-operational-tactics-to-evolve-their-development-processes)
  * [PRINCIPLE 1: Take Ownership of Customer Security Outcomes](#principle-1-take-ownership-of-customer-security-outcomes)
    * [DEMONSTRATING THIS PRINCIPLE (この原則を実証する)](#demonstrating-this-principle-この原則を実証する)
      * [SECURE BY DEFAULT PRACTICES](#secure-by-default-practices)
      * [SECURE PRODUCT DEVELOPMENT PRACTICES](#secure-product-development-practices)
      * [PRO-SECURITY BUSINESS PRACTICES (セキュリティに関するビジネスのプロ実践)](#pro-security-business-practices-セキュリティに関するビジネスのプロ実践)
  * [PRINCIPLE 2: Embrace Radical Transparency and Accountability](#principle-2-embrace-radical-transparency-and-accountability)
    * [DEMONSTRATING THIS PRINCIPLE](#demonstrating-this-principle)
      * [SECURE BY DEFAULT PRACTICES](#secure-by-default-practices-1)
      * [SECURE PRODUCT DEVELOPMENT PRACTICES](#secure-product-development-practices-1)
      * [PRO-SECURITY BUSINESS PRACTICES](#pro-security-business-practices)
  * [PRINCIPLE 3: Lead from the Top](#principle-3-lead-from-the-top)
    * [DEMONSTRATING THIS PRINCIPLE](#demonstrating-this-principle-1)
  * [SECURE BY DEFAULT TACTICS](#secure-by-default-tactics)
  * [HARDENING VS LOOSENING GUIDES](#hardening-vs-loosening-guides)
  * [RECOMMENDATIONS FOR CUSTOMERS](#recommendations-for-customers)

<!-- vim-markdown-toc -->

# 資料リンク
- [Secure-by-Design](https://www.cisa.gov/resources-tools/resources/secure-by-design)
- [CISA, U.S. and International Partners Announce Updated Secure by Design Principles Joint Guide｜CISA](https://www.cisa.gov/news-events/news/cisa-us-and-international-partners-announce-updated-secure-design-principles-joint-guide)
  - Initially [published in April 2023](https://www.cisa.gov/sites/default/files/2023-06/principles_approaches_for_security-by-design-default_508c.pdf)
- (日本語訳)[セキュアバイデザイン、セキュアバイデフォルトの原則とアプローチ](https://www.nisc.go.jp/pdf/policy/kokusai/Provisional_Translation_JP_Principles_Approaches_for_Security-by-Design-Default_October.pdf)

# SECURITY BY DESGIN 
## BACKGROUP
The President’s National Cybersecurity Strategy outlines the need to shift the burden of security from customers to manufacturers.
>米大統領の国家サイバーセキュリティ戦略は、セキュリティの負担を顧客から製造業者へ転嫁する必要性を示している。

## OVERVIEW
- The term “secure by design” encompasses both secure by design and secure by default .
  >「セキュア・バイ・デザイン」という用語には、セキュア・バイ・デザインとセキュア・バイ・デフォルトの両方が含まれる。
- Secure by default products are those that are
  - Secure to use “out of the box” with little to no configuration changes necessary,
    >設定変更をほとんどまたはまったく必要とせずに「すぐに使える」安全な機能を備えており
  - Security features available without additional cost. 
    >追加コストなしでセキュリティ機能を利用できる
- This report applies to manufacturers of artificial intelligence (AI) software systems and models as well.
- Fundamental security practices still apply to AI systems and models.
- The three overarching secure by design principles apply to all AI systems.

## HOW TO USE THIS DOCUMENT
- We urge software manufacturers to adhere to the principles within this document 
  >ソフトウェア製造業者への呼びかけ
- Customers can also leverage this document. Companies buying software should ask hard questions of their vendors.
  >顧客もこの文書を活用できるソフトウェアを購入する企業は、ベンダーに対して厳しい質問を投げかけるべき。
  An example of questions customers can ask of vendors is given in [CISA’s Guidance for K-12 Technology Acquisitions](https://www.cisa.gov/resources-tools/resources/cybersecurity-guidance-k-12-technology-acquisitions) 
- We encourage enterprise customers to incorporate these practices
  >企業顧客への奨励  
  Customers should also push their vendors to publicly document the secure by design actions each vendor takes Collectively, this can create a strong demand signal for security, which can encourage and enable software manufacturers to take steps towards greater security.  
    > 顧客はまた、ベンダーに対して公にセキュアバイデザインの取り組みを文書化するよう圧力をかけるべきです。これにより、セキュリティに対する強力な需要信号が作成され、ソフトウェア製造業者がより高いセキュリティへのステップを踏む助けとなる  
  We need to create a **“secure by demand” culture** with their customers  
    > 顧客との関係において「セキュア・バイ・デマンド」文化を創り出す必要がある

## Secure by Design
- “Secure by design” means that technology products are built in a way that reasonably protects against malicious cyber actors successfully gaining access to devices, data, and connected infrastructure. 
  >「セキュアバイデザイン」とは、技術製品が悪意あるサイバー攻撃者がデバイス、データ、および接続されたインフラへのアクセスを成功させる可能性を合理的に防ぐように構築されていることを意味する。
- It requires strong leadership by the manufacturer’s top business executives to make security a business priority, not just a technical feature.
  >製造業者の最高経営責任者による強力なリーダーシップが必要で、セキュリティを技術的な機能だけでなくビジネスの優先事項にする必要がある。
- Manufacturers should prioritize the features, mechanisms, and implementation of tools that protect customers rather than product features that seem appealing but enlarge the attack surface.
  >製造業者は攻撃面を拡大させる魅力的な製品機能ではなく、顧客を保護するための機能、メカニズム、およびツールの実装を優先すべき。

## Secure by Default
- “Secure by default” means products are resilient against prevalent exploitation techniques out of the box without added charge.These products protect against the most prevalent threats and vulnerabilities without end-users having to take additional steps to secure them.
  >「セキュアバイデフォルト」は、製品が追加の料金なしに、初期状態で一般的な攻撃技術に対して強固であることを意味する。これらの製品は、最も一般的な脅威と脆弱性に対して保護し、エンドユーザーがそれらを保護するために追加の手順を踏む必要がないように設計されている。
  - A secure configuration should be the default baseline. 
  - The complexity of security configuration should not be a customer problem. 
  - Manufacturers should ensure their products are manufactured, distributed, and used securely in accordance with “secure by default” standards. 
- Manufacturers of products that are “secure by default” do not charge extra for implementing added security configurations Instead, they include them in the base product like seatbelts are included in all new cars. 
  >新車のシートベルトのように、追加費用なしで最初から付けられているべき。
- Security should not be a luxury option, but should be considered a right customers receive without negotiating or paying more. 
  >セキュリティは贅沢なオプションではなく、交渉や追加料金を支払うことなく、顧客が受ける権利と考えられるべき。

# SOFTWARE PRODUCT SECURITY PRINCIPLES 
There are three core principles to guide software manufacturers in building software security into their design processes prior to developing, configuring, and shipping their products.
>ソフトウェアメーカーが製品を開発、設定、および出荷する前にデザインプロセスにセキュリティを組み込むためのガイドとなる3つの基本的な原則がある。

1. **Take ownership of customer security outcomes** and evolve products accordingly. The burden of security should not fall solely on the customer.   
   >顧客のセキュリティ結果のを引き受け、それに応じて製品を進化させる責任を負うべきです。セキュリティの負担は単に顧客に降りかからせてはなりません。

2. Embrace radical transparency and accountability.  
   >根本的な透明性と説明責任を受け入れる  
  Software manufacturers should pride themselves in delivering safe and secure products, as well as differentiating themselves among the rest of the manufacturer community based on their ability to do so.  
    >ソフトウェア製造業者は、安全でセキュアな製品を提供することに誇りを持ち、それによって他の製造業者コミュニティとの差別化を図るべき。

3. Build organizational structure and leadership to achieve these goals.  
   >これらの目標を達成するための組織構造とリーダーシップを構築する  
  While technical expertise is critical to product security, senior executives are the primary decision makers for implementing change in an organization.  
    >製品セキュリティにおける技術的な専門知識は重要だが、シニアエグゼクティブは組織内で変革を実施するための主要な意思決定者である。

## Several operational tactics to evolve their development processes
- Convene routine meetings with company executive leadership to drive the importance of secure by design and secure by default within the organization.
  >会社の経営トップ層と定例会を開催し、セキュアバイデザインおよびセキュアバイデフォルトの重要性を組織内に浸透させる。
- Operate around the importance of software security to business success. 
  >ソフトウェアセキュリティの重要性をビジネスの成功に関連付けて運用すべき。
- Use a tailored threat model during resource allocation and development to prioritize the most critical and high-impact features.
  >リソースの割り当てと開発中にカスタマイズされた脅威モデルを使用し、最も重要で高影響のある機能を優先すべき。

## PRINCIPLE 1: Take Ownership of Customer Security Outcomes 
- An application’s setings should be continuously evaluated whether the setings were the default or set by the customer, against the manufacturer’s current understanding of the threat landscape. 
  >アプリケーションの設定は、デフォルトであるか、顧客が設定したものであるかに関係なく、製造業者の現在の脅威の理解に対して常に評価されるべき。
- Applications should be made with clear indicators about the potential risks that may result from those setings and should make those indicators known.
  >アプリケーションは、それらの設定から生じる潜在的なリスクに関する明確な指標を持つべきであり、その指標を知らせるべき。
- The sofware industry needs more secure products, not more security products. Sofware manufacturers should lead that transformation. 
  >ソフトウェア業界は、より安全な製品が必要であり、セキュリティ製品が必要ではありません。ソフトウェア製造業者はその変革を主導すべき。
- Sofware manufacturers have a responsibility to ensure that their products are designed and developed with security as a top priority To that end, they should objectively measure the results of their eforts in the field.
  >ソフトウェア製造業者は、その製品がセキュリティを最優先事項として設計および開発される責任があります。そのため、彼らは自分たちの取り組みの結果を客観的に評価すべき。

### DEMONSTRATING THIS PRINCIPLE (この原則を実証する)
- Sofware manufacturers and online services should find ways to demonstrate successes in implementing this principle They should seek to provide evidence in the form of artifacts for outsiders to examine.
  >ソフトウェア製造業者とオンラインサービスは、この原則を実装した成功を証拠として提供する方法を見つけるべきです。彼らは、外部の人が検証できる形で証拠を提供することを目指すべき。

#### SECURE BY DEFAULT PRACTICES 
1. Eliminate default passwords.
    >デフォルトのパスワードを廃止する。
2. Conduct field tests.
    >フィールドテストを実施する。  
    Similar to how user research informs sofware development requirements, sofware manufacturers should also conduct security-focused user research to understand where the security user experience (UX) falls short.  
      >ユーザー研究がソフトウェア開発要件に情報を提供するのと同様に、ソフトウェア製造業者はセキュリティに焦点を当てたユーザー研究も実施すべき。
3. Reduce hardening guide size.
    >ハードニングガイドのサイズを削減する。
4. Actively discourage use of unsafe legacy features. 
    >安全でない旧来の機能の使用を積極的に廃止する。
5. Implement atention grabbing alerts. 
    >注目を引くアラートを実装する。
6. Create secure configuration templates. 
    >安全な設定テンプレートを作成する。

#### SECURE PRODUCT DEVELOPMENT PRACTICES
1. Document conformance to a secure SDLC framework. 
    >セキュアなSDLCフレームワークへの適合を文書化する。  
    Within the US, consider using the NIST Secure Sofware Development Framework (SSDF) 
      >米国内では、NISTのセキュアソフトウェア開発FW（SSDF）を使用することを検討してください。
2. Document Cybersecurity Performance Goals (CPG) or equivalent conformance.
    >サイバーセキュリティパフォーマンスゴール（CPG）または同等の適合を文書化する。  
    Organizations should consider publishing details on the organization’s conformance to the CISA CPGs, the NIST Cybersecurity Framework (CSF), or other cybersecurity program frameworks.
      >組織は、CISAのCPG、NISTのCSF、または他のサイバーセキュリティプログラムフレームワークに対する組織の適合性の詳細を公開することを検討してください。
3. Vulnerability management. 
4. Responsibly use open source sofware. 
  >For reference, Japan’s Ministry of Economy, Trade, and Industry (METI) has published "[Collection of Use Case Examples Regarding Management Methods for Utilizing OSS and Ensuring Its Security](https://www.meti.go.jp/english/press/2021/0421_003.html)"  
    >[OSSの利活用及びそのセキュリティ確保に向けた管理手法に関する事例集](https://www.meti.go.jp/press/2021/04/20210421001/20210421001-1.pdf)
5. Provide secure defaults for developers. 
    >開発者に対してセキュアなデフォルトを提供する。  
    Also known as “paved roads” or “well-lit paths,” this practice ensures both speed and security, and reduces human error  
      >これは「舗装された道」または「明るい道」とも呼ばれ、速度とセキュリティの両方を確保し、人為的なエラーを減らす。
6. Foster a sofware developer workforce that understands security.
    >セキュリティを理解するソフトウェア開発者のワークフォースを育てる
7. Test SIEM and security orchestration, automation, and response (SOAR) integration. 
    >SIEMおよびSOARの統合をテストする。
8. Align with Zero Trust Architecture (ZTA). 
    >ゼロトラストアーキテクチャ（ZTA）に合わせる

#### PRO-SECURITY BUSINESS PRACTICES (セキュリティに関するビジネスのプロ実践)
1. Provide logging at no additional charge. 
    >余分な費用をかけずにログを提供
2. **Eliminate hidden taxes**. Publish a commitment to never charge for security or privacy features or integrations 
    >隠れた税金を廃止。セキュリティやプライバシの機能や統合に対して追加料金を請求しないことを公表すべき。  
    Security should not be priced as a luxury good but considered a customer right.  
      >セキュリティは高級商品として価格設定されてはならず、顧客の権利と考えられるべき。
3. **Embrace open standards**. Implement open standards, especially around common network and identity protocols Avoid proprietary protocols when open standards are available. 
    >オープンスタンダードを採用  
    一般的なネットワークおよびアイデンティティプロトコルなど、オープンスタンダードを実装するべきです。利用可能なオープンスタンダードがある場合、プロプライエタリプロトコルを避けるべき。
4. Provide upgrade tooling.

## PRINCIPLE 2: Embrace Radical Transparency and Accountability
- Transparency forces decisions around security to be made early in the development process, and to be a continuous activity of business leaders as well as engineers and security professionals Transparency builds accountability into the product. 
  >透明性は、セキュリティに関する決定が開発プロセスの早い段階で行われ、ビジネスリーダーだけでなくエンジニアやセキュリティ専門家による連続的な活動として組み込まれるようにします。透明性は製品に説明責任を持たせ
- Perhaps by not placing a luxury tax on security features, safety and security therefore become a cost center rather than a profit center, and companies would benefit by lightening the load through collaboration and transparency. 
  >セキュリティ機能に高額の課税をかけないことにより、セーフティとセキュリティはコストセンターであり、利益センターではなく、協力と透明性によって負担を軽減できる。

### DEMONSTRATING THIS PRINCIPLE 
#### SECURE BY DEFAULT PRACTICES
1. Publish aggregate security–relevant statistics and trends.
2. Publish patching statistics.
3. Publish data on unused privileges.

#### SECURE PRODUCT DEVELOPMENT PRACTICES
1. Establish internal security controls. 
  >内部のセキュリティコントロールを設立する
2. Publish high-level threat models. 
  >高レベルの脅威モデルを公開する
3. Publish detailed secure SDLC selfatestations. 
  >詳細なセキュアSDLCの自己認証を公開する
4. Embrace vulnerability transparency. 
  >脆弱性の透明性を受け入れる
5. Publish Sofware Bills of Materials (SBOMs). 
  >ソフトウェアの材料明細書（SBOM）を公開する  
  >METI “[Guide of Introduction of Software Bill of Materials (SBOM) for Software Management](https://www.meti.go.jp/english/press/2023/0728_001.html)”   
  >METI "[ソフトウェア管理に向けたSBOM（Software Bill of Materials）の導入に関する手引](https://www.meti.go.jp/press/2023/07/20230728004/20230728004.html)"
6. Publish a vulnerability disclosure policy. 
  >脆弱性開示ポリシーを公開する

#### PRO-SECURITY BUSINESS PRACTICES
1. Publicly name a secure by design senior executive sponsor. 
  >公にセキュア・バイ・デザインの上級幹部スポンサーを指名する
2. Publish a secure by design roadmap. 
  >セキュア・バイ・デザインのロードマップを公開する。
3. Publish a memory-safety roadmap.  
  Manufacturers can take steps to eliminate one of the largest classes of vulnerability by migrating existing products and building new products using memory safe languages. 
  >メモリセーフティのロードマップを公開する。製造業者は、メモリセーフな言語を使用して既存の製品を移行し、新しい製品を構築することで、最大の脆弱性クラスの一つを排除するための手順を踏むことができる。
4. Publish results.

## PRINCIPLE 3: Lead from the Top 
- While technical subject mater expertise is critical to product security, it is not a mater that can be solely lef to technical staf It is a business priority that must start at the top. 
  >製品セキュリティにおいて技術的な専門知識は重要ですが、それを技術スタッフだけに任せることのできる問題ではありません。
- Atainment of quality leadership requires that the upper managers personally take charge of managing for quality.
  >品質リーダーシップの達成には、上級管理職が品質を管理する責任を個人的に担当する必要がある。
- In the same way that leadership teams have implemented corporate social responsibility (CSR) programs, the term corporate cyber responsibility (CCR) is sometimes used to describe this emerging idea.
  >企業の社会的責任（CSR）, 企業サイバー責任（CCR）

### DEMONSTRATING THIS PRINCIPLE 
1. Include details of a secure by design program in corporate financial reports. 
  >企業の財務報告書にセキュアバイデザインプログラムの詳細を含める
2. Provide regular reports to your board of directors.
  >取締役会への定期的な報告を提供する
3. Empower the secure by design executive.
  >セキュアバイデザインのエグゼクティブを権限付ける
4. Create meaningful internal incentives.
  >有意義な内部インセンティブを作成する
5. Create a secure by design council.
  >セキュアバイデザイン協議会を設立する
6. Create and evolve customer councils.
  >顧客協議会を作成し、進化させる

## SECURE BY DEFAULT TACTICS
- Eliminate default passwords. 
  >デフォルトパスワードの削除
- Mandate multifactor authentication (MFA) for privileged users.
  >特権ユーザーに対する多要素認証（MFA）を義務化
- Single sign-on (SSO).   
  IT applications should implement single sign on support via modern open standards Examples include Security Assertion Markup Language (SAML) or OpenID Connect (OIDC ) This capability should be made available by default at no additional cost 
  >ITアプリケーションは、SAMLまたはOIDCなどのモダンなオープンスタンダードを使用してSSOサポートを実装すべきです。この機能は、追加のコストなしでデフォルトで利用できるべき。
- Secure Logging.  
  Provide high-quality audit logs to customers at no extra charge or additional configuration. 
  >セキュアなログ記録。顧客に高品質な監査ログを追加の料金や追加の設定なしで提供する。
- Sofware Authorization Profile. 
- Forward-looking security over backwards compatibility.
  >将来志向のセキュリティを過去の互換性のあるセキュリティの前方互換性よりも優先する
- Track and reduce “hardening guide” size.
  >"ハードニングガイド"のサイズを追跡および縮小する
- Consider the user experience consequences of security setings.
  >セキュリティ設定のユーザーエクスペリエンスに関する考慮

## HARDENING VS LOOSENING GUIDES
- Rather than developing hardening guides that list methods for securing products, the authoring organizations recommend sofware manufacturers shif to a secure by default approach and providing "loosening guides.".
  >製品をセキュリティで保護する方法をリストアップするハードニングガイドの代わりに、著者団体はセキュアバイデフォルトのアプローチに切り替え、"緩和ガイド"を提供することを推奨している
- These guides explain the business risk of decisions in plain, understandable language, and can raise organizational awareness of risks to malicious cyber intrusions. 
  >これらのガイドは、ビジネスリスクをわかりやすい言葉で説明し、悪意のあるサイバー侵害に対するリスクについて組織全体の意識を高めることができる

## RECOMMENDATIONS FOR CUSTOMERS
- Hold Suppliers Accountable  
  Organizations should hold their software manufacturers accountable for the security outcomes of their products. Executives should prioritize purchasing secure by design and secure by default products.
  >供給業者を責任に追う:組織はソフトウェア製造業者に対して、製品のセキュリティ結果に責任を果たさせるべきです。幹部はセキュア・バイ・デザインおよびセキュア・バイ・デフォルトの製品の購入を優先すべき。
- Formal Documentation  
  Organizational decisions to accept the risks associated with specific technology products should be formally documented, approved by a senior business executive, and regularly presented to the board of directors.
  >正式な文書化:特定の技術製品に関連するリスクを受け入れる組織の意思決定は正式に文書化され、上級経営幹部によって承認され、定期的に取締役会に提示されるべき。
- Invest in Critical Business Functions 
  >重要なビジネス機能への投資
- Forge Strategic Relationships  
  Organizations should aim to establish strategic relationships with their key IT suppliers, reinforcing the importance of secure by design and secure by default practices in contracts and agreements.  
  >戦略的関係の構築:組織は主要なITサプライヤーとの戦略的な関係を築くことを目指し、契約や合意にセキュア・バイ・デザインおよびセキュア・バイ・デフォルトの原則の重要性を強調すべき。
- Expect Transparency
  >透明性を期待
- Collaborate with Industry Peers
  >業界仲間と協力
- Understand Cloud Shared Responsibility  
  When using cloud systems, organizations should understand the shared responsibility model with their technology supplier and have clarity on the supplier's security responsibilities.
  >クラウド共同責任の理解:クラウドシステムを使用する場合、組織はそのテクノロジーサプライヤーとの共同責任モデルを理解し、サプライヤーのセキュリティに対する責任についてだけでなく、顧客の責任についても明確にすべき。
- Prioritize Transparent Cloud Providers  
  Organizations should prioritize cloud providers that are transparent about their security posture, internal controls, and their ability to fulfill obligations under the shared responsibility model.
  >透明性の高いクラウドプロバイダーを優先:組織はセキュリティポジション、内部統制、および共同責任モデルの下での義務の遂行能力について透明性の高いクラウドプロバイダーを優先すべき。

Done.
