---
layout: post
title: 脆弱性管理にSSVCを活用する
subtitle: 
cover-img: [/assets/img/cover/security1.jpg, /assets/img/cover/security2.jpg, /assets/img/cover/security3.jpg]
thumbnail-img: 
share-img:
tags: [Security, CVSS, SSVC]
categories: [Security]
full-width: true
---

# 泥沼から脱却したい
IT業界の現場でエンジニアの仕事をしている（したことがある）人なら、誰もが「脆弱性対応」を経験したことがあるだろう。脆弱性（Vulnerability）は年々発表される件数が増えていて、エンジニアはその対応に追われ、貴重な開発工数を割かなければならない現状があります。

長年、この業界では脆弱性の深刻度評価基準であるCVSS ([Common Vulnerability Scoring System](https://www.ipa.go.jp/security/vuln/scap/cvssv3.html)) を使ってきました。CVE脆弱性の基本評価基準(Base Metrics)までの分析に留まり、現状評価基準、まして環境評価基準まで踏み込んで深刻度を評価することは、膨大な数あるCVE脆弱性がある状況の中では、現実的でないし、そもそも無理があります。

脆弱性管理の効率よく実効性を上げることができないものか？

<!-- vim-markdown-toc GFM -->

* [2022年は25,000件ものCVE脆弱性が公表された](#2022年は25000件ものcve脆弱性が公表された)
* [CISAのBOD 22-01から知った事実](#cisaのbod-22-01から知った事実)
* [CISAにはKEVがある](#cisaにはkevがある)
  * [後日に追加した参考資料](#後日に追加した参考資料)
* [SSVC](#ssvc)
  * [SSVC](#ssvc-1)
    * [基本的な特性](#基本的な特性)
  * [Vulnerability Management Decisions](#vulnerability-management-decisions)
    * [Enumerating Stakeholders (列举利益相关者)](#enumerating-stakeholders-列举利益相关者)
    * [Enumerating Decisions](#enumerating-decisions)
    * [Enumerating Vulnerability Management Actions](#enumerating-vulnerability-management-actions)
      * [Supplier Units of Work](#supplier-units-of-work)
      * [Deployer Units of Work](#deployer-units-of-work)
      * [Coordinator Units of Work](#coordinator-units-of-work)
      * [Aggregation of SSVC across units of work](#aggregation-of-ssvc-across-units-of-work)
        * [Deploying Patches](#deploying-patches)
    * [Items With the Same Priority](#items-with-the-same-priority)
    * [Risk Tolerance and Response Priority (リスク許容度と対応の優先順位)](#risk-tolerance-and-response-priority-リスク許容度と対応の優先順位)
    * [Scope](#scope)
      * [Boundaries of the Affected System](#boundaries-of-the-affected-system)
      * [Relevant Security Policy](#relevant-security-policy)
  * [Likely Decision Points and Relevant Data](#likely-decision-points-and-relevant-data)
    * [Exploitation (悪用)](#exploitation-悪用)
      * [Gathering Information About Exploitation](#gathering-information-about-exploitation)
    * [Technical Impact (技術的影響)](#technical-impact-技術的影響)
      * [Gathering Information About Technical Impact](#gathering-information-about-technical-impact)
  * [Utility (有用性)](#utility-有用性)
    * [Automatable](#automatable)
      * [Gathering Information About Automatable](#gathering-information-about-automatable)
    * [Value Density](#value-density)
      * [Gathering Information About Value Density](#gathering-information-about-value-density)
  * [Safety Impact](#safety-impact)
    * [Gathering Information About Safety Impact](#gathering-information-about-safety-impact)
  * [Public Safety Impact (公共安全影响)](#public-safety-impact-公共安全影响)
  * [Mission Impact](#mission-impact)
  * [Human Impact](#human-impact)
  * [System Exposure](#system-exposure)
  * [Decisions During Vulnerability Coordination (漏洞协调期间的决策)](#decisions-during-vulnerability-coordination-漏洞协调期间的决策)
    * [Coordination Triage Decisions (协调分类决策)](#coordination-triage-decisions-协调分类决策)
  * [Publication Decision](#publication-decision)
    * [Supplier Involvement (供应商参与)](#supplier-involvement-供应商参与)
  * [Prioritization](#prioritization)
    * [Supplier Tree](#supplier-tree)
    * [Deployer Tree](#deployer-tree)
    * [Coordinator trees](#coordinator-trees)
    * [Guidance for Evidence Gathering](#guidance-for-evidence-gathering)
    * [Relationship to asset management](#relationship-to-asset-management)
  * [Guidance on Communicating Results](#guidance-on-communicating-results)
    * [Communication Formats](#communication-formats)
      * [Abbreviated Format](#abbreviated-format)
      * [Full JSON format](#full-json-format)
    * [Partial or Incomplete Information](#partial-or-incomplete-information)
    * [Information Changes Over Time](#information-changes-over-time)
  * [Version 2 Changelog](#version-2-changelog)
  * [Worked Example](#worked-example)
  * [Related Vulnerability Management Systems](#related-vulnerability-management-systems)
    * [CVSS](#cvss)
      * [Base metric group](#base-metric-group)
      * [Temporal metric groups](#temporal-metric-groups)
      * [Environmental metric group](#environmental-metric-group)
    * [EPSS](#epss)
  * [VPR](#vpr)
  * [vPrioritizer](#vprioritizer)
* [参考リンク](#参考リンク)

<!-- vim-markdown-toc -->

# 2022年は25,000件ものCVE脆弱性が公表された
[NVD](https://www.nist.gov/)(NATIONAL VULNERABILITY DATABASE)からの統計数字で：

![file](https://i.imgur.com/gMXv2Pj.png)

平均で約68件/日にもあります。

# CISAのBOD 22-01から知った事実
[CISA](https://www.cisa.gov/) : Cybersecurity and Infrastructure Security Agency  
アメリカ合衆国連邦政府のサイバーセキュリティとインフラセキュリティに関連するエージェンシーです。この機関は、サイバーセキュリティの強化、インフラストラクチャの保護、および緊急事態に対する対応を担当しています。

BOD : Binding Operational Directive   
アメリカ連邦政府機関に対して法的に拘束力のある規則や指針を提供するものであり、サイバーセキュリティに関連する重要な問題に焦点を当てています。

[BOD 22-01 : Reducing the Significant Risk of Known Exploited Vulnerabilities](https://www.cisa.gov/news-events/directives/bod-22-01-reducing-significant-risk-known-exploited-vulnerabilities)  
特定のサイバー脆弱性のリスクを低減するための指令です。

このBOD 22-01には、以下の集計数字が書かれています
>Also, many vulnerabilities classified as “critical” are highly complex and have never been seen exploited in the wild - in fact, less than 4% of the total number of CVEs have been publicly exploited. But threat actors are extremely fast to exploit their vulnerabilities of choice: of those 4% of known exploited CVEs, 42% are being used on day 0 of disclosure; 50% within 2 days; and 75% within 28 days.

以下2つの事実が書かれています
- 悪用されたのはCVE脆弱性の総数の4%未満。
- 悪用されているCVE脆弱性のうち、42%が公開当日に、50%が2日以内、75%が28日以内に悪用されている。

この統計数字を正しいとすれば、CVE脆弱性のうち、28日(約1ヶ月)以内に悪用されるのは3%、1が月後に悪用される確率はさらにそれ以下、ということが言えるかと思います。

# CISAにはKEVがある
[KEV](https://www.cisa.gov/known-exploited-vulnerabilities-catalog)(**K**nown **E**xploited **V**ulnerabilities)

悪用が既知であると特定された脆弱性のことを指します。これらの脆弱性は、ソフトウェア、ハードウェア、またはシステムにおけるセキュリティ上の弱点であり、一般に知られており、悪意のある行為に活用されていることが報告や証拠として関連付けられています。

CISAは、これらの既知の悪用された脆弱性を注意深く監視し、重要インフラ、政府システム、組織、個人に対する脅威のレベルを評価します。これらの脆弱性を理解し、対処することは、効果的なサイバーセキュリティ対策のために重要です。CISAは、これらの脆弱性に関連するリスクを軽減し、全体的なサイバーセキュリティの体制を強化するための助言やアラートを提供しています。

2023/09/28時点、CISAには約1,000件強のKEVがリストアップされています。試しにCSVにダウンロードして中みをみてみたら、以下の記憶新しいものがありました

|cveID | vendorProject | product | vulnerabilityName | dateAdded |
|:- |:- |:- |:- |:- |:- |
|CVE-2021-44228|Apache|Log4j2|Apache Log4j2 Remote Code Execution Vulnerability|2021/12/10|
|CVE-2021-45046|Apache|Log4j2|Apache Log4j2 Deserialization of Untrusted Data Vulnerability|2023/05/01|

どこかのページでみたのですが、CISAはCVE脆弱性の悪用を検知したら2,3日以内にKEVに追加しているそうです。

## 後日に追加した参考資料
- [アレな3人が注目するドキュメント“BOD”から始める「脆弱性対応」の第一歩](https://enterprisezine.jp/article/detail/18599?utm_source=ez_newsletter&utm_medium=email&utm_campaign=piano_esp&pnespid=6LWOnphE4KjN5PTp_wG146IKvg0L8yd7hhEwH0UzrkOVq70vE65ONWYwomiudP9zss_xFTQV)

# SSVC
Stakeholder-Specific Vulnerability Categorization  
/ ステークホルダー固有の脆弱性分類  
/ 利益相关者特定的漏洞分类  
2019年に米カーネギーメロン大学ソフトウェア工学研究所から提案されたもの。

- 2019/12/04 WHITE PAPER
  - [Prioritizing Vulnerability Response: A Stakeholder-Specific Vulnerability Categorization](https://insights.sei.cmu.edu/library/prioritizing-vulnerability-response-a-stakeholder-specific-vulnerability-categorization/)
- 2021/04/30 WHITE PAPER
  - [Prioritizing Vulnerability Response: A Stakeholder-Specific Vulnerability Categorization (Version 2.0)](https://insights.sei.cmu.edu/library/prioritizing-vulnerability-response-a-stakeholder-specific-vulnerability-categorization-version-20/)

## SSVC
### 基本的な特性
- 解決したいイッシュー
>The general problem is: given limited resources, which vulnerabilities should be processed and which can be ignored for now.
We approach this problem from a pragmatic, practitioner-centered perspective.

- CVSSに対する課題感
>CVSS avoids discussing decisions and, instead, takes technical severity as its fundamental operating principle. However, the
standard does not provide clear advice about how CVSS scores might inform decisions.

- SSVCのTarget Audience 
>The target audience for SSVC is vulnerability managers of any kind.

- 脆弱性に対する定義
>“A set of conditions or behaviors that allows the violation of an explicit or implicit security policy.”  
日本語でいうと、"明示的または暗黙的なセキュリティ ポリシーの違反を許可する一連の条件または行動"

- 設計目標
>Our design goals for the decision-making process are to clearly define whose decisions are involved; properly
use evidentiary categories; be based on reliably available evidence; be transparent; and be explainable.
>- きちんと証拠となるカテゴリーを使用
>- 信頼性の高い入手可能な証拠に基づく
>- 透明
>- 説明可能

- 誰の決定が関与しているのかを明確にする
>To consider decisions about managing the vulnerability rather than just its technical severity, one must be
clear about whose decisions are involved.

- 決定は数字ではなく、組織が実行できる定性アクションにすべき
>Decisions are not numbers. They are qualitative actions that an organization can take. In many cases,
numerical values can be directly converted to qualitative decisions. 
>
>SSVC decisions should be distinct and crisp, without such statistical overlaps.  
>SSVC 的决策应该清晰明了，没有这种统计重叠。

- Design goals for a vulnerability management process  
>1. Outputs are decisions（输出就是决策）  
>1. Pluralistic recommendations are made among a manageable number of stakeholder groups（在数量可管理的利益相关者群体中提出多元化建议）  
>1. Inputs are qualitative（输入是定性的）  
>1. Outputs are qualitative, and there are no (unjustified) shifts to quantitative calculations (产出是定性的，并且不存在（不合理的）转向定量计算的情况）  
>1. Process justification is transparent (流程合理性是透明的）  
>1. Results are explainable (结果是可以解释的）

- Dicision Trees（決定木 / 决策树)
- Representation choices

## Vulnerability Management Decisions
### Enumerating Stakeholders (列举利益相关者)
Can be identified by their responsibility:

|Stakeholder| Role (in the case of IT)|
|:-|:-|
|Supplier / サプライヤー<br>(ソフトウェアなどを供給するベンダー)| A third-party vendor providing software components, libraries, or modules |
|Deployer / デプロイヤー<br>(脆弱性対応の現場)| The deployment of software or systems into the production environment they will be used |
|Coordinator /コーディネーター<br>(脆弱性対応を統制する組織)| Organizing, planning, and managing various activities within a project or organization|

### Enumerating Decisions
### Enumerating Vulnerability Management Actions
#### Supplier Units of Work
Supplier output is relevant because it will become input to Deployers.

#### Deployer Units of Work
The vulnerability management process for deployers has at its core the collation of data including
1. an inventory of deployed instances of product versions (We invite further refinement)   
  → Should be collected by the Deplpyer
1. a mapping of vulnerabilities to remediations or mitigations
1. a mapping of remediations and/or mitigations to product versions  
  → The latter two most often originate from the product Supplier

Mapping the first and the latter two is called **Asset management (資産管理)** 

#### Coordinator Units of Work
Coordinators may need to reorganize reports (e.g., merge, split, expand, or contract) according to their workflow demands. SSVC can be applied to either the initial report or to the results of such refinement.

#### Aggregation of SSVC across units of work
Remediation (修復) とMitigation (缓和措置)の違い
  - Remediation occurs when the vulnerability is **eliminated** (排除された) or **removed** (削除された). 
    - Examples:
      - **Applying patches**
      - **fixes and upgrades**
      - **removing the vulnerable software or system** from operation
  - Mitigation occurs when the impact of the vulnerability is **decreased** without reducing or eliminating the vulnerability
    - Examples:
      - Software **configuration changes**
      - **Adding firewall ACLs**
      - **Limiting the system’s exposure** to reduce the risk of the impact of the vulnerability
      - **Accepting the risk**

##### Deploying Patches
- When remediation is available, usually the action is to apply it.
- Applying mitigations may change the value of decision points.
- If applying a mitigation reduces the priority to defer, the deployer may not need to apply a remediation, if later, it becomes available (次に話は大変重要)
  >Since software and systems are dynamic, a single vulnerability can be re-introduced after initial remediation through updates, software rollbacks, or other systemic actions that change the operating conditions within an environment. It is therefore important to continually monitor remediated environments for vulnerabilities reintroduced by either rollbacks or new deployments of outdated software.
  
| Deployer Priority |つまり |Description |
|:-|:-|:-|
|Defer| 延期対応 |Do not act at present.|
|Scheduled |定期対応|Act during regularly scheduled maintenance time.|
|Out-of-cycle |優先対応 |Act more quickly than usual to apply the mitigation or remediation out-of-cycle, during the next available opportunity, working overtime if necessary.|
|Immediate |緊急対応|Act immediately; focus all resources on applying the fix as quickly as possible, including, if necessary, pausing regular organization operations.|

### Items With the Same Priority
- CVSS is designed to be accurate only within +/- 0.5, and, in practice, is scored with errors of around +/- 1.5 to 2.5
- In SSVC, vulnerabilities assigned in the same priority can be patched in any order.

### Risk Tolerance and Response Priority (リスク許容度と対応の優先順位)
- Risk is defined as “effect of uncertainty on objectives” (目標に対する不確実性の影響)
  - Change risk
  - Vulnerability risk
- the labels on the trees (defer, immediate, etc.) **can and should be customized to suit the needs** of individual stakeholders wherever necessary and appropriate.
  - Organization with a high aversion to change risk might choose to accept more vulnerability risk by lowering the overall response labels.
  - Organization with a high aversion to vulnerability risk could elevate the priority.

### Scope
#### Boundaries of the Affected System
- Nearest  
  Is relative to the abstraction at which the vulnerability exists.
- Relevant  
  The impacted component must be in the chain of abstraction moving upward from the location of the flaw.  
  >受影响的组件必须处于从缺陷位置向上移动的抽象链中
- More abstract 
  The impacted component is at least one level of abstraction above the specific location of the vulnerability.  
  >受影响的组件在漏洞的特定位置之上至少有一个抽象级别
- Discrete  
  There is an identifiable thing that can be remediated.  
  >存在可以补救的可识别事物

#### Relevant Security Policy
- Immediacy  
  How soon after the decision point adverse effects should occur to be considered relevant.  
  >即時性とは、決定時点からどのくらい早く悪影響が発生して関連性があるとみなされるか
- Prevalence  
  How common adverse effects should be to be considered relevant.  
  >蔓延性とは、一般的な悪影響がどの程度関連しているとみなされるべきか
- Causal importance
  How much an exploitation of the software in the cyber-physical system contributes to adverse effects to be considered relevant.  
  >因果関係の重要性は、サイバー物理システム内のソフトウェアの悪用が、関連性があるとみなされる悪影響にどの程度寄与しているか

## Likely Decision Points and Relevant Data
### Exploitation (悪用)
>Evidence of Active Exploitation of a Vulnerability
>脆弱性の積極的な悪用の証拠

- Exploitation Decision Values 

  | Value |Definition|
  |:-|:-|
  |None|The following cases are both true:<br>(1) no evidence of active exploitation; (2) no PoC|
  |Poc|One of the following cases is true:<br> (1) exploit code is sold or traded on underground or restricted fora;<br> (2) a typical public PoC in places such as Metasploit or ExploitDB;<br>(3) the vulnerability has a well-known method of exploitation.|
  | Active |Shared, observable, reliable evidence that the exploit is being used in the wild by real attackers;<br>there is credible public reporting.|

#### Gathering Information About Exploitation
- Part (3) of PoC would not be difficult to be searched.
- Gathering information for active is a bit harder.

### Technical Impact (技術的影響)
>Technical Impact of Exploiting the Vulnerability  
>脆弱性悪用による技術的影響

- Technical Impact Decision Values

  | Value |Definition|
  |:-|:-|
  | Partial |The exploit gives the adversary<br>(1) **limited control** over<br>(2) **limited information exposure** about,<br> the behavior of the software.<br>(3) an importantly **low stochastic opportunity** for total control. |
  | Total | The exploit gives the adversary **total control** over the behavior of the software,<br> or **total disclosure** of all information on the system.|
  
#### Gathering Information About Technical Impact
The cases of "Total" (After exploiting the vulnerablily):
- the attacker CAN install and run arbitrary software.
- the attacker CAN trigger all the actions that the vulnerable component can perform.
- the attacker CAN get an account with full privileges to the vulnerable component (e.g. admin or root accounts)

## Utility (有用性)
>The Usefulness of the Exploit to the Adversary  
>敵に対するエクスプロイトの有用性

- Utility estimates an adversary’s benefit compared to their effort **based on the assumption that they can exploit** the vulnerability. 
- Utility is **independent from the state of Exploitation**.
- Utility is about how much an adversary might benefit from a campaign using the vulnerability in question.  
  >実用性は、問題の脆弱性を利用したキャンペーンによって攻撃者がどれだけ利益を得る可能性があるかを表す。

- Utility Decision Values

  | Value |Definition|
  |:-|:-|
  | Laborious / 手間的 | automatable = no && "Value Density" = diffuse |
  | Efficient / 効率的 | (automatable = yes && "Value Density" = diffuse)<br>(automatable = no && "Value Density" = concentrated) | 
  | Super Effective / 超効率的 | automatable = yes && "Value Density" = concentrated |

- Utility to the Adversary, as a Combination of Automatable (自動化の可能性) and Value Density (価値密度)

  |Automatable | Value Desity | Utility |
  |:-|:-|-:|
  |no|diffuse (発散)|laborious|
  |no|concentrated (集中)|efficient|
  |yes|diffuse|efficient|
  |yes|concentrated|super efficient|

### Automatable
- "no" の考えられるケース
  1. the vulnerable component is not searchable or enumerable on the network,
  1. weaponization may require human direction for each target,
  1. delivery may require channels that widely deployed network security configurations block, and
  1. exploitation is not reliable, due to exploit-prevention techniques enabled by default.

- "yes"
  Attackers can reliably automate steps 1-4 of the kill chain. (RCE or command injection) = yes.

#### Gathering Information About Automatable
- An answer of no does not mean that it is absolutely inconceivable to automate exploitation in any scenario.
- For most vulnerabilities, an open port does not automatically mean that reconnaissance, weaponization, and delivery are automatable.

### Value Density
- diffuse
  - the vulnerable component has limited resources.
  - the resources that the adversary will gain control over are relatively small.
  - examples:
    - email accounts / most consumer online banking accounts / common cell phones / most personal computing resources

- concentrated
  - be rich in resources
  - the direct responsibility of **“system operators”** rather than users
  - **usefulness and uniqueness** of the resources on the vulnerable system also inform value density.
  - examples:
    - database systems / Kerberos servers / web servers hosting login pages / cloud service providers. 

#### Gathering Information About Value Density
- An analyst might use market research reports or Internet telemetry data to assess an unfamiliar product.
- Network telemetry can inform how many instances of a software system are connected to a network.

## Safety Impact
>Safety Impacts of Affected System Compromise   
>影響を受けるシステム侵害による安全性への影響

### Gathering Information About Safety Impact
- The decision values for safety impact are based on the hazard categories for aircraft software.
- Safety Impact Decision Values

  |Value | Type of Harm | Difinition |
  |:-|:-|:-|
  |None|All|the effect is below the threshold for all aspects described in Minor (全部低于Manor)|
  |Minor (轻微)|Physical Harm |(1) Physical discomfort for users of the system (系统用户的身体不适)<br>(2) a minor occupational safety hazard (轻微的职业安全隐患)<br>(3) reduction in physical system safety margins (物理系统安全裕度降低)|
  |Minor |Environment|Minor property damage, environmental damage, etc. imposed on other parties (强加给他人的轻微财产损失和环境损害等)|
  |Minor |Financial|Financial losses, which are not readily absorbable, to multiple persons (众多人的财务损失)|
  |Minor |Psychological|Emotional or psychological harm, sufficient to be cause for counseling or therapy, to multiple persons (情感或心理伤害，多人需要咨询或治疗)|
  |Major (重大) | Physical Harm|(1) Physical distress and injuries for users of the system (系统用户的身体伤害)<br>(2) a significant occupational safety hazard (重大职业安全危害)<br>(3) failure of physical system functional capabilities that support safe operation (支持安全运行的物理系统功能失效)|
  |Major |Environment |externalities (property damage, environmental damage, etc.) imposed on other parties (强加给他人的财产损失和环境损害等|
  |Major |Financial|Financial losses that likely lead to bankruptcy of multiple persons (导致多人破产的财务损失)|
  |Major|Psychological| Widespread emotional or psychological harm, sufficient to be cause for counseling or therapy, to populations of people (广泛人群的情感或心理伤害，足以引起咨询或治)|
  |Hazardous (危险)|Physical Harm |Serious or fatal injuries, where fatalities are plausibly preventable via emergency services or other measures OR parts of the cyber-physical system that support safe operation break (受到严重或致命伤害,死亡可以避免|
  |Hazardous|Environment|Serious externalities (threat to life as well as property, widespread environmental damage, measurable public health risks, etc.) imposed on other parties (强加给他人严重的生命和财产的威胁，广泛的环境破坏、可控的公共健康风险等)|
  |Hazardous|Financial|Socio-technical system (elections, financial grid, etc.) of which the affected component is a part is actively destabilized and enters unsafe state (选举、金融网等社会技术系统被积极破坏，进入不稳定状态)|
  |Hazardous|Psychological|N/A|
  |Catastrophic (灾难)|Physical Harm|Multiple immediate fatalities (emergency response probably cannot save the victims.(多人马上死亡)|
  |Catastrophic|Environment|Extreme externalities (immediate public health threat, environmental damage leading to small ecosystem collapse, etc.) imposed on other parties (强加给他人极端的公共健康威胁、导致小型生态系统崩溃的环境破坏等)|
  |Catastrophic|Financial|Social systems (elections, financial grid, etc.) supported by the software collapse (选举，金融网等的崩毁)|
  |Catastrophic|Psychological|N/A|

## Public Safety Impact (公共安全影响)
- Public Safety Impact Decision Values

  |Value|Definition|
  |:-|:-|
  |Minimal (最小)|Safety Impact of None or Minor|
  |Significant (重要)|Safety Impact of Major, Hazardous, or Catastrophic|

## Mission Impact
>Impact on Mission Essential Functions of the Organization  
>組織の使命に不可欠な機能への影響

- Mission Impact Decision Values

  |Value|Definition|
  |:-|:-|
  |None / Non-Essential (无/非必需)| Little to no impact up to degradation of non-essential functions; chronic (几乎没有影响，直至非必要功能退化)|
  |Degraded (降级)|degradation would eventually harm essential functions (退化最终会损害基本功能)|
  |MEF Support Crippled (MEF支持受损)|(1) Activities that directly support essential functions are crippled (直接支持基本功能受到削弱)<br>(2) essential functions continue for a time (基本功能会持续一段时间)|
  |MEF Failure (MEF失败) |(1) Any MEF fails for period of time longer than acceptable (MEF故障超出可接受时间)<br>(2) overall mission of the organization degraded but can still be accomplished for a time (组织的总体使命下降,但在一段时间内仍可完成)|
  |Mission Failure (任务失败) |(1) Multiple or all mission essential functions fail (多个或所有任务基本功能失败)<br>(2) ability to recover those functions degraded (恢复能力下降)<br>(3) organization’s ability to deliver its overall mission fails (组织完成总体使命的能力失败)|

## Human Impact
>Combined Situated Safety and Mission Impact  
>综合现场安全和任务影响

Human Impact = combine Mission Impact with Situated Safety impact and map them onto a 4-tiered scale (Low, Medium, High, Very High).

## System Exposure
>The Accessible Attack Surface of the Affected System or Service  
>受影响系统或服务的可访问攻击面

- Exposure should be judged against the system in its deployed context, which may differ from how it is commonly expected to be deployed.
- System Exposure Decision Values

  |Value|Definition|
  |:-|:-|
  |Small|(1) Local service or program; (2) highly controlled network|
  |Controlled|(1) Networked service with some access restrictions or mitigations already in place (Local or NW)<br>(2) requires the attack is detectable both reliably and quickly enough to respond<br>(3) the situation in which a vulnerability can be exploited through chaining it with other vulnerabilities|
  |Open|Internet or another widely accessible network where access cannot plausibly be restricted or controlled|

- The assumption of "controlled" is that the number of steps in the attack path is relatively low.
- Examples of "open" : DNS / web server / VOIP / email server

- Gathering Information About System Exposure (从上而下判断，点到为止)
  - 网络断开 -> Small
  - Automatable = yes -> Controlled
  - 所在网络的其他hosts可以接Web或邮件 -> Controlled
  - 被Shodan或其他外部扫描服务可见 -> Open
  - 接入手机或PC没有IP和URL限制或没有防火墙保护 -> Open

## Decisions During Vulnerability Coordination (漏洞协调期间的决策)
### Coordination Triage Decisions (协调分类决策)
Take three priority levels: 
1. Decline (拒绝)
1. Track (跟踪)
1. Coordinate— (协调) 

## Publication Decision
### Supplier Involvement (供应商参与)
The state of the supplier’s work on addressing the vulnerability
- Fix Ready (修复就绪) — has provided a patch or fix (已提供补丁或修复)
- Cooperative (合作) — actively generating a patch or fix (正在积极生成补丁或修复)
  they may or may not have provided a mitigation or work-around in the mean time.
- Uncooperative/Unresponsive (不合作/无响应) — has not responded, declined to generate a remediation, or no longer exists.

## Prioritization
### Supplier Tree
- Both supplier and deployer trees use the same decision point definitions.
- Rectangles are decision points, and triangles represent outcomes (矩形是决策点，三角形代表结果).

### Deployer Tree
Suggested Deployer Tree

![file](https://i.imgur.com/ubtUIF5.png)

↑Expoitation = none

![file](https://i.imgur.com/4MHK9mR.png)

↑Expoitation = PoC

![file](https://i.imgur.com/5gV8bKD.png)

↑Expoitation = active

### Coordinator trees
Omitted...

### Guidance for Evidence Gathering
- If the deployer does not know their exposure, that means they do not know where the devices are or how they are controlled, so they should assume System Exposure is open. 
- Assuming a major Safety Impact is suggested if nothing is known about the environment in which the device is used.
- Assuming support crippled as a default with Mission Impact with a total lack of information.
- Exploitation needs no special default
  - If adequate searches are made for exploit code and none is found, the answer is none.
- If nothing is known about Automatable, the safer answer to assume is yes.
- Value Density should always be answerable; if the product is uncommon, it is probably diffuse. 

### Relationship to asset management
- Vulnerability management is a part of asset management. 
- Asset management can help automate the collection of the Mission Impact, Situated Safety Impact, and System Exposure decision points.
- There are at least three aspects of asset management that may be important:
  - The transaction cost of conducting the mitigation or remediation (进行缓解或补救的交易成本)
  - The risk of the remediation or mitigation introducing a new error or vulnerability (引入新错误或漏洞的风险) 
  - An operational cost of applying a remediation or mitigation, representing an ongoing change of functionality or increased overhead (可能会产生运营成本)

## Guidance on Communicating Results
- Representation choices and Tree Construction and Customization Guidance discussed how SSVC uses a text file as the canonical form of a decision tree.

### Communication Formats
Two structured communication formats:
- Abbreviated
  - The goal is to fill a need for providing identifying information about a vuln or decision in charts/graphs/tables.
  - Is not designed to stand alone.
- Full
  - The goal is to capture all the context and details about a decision or work item in a clear and machine-readable way.

#### Abbreviated Format
The basic format for SSVC:
- SSVC/(version)/(decision point):(value)[/decision point:value[/decision point:value[...]]][/time]/

-Examples
  -SSVCv2/Ps:Nm/T:T/U:E/1605040000/
    - No or minor Public Safety Impact
    - Total Technical Impact
    - Efficient Utility
    - Was evaluated on Nov 10, 2020.
  - SSVCv2/E:P/A:Y/T:T/P:M/B:M/M:L/D:T/2023-10-14T07:26:19Z/

#### Full JSON format
<details>
<summary>JSON Example (Role:Deployer)</summary>

```json
{
  "role": "Deployer",
  "id": "CVE-2020-7961",
  "version": "2.0",
  "generator": "Dryad SSVC Calculator 5.1.7",
  "computed": "SSVCv2/E:P/A:Y/T:T/P:M/B:M/M:L/D:T/2023-10-14T07:26:19Z/",
  "timestamp": "2023-10-14T07:26:19Z",
  "options": [
    {
      "Exploitation": "poc"
    },
    {
      "Automatable": "yes"
    },
    {
      "Technical Impact": "total"
    },
    {
      "Mission Prevalence": "Minimal"
    },
    {
      "Public Well-being Impact": "Minimal"
    },
    {
      "Mission & Well-being": "low"
    },
    {
      "Decision": "Track"
    }
  ],
  "$schema": "https://democert.org/ssvc/SSVC_Computed_v2.03.schema.json",
  "decision_tree_url": "https://democert.org/ssvc/CISA-Coordinator-v2.0.3.json",
  "decision_tree": {
    "decision_points": [
      {
        "label": "Exploitation",
        "decision_type": "simple",
        "key": "E",
        "options": [
          {
            "label": "none",
            "key": "N",
            "description": "There is no evidence of active exploitation and no public proof of concept (PoC) of how to exploit the vulnerability."
          },
          {
            "label": "poc",
            "key": "P",
            "description": "One of the following cases is true: (1) private evidence of exploitation is attested but not shared; (2) widespread hearsay attests to exploitation; (3) typical public PoC in places such as Metasploit or ExploitDB; or (4) the vulnerability has a well-known method of exploitation. Some examples of condition (4) are open-source web proxies serve as the PoC code for how to exploit any vulnerability in the vein of improper validation of TLS certificates. As another example, Wireshark serves as a PoC for packet replay attacks on ethernet or WiFi networks."
          },
          {
            "label": "active",
            "key": "A",
            "description": "Shared, observable, reliable evidence that the exploit is being used in the wild by real attackers; there is credible public reporting."
          }
        ]
      },
      {
        "label": "Automatable",
        "key": "A",
        "decision_type": "simple",
        "options": [
          {
            "label": "no",
            "key": "N",
            "description": "Steps 1-4 of the kill chain  cannot be reliably automated for this vulnerability for some reason. These steps are reconnaissance, weaponization, delivery, and exploitation. Example reasons for why a step may not be reliably automatable include (1) the vulnerable component is not searchable or enumerable on the network, (2) weaponization may require human direction for each target, (3) delivery may require channels that widely deployed network security configurations block, and (4) exploitation may be frustrated by adequate exploit-prevention techniques enabled by default; ASLR is an example of an exploit-prevention tool."
          },
          {
            "label": "yes",
            "key": "Y",
            "description": "Steps 1-4 of the of the kill chain can be reliably automated. If the vulnerability allows unauthenticated remote code execution (RCE) or command injection, the response is likely yes."
          }
        ]
      },
      {
        "label": "Technical Impact",
        "key": "T",
        "decision_type": "simple",
        "options": [
          {
            "label": "partial",
            "key": "P",
            "description": "The exploit gives the adversary limited control over, or information exposure about, the behavior of the software that contains the vulnerability. Or the exploit gives the adversary an importantly low stochastic opportunity for total control. In this context, \"low\" means that the attacker cannot reasona-bly make enough attempts to overcome the low chance of each attempt not working. Denial of service is a form of limited control over the behavior of the vulnerable component."
          },
          {
            "label": "total",
            "key": "T",
            "description": "The exploit gives the adversary total control over the behavior of the software, or it gives total disclosure of all information on the system that contains the vulnerability."
          }
        ]
      },
      {
        "label": "Public Well-being Impact",
        "key": "B",
        "decision_type": "simple",
        "options": [
          {
            "label": "Minimal",
            "key": "M",
            "description": "Type of harm is \"All\" (Physical, Environmental,Financial,Psychological) and the associated Safety Impact Value is \"None\". The effect is below the threshold for all aspects described in material."
          },
          {
            "label": "Material",
            "key": "A",
            "description": "Any one or more of the conditions (Physical, Environmental,Financial,Psychological) hold and the associated Safety Impact Value is \"Major\". \"Physical harm\" means \"Physical distress or injuries for users of the system OR introduces occupational safety hazards OR reduction and/or failure of cyber-physical system’s safety margins.\" \"Environment\" means \"Major externalities (property damage, environmental damage, etc.) imposed on other parties.\" \"Financial\" means \"Financial losses that likely lead to bankruptcy of multiple persons.\" \"Psychological\" means \"Widespread emotional or psychological harm, sufficient to be cause for counselling or therapy, to populations of people.\""
          },
          {
            "label": "Irreversible",
            "key": "I",
            "description": "Any one or more of the following conditions hold and the associated Safety Impact Value is \"Catastrophic\". \"Physical harm\" means \"Multiple fatalities likely OR loss or destruction of cyber-physical system of which the vulnerable component is a part.\" \"Environment\" means \"Extreme or serious externalities (immediate public health threat, environmental damage leading to small ecosystem collapse, etc.) imposed on other parties.\"  \"Financial\" means \"Social systems (elections, financial grid, etc.) supported by the software are destabilized and potentially collapse.\""
          }
        ]
      },
      {
        "label": "Mission Prevalence",
        "key": "P",
        "decision_type": "simple",
        "options": [
          {
            "label": "Minimal",
            "key": "M",
            "description": "Neither support nor essential apply. The vulnerable component may be used within the entities, but it is not used as a mission-essential component nor does it support (enough) mission essential functions."
          },
          {
            "label": "Support",
            "key": "S",
            "description": "The operation of the vulnerable component merely supports mission essential functions for two or more entities."
          },
          {
            "label": "Essential",
            "key": "E",
            "description": "The vulnerable component directly provides capabilities that constitute at least one MEF for at least one entity, and failure may (but need not) lead to overall mission failure."
          }
        ]
      },
      {
        "label": "Mission & Well-being",
        "key": "M",
        "decision_type": "complex",
        "children": [
          {
            "label": "Mission Prevalence"
          },
          {
            "label": "Public Well-being Impact"
          }
        ],
        "options": [
          {
            "label": "low",
            "key": "L",
            "description": "Mission Prevalence is Minimal and Public well-being impact is Minimal",
            "child_combinations": [
              [
                {
                  "child_label": "Mission Prevalence",
                  "child_key": "M",
                  "child_option_labels": [
                    "Minimal"
                  ],
                  "child_option_keys": [
                    "M"
                  ]
                },
                {
                  "child_label": "Public Well-being Impact",
                  "child_option_labels": [
                    "Minimal"
                  ]
                }
              ]
            ]
          },
          {
            "label": "medium",
            "key": "M",
            "description": "{Mission Prevalence is Support and Public well-being is Minimal or Material} OR {Mission Prevalence is Minimal or Support and Public well-being is Material}",
            "child_combinations": [
              [
                {
                  "child_label": "Mission Prevalence",
                  "child_key": "M",
                  "child_option_labels": [
                    "Support"
                  ],
                  "child_option_keys": [
                    "S"
                  ]
                },
                {
                  "child_label": "Public Well-being Impact",
                  "child_option_labels": [
                    "Minimal",
                    "Material"
                  ]
                }
              ],
              [
                {
                  "child_label": "Mission Prevalence",
                  "child_key": "M",
                  "child_option_labels": [
                    "Minimal"
                  ],
                  "child_option_keys": [
                    "M"
                  ]
                },
                {
                  "child_label": "Public Well-being Impact",
                  "child_option_labels": [
                    "Material"
                  ]
                }
              ]
            ]
          },
          {
            "label": "high",
            "key": "H",
            "description": "Mission Prevalence is Essential or Public well-being impact is Irreversible",
            "child_combinations": [
              [
                {
                  "child_label": "Mission Prevalence",
                  "child_key": "M",
                  "child_option_labels": [
                    "Essential"
                  ],
                  "child_option_keys": [
                    "E"
                  ]
                },
                {
                  "child_label": "Public Well-being Impact",
                  "child_option_labels": [
                    "Minimal",
                    "Material",
                    "Irreversible"
                  ]
                }
              ],
              [
                {
                  "child_label": "Mission Prevalence",
                  "child_key": "M",
                  "child_option_labels": [
                    "Minimal",
                    "Support"
                  ],
                  "child_option_keys": [
                    "M",
                    "S"
                  ]
                },
                {
                  "child_label": "Public Well-being Impact",
                  "child_option_labels": [
                    "Irreversible"
                  ]
                }
              ]
            ]
          }
        ]
      },
      {
        "label": "Decision",
        "key": "D",
        "decision_type": "final",
        "options": [
          {
            "label": "Track",
            "key": "T",
            "description": "The vulnerability does not require attention outside of Vulnerability Management (VM) at this time.  Continue to track the situation and reassess the severity of vulnerability if necessary.",
            "color": "#28a745"
          },
          {
            "label": "Track*",
            "key": "R",
            "description": "Track these closely, especially if mitigation is unavailable or difficult. Recommended that analyst discuss with other ana-lysts and get a second opinion.",
            "color": "#ffc107"
          },
          {
            "label": "Attend",
            "key": "A",
            "description": "The vulnerability requires to be attended to by stakeholders outside VM. The action is a request to others for assistance / information / details, as well as a potential publication about the issue.",
            "color": "#EE8733"
          },
          {
            "label": "Act",
            "key": "C",
            "description": "The vulnerability requires immediate action by the relevant leadership. The action is a high-priority meeting among the relevant supervisors to decide how to respond.",
            "color": "#dc3545"
          }
        ]
      }
    ],
    "decisions_table": [
      {
        "Exploitation": "none",
        "Automatable": "no",
        "Technical Impact": "partial",
        "Mission & Well-being": "low",
        "Decision": "Track"
      },
      {
        "Decision": "Track",
        "Exploitation": "none",
        "Automatable": "no",
        "Technical Impact": "partial",
        "Mission & Well-being": "medium"
      },
      {
        "Decision": "Track",
        "Exploitation": "none",
        "Automatable": "no",
        "Technical Impact": "partial",
        "Mission & Well-being": "high"
      },
      {
        "Decision": "Track",
        "Exploitation": "none",
        "Automatable": "no",
        "Technical Impact": "total",
        "Mission & Well-being": "low"
      },
      {
        "Decision": "Track",
        "Exploitation": "none",
        "Automatable": "no",
        "Technical Impact": "total",
        "Mission & Well-being": "medium"
      },
      {
        "Decision": "Track*",
        "Exploitation": "none",
        "Automatable": "no",
        "Technical Impact": "total",
        "Mission & Well-being": "high"
      },
      {
        "Decision": "Track",
        "Exploitation": "none",
        "Automatable": "yes",
        "Technical Impact": "partial",
        "Mission & Well-being": "low"
      },
      {
        "Decision": "Track",
        "Exploitation": "none",
        "Automatable": "yes",
        "Technical Impact": "partial",
        "Mission & Well-being": "medium"
      },
      {
        "Decision": "Attend",
        "Exploitation": "none",
        "Automatable": "yes",
        "Technical Impact": "partial",
        "Mission & Well-being": "high"
      },
      {
        "Decision": "Track",
        "Exploitation": "none",
        "Automatable": "yes",
        "Technical Impact": "total",
        "Mission & Well-being": "low"
      },
      {
        "Decision": "Track",
        "Exploitation": "none",
        "Automatable": "yes",
        "Technical Impact": "total",
        "Mission & Well-being": "medium"
      },
      {
        "Decision": "Attend",
        "Exploitation": "none",
        "Automatable": "yes",
        "Technical Impact": "total",
        "Mission & Well-being": "high"
      },
      {
        "Decision": "Track",
        "Exploitation": "poc",
        "Automatable": "no",
        "Technical Impact": "partial",
        "Mission & Well-being": "low"
      },
      {
        "Decision": "Track",
        "Exploitation": "poc",
        "Automatable": "no",
        "Technical Impact": "partial",
        "Mission & Well-being": "medium"
      },
      {
        "Decision": "Track*",
        "Exploitation": "poc",
        "Automatable": "no",
        "Technical Impact": "partial",
        "Mission & Well-being": "high"
      },
      {
        "Decision": "Track",
        "Exploitation": "poc",
        "Automatable": "no",
        "Technical Impact": "total",
        "Mission & Well-being": "low"
      },
      {
        "Decision": "Track*",
        "Exploitation": "poc",
        "Automatable": "no",
        "Technical Impact": "total",
        "Mission & Well-being": "medium"
      },
      {
        "Decision": "Attend",
        "Exploitation": "poc",
        "Automatable": "no",
        "Technical Impact": "total",
        "Mission & Well-being": "high"
      },
      {
        "Decision": "Track",
        "Exploitation": "poc",
        "Automatable": "yes",
        "Technical Impact": "partial",
        "Mission & Well-being": "low"
      },
      {
        "Decision": "Track",
        "Exploitation": "poc",
        "Automatable": "yes",
        "Technical Impact": "partial",
        "Mission & Well-being": "medium"
      },
      {
        "Decision": "Attend",
        "Exploitation": "poc",
        "Automatable": "yes",
        "Technical Impact": "partial",
        "Mission & Well-being": "high"
      },
      {
        "Decision": "Track",
        "Exploitation": "poc",
        "Automatable": "yes",
        "Technical Impact": "total",
        "Mission & Well-being": "low"
      },
      {
        "Decision": "Track*",
        "Exploitation": "poc",
        "Automatable": "yes",
        "Technical Impact": "total",
        "Mission & Well-being": "medium"
      },
      {
        "Decision": "Attend",
        "Exploitation": "poc",
        "Automatable": "yes",
        "Technical Impact": "total",
        "Mission & Well-being": "high"
      },
      {
        "Decision": "Track",
        "Exploitation": "active",
        "Automatable": "no",
        "Technical Impact": "partial",
        "Mission & Well-being": "low"
      },
      {
        "Decision": "Track",
        "Exploitation": "active",
        "Automatable": "no",
        "Technical Impact": "partial",
        "Mission & Well-being": "medium"
      },
      {
        "Decision": "Attend",
        "Exploitation": "active",
        "Automatable": "no",
        "Technical Impact": "partial",
        "Mission & Well-being": "high"
      },
      {
        "Decision": "Track",
        "Exploitation": "active",
        "Automatable": "no",
        "Technical Impact": "total",
        "Mission & Well-being": "low"
      },
      {
        "Decision": "Attend",
        "Exploitation": "active",
        "Automatable": "no",
        "Technical Impact": "total",
        "Mission & Well-being": "medium"
      },
      {
        "Decision": "Act",
        "Exploitation": "active",
        "Automatable": "no",
        "Technical Impact": "total",
        "Mission & Well-being": "high"
      },
      {
        "Decision": "Attend",
        "Exploitation": "active",
        "Automatable": "yes",
        "Technical Impact": "partial",
        "Mission & Well-being": "low"
      },
      {
        "Decision": "Attend",
        "Exploitation": "active",
        "Automatable": "yes",
        "Technical Impact": "partial",
        "Mission & Well-being": "medium"
      },
      {
        "Decision": "Act",
        "Exploitation": "active",
        "Automatable": "yes",
        "Technical Impact": "partial",
        "Mission & Well-being": "high"
      },
      {
        "Decision": "Attend",
        "Exploitation": "active",
        "Automatable": "yes",
        "Technical Impact": "total",
        "Mission & Well-being": "low"
      },
      {
        "Decision": "Act",
        "Exploitation": "active",
        "Automatable": "yes",
        "Technical Impact": "total",
        "Mission & Well-being": "medium"
      },
      {
        "Decision": "Act",
        "Exploitation": "active",
        "Automatable": "yes",
        "Technical Impact": "total",
        "Mission & Well-being": "high"
      }
    ],
    "lang": "en",
    "version": "2.0",
    "title": "CISA Coordinator v2.0.3"
  }
}
```
</details>

### Partial or Incomplete Information
- Partial information may be, but is not required to be, sharpened over time into a precise value for the decision point.

### Information Changes Over Time
- Information changes are one reason why SSVC decisions should always be timestamped.
- Tates that heuristicly suggested:
  - State of Exploitation: every 1 day
  - Technical Impact: never (should be static per vulnerability)
  - Utility: every 6 months
  - Public Safety Impact: every 1 year

## Version 2 Changelog
Omitted...

## Worked Example
Evaluate [CVE-2018-14781](https://nvd.nist.gov/vuln/detail/CVE-2018-14781) step by step (Using the SSVC version 1 deployer decision tree)
- Exploitation  
  Is a fairly standard traffic capture and replay attack that, given access to the transmission medium, should be straightforward to conduct with Wireshark. Therefore, we select the “PoC” branch.
- System Exposure
  - System Exposure is less straightforward than Exploitation.
  - If the client’s phone app could be used to capture and replay attack packets, then unless that app is particularly well
secured, the answer should be CONTROLLED. 
  - Since most of the hospital’s clients have not installed the app, and for nearly all cases, physical proximity to the device is necessary; therefore, we select SMALL.
- Priority 
  - The Safety Impact could be catastrophic, the monitoring situation is adequate, and select hazardous. Therefore, mitigate this vulnerability OUT-OF-CYCLE.

## Related Vulnerability Management Systems
### CVSS
#### Base metric group
- Exploitability metrics
  - Attack Vector = Network && Privileges Required = None => Automatable = yes

- Impact metrics
  - The CIA impact metrics are directly handled by Technical Impact

#### Temporal metric groups
- The temporal metric group primarily contains the Exploit Code Maturity metric.

#### Environmental metric group
- Produce CVSS scores = what SSVC calls suppliers
- Consumer of a CVSS base score = Swhat SSVC calls deployers

### EPSS
- EPSS is an "effort for predicting when software vulnerabilities will be exploited" (预测软件漏洞何时会被利用)
- Currently, Exploitation focuses on the observable state of the world at the time of the SSVC decision. EPSS is about predicting if a transition will occur from the SSVC state of none to active.

EPSSは全世界のCSIRT（Computer Security Incident Response Team）における情報交換を目的としたフォーラム「FIRST」（Forum of Incident Response and Security Teams）で開発されている仕組みで、CVSSやCVEの情報や言及されている参考URLの数などのさまざまな情報から、30日以内に該当脆弱性が悪用される確率を「EPSS Probability」として、1～100の間で算出するというもの。

EPSSはFIRSTのWebサイトで公開されており、その脆弱性が他の脆弱性と比較し、どのような位置にいるかを把握できます。データはCSV形式でダウンロードも可能である。

参照:[EPSS Data](https://www.first.org/epss/data_stats?_ga=2.178617261.887979224.1697164995-1353954653.1697164995)

## VPR
- VPR is a prioritization product sold by Tenable.
- VPR determines the severity level of a vulnerability based on “technical impact and threat.”

## vPrioritizer
- vPrioritizer is an open-source project that attempts to integrate asset management and vulnerablity prioritization.


# 参考リンク
- About Vulnerability
  - [NIST Statistics Results](https://nvd.nist.gov/vuln/search/statistics?form_type=Basic&results_type=statistics&search_type=all&isCpeNameSearch=false)
  - [Known Exploited Vulnerabilities Catalog](https://www.cisa.gov/known-exploited-vulnerabilities-catalog)
  - [2022 Top Routinely Exploited Vulnerabilities](https://www.cisa.gov/news-events/cybersecurity-advisories/aa23-215a)
- About SSVC
  - 米カーネギーメロン大学ソフトウェア工学研究所  
    [PRIORITIZING VULNERABILITY RESPONSE: A STAKEHOLDER-SPECIFIC VULNERABILITY CATEGORIZATION (VERSION 2.0)](https://insights.sei.cmu.edu/documents/606/2021_019_001_653461.pdf)
  - [Stakeholder-Specific Vulnerability Categorization (SSVC)](https://www.cisa.gov/stakeholder-specific-vulnerability-categorization-ssvc)
  - [SSVC（Stakeholder-Specific Vulnerability Categorization）を活用した脆弱性管理](https://www.pwc.com/jp/ja/knowledge/column/awareness-cyber-security/stakeholder-specific-vulnerability-categorization.html)
  - [SSVCを使った脆弱性管理の取り組み](https://www.conoris.jp/blog/ssvc)
  - [ユーザー企業におけるSSVCの導入と留意点](https://www.pwc.com/jp/ja/knowledge/column/awareness-cyber-security/ssvc-introduction.html)
  - Youtube : [SSVC On Demand Training](https://www.youtube.com/watch?v=NqiwyUPLy6I)
- [見るべきは「CVSSスコア」“だけ”でいいのか？　脆弱性管理に役立つ指標をまとめてみた](https://www.itmedia.co.jp/enterprise/articles/2310/17/news019.html)

