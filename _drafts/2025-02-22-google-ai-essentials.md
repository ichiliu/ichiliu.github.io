---
layout: post
title: Google AI Essentials習得記
subtitle: 
cover-img: [/assets/img/cover/study1.jpg, /assets/img/cover/study2.jpg, /assets/img/cover/study3.jpg]
thumbnail-img: 
share-img:
tags: [AI, Google]
categories: [Study]
---

# 概要
[Coursera](https://www.coursera.org/)にある[Google AI Essentials](https://www.coursera.org/learn/google-ai-essentials)コースを習得するために、学習メモを記録したもの。

# コース内容
5つのモジュール
1. AI入門
1. AIツールによる生産性の最大化
1. プロンプティングの技術を学ぶ
1. 責任あるAIの使用
1. AIを先取りする

## 認定証の取得条件
- コースの5つのモジュールすべてを修了
- すべての小テストに80％以上の得点で合格(複数回可能)

# 学習筆記
## Module 1
- Artificial intelligence
  - Refers to computer programs that can complete cognitive tasks typically associated with human intelligence. 
  - There are two main techniques used to design AI programs:
    - Rule-based techniques  
      Involve creating AI programs that strictly follow predefined rules to make decisions.
    - Machine learning techniques  
      Involve creating AI programs that can analyze and learn from patterns in data to make independent decisions.
- There are three common approaches to training ML programs:
  - Supervised learning (教師あり学習)
    - Supervised learning is often used when there's a specific output in mind.
  - Unsupervised learning (教師なし学習)
    - Unsupervised learning is used to identify patterns in data without a specific output in mind.
  - Reinforcement learning (強化学習)
    - Reinforcement learning is commonly used by conversational AI tools. As these tools receive feedback from users and AI designers, they learn to generate effective responses.
- Generative AI's benefits include:
  - Greater efficiency (効率性の向上)
  - Personalized experiences (パーソナライズされた体験)
  - Better decisions (より良い決断)
- Natural language  
  The way people talk ro write when comuunicating with each other.
- How a generative Al tool works with natural language
  - Provide input
  - Data is processed
  - Output is generated
- Benefits of generative Al
  - Boost your productivity
  - Help you avoid mistakes
  - Improve your decision-making process 
- Conversational Al tool  
  A generative Al tool that processes text requests and generates text responses
- Limitations of Al
  - Can't learn independently
  - Can reflect or amplify biases
  - Can contain inaccuracies (Hallucination / ハルシネーション / 幻覚)
- Prompt  
  Text input that provides instructions to an AI model on how to generate output. 
- Al augmentation  
  The process of using Al to improve a work product, whether by making it easier to do or higher in quality.
- Al automation  
  The process of using Al to accomplish tasks, without any action on the user's part.

## Module 2 - Maximize productivity with AI tools
### Generative AI
#### Conversational AI tools
- [Anthropic Claude](https://www.anthropic.com/product)  
  Anthropic Claude can complete problem-solving tasks, like finding mathematical solutions, translating between languages, and summarizing long documents.
- [Gemini](https://gemini.google.com/app)   
  Chat to start writing, planning, learning and more with Google AI.
- [Microsoft Copilot](https://www.microsoft.com/en-us/edge/features/copilot?form=MT00IS)  
  Integrated with Microsoft Edge, Microsoft Copilot can help with online searches to find information, compare products, and summarize web page content.
- [ChatGPT](https://openai.com/chatgpt)  
  ChatGPT can generate ideas, plan schedules, debug code, and proofread text.

#### Productivity and writing assistants
- [Clockwise](https://www.getclockwise.com/)  
  Clockwise is a calendar tool that learns users’ work habits to automatically schedule and manage calendar events.
- [Grammarly](https://www.grammarly.com/)  
  Grammarly is a writing assistant that can help users edit and write clear, concise text.
- [Jasper](https://www.jasper.ai/)  
  Jasper is a writing assistant intended for marketing tasks, like drafting social media posts, emails, and landing page content.
- [NotebookLM](https://notebooklm.google/)  
  NotebookLM integrates into document apps, like Google Docs, and helps summarize or ask specific questions about text, notes, and sources.
- [Notion AI](https://www.notion.so/product/ai)  
  Notion AI is a writing assistant built into Notion, a productivity and note-taking software tool. 
- [AI by Zapier](https://zapier.com/apps/ai/integrations)  
  A built-in productivity tool that allows AI automation to be integrated with the apps and workflows already connected through Zapier.

#### Code-generative AI tools
- [Android Studio Bot](https://developer.android.com/studio/preview/studio-bot)  
  Built into Android Studio, Studio Bot can generate code and answer questions about Android development. 
- [GitHub Copilot](https://github.com/features/copilot)  
  Built into GitHub, Copilot can write and suggest code, suggest descriptions for pull requests, translate multiple languages into code, and index repositories.
- [Replit AI](https://replit.com/ai)  
  Built into Replit, is a cloud-based Integrated Development Environment (IDE) for programmers that can make suggestions, help explain code, and turn natural language into code.
- [Tabnine](https://www.tabnine.com/)  
  Tabnine can be a plugin to many popular code editors to help speed up delivery and keep code safe.
- [Jupyter AI](https://jupyter-ai.readthedocs.io/en/latest/)  
  Jupyter is an open-source platform for coding, and this built-in tool includes a chat interface, which can be used to generate code, fix coding errors, and ask questions about files.

#### Image- and media-generative AI tools
- [Adobe Firefly](https://www.adobe.com/sensei/generative-ai/firefly.html)  
  Built into the Adobe suite, Firefly can generate and edit images. 
- [Canva Magic Design](https://www.canva.com/magic-design/)  
  Is a tool that generates text and image content in Canva, an online graphic design tool.
- [DALL-E](https://openai.com/dall-e-3)  
  Integrated with ChatGPT, DALL-E generates images from text prompts.
- [ElevenLabs](https://elevenlabs.io/)  
  ElevenLabs is a speech AI tool that can generate spoken voice-over audio from text in different languages.
- [Google Ads](https://ads.google.com/home/campaigns/ai-powered-ad-solutions/)  
  Google Ads helps businesses create and manage digital advertising campaigns. It features AI integration to help generate ad content and boost performance.
- [Midjourney](https://www.midjourney.com/home)  
  Integrated into Discord, Midjourney can generate images from text prompts.
- [Runway](https://runwayml.com/)  
  Runway can generate a new video from a text prompt or edit an existing video’s style or focus area, and remove people or other elements.

### Notes
- Human-in-the-loop approach  
  A combination of machine and human intelligence to train, use, verify, and refine Al models.
- Knowledge cutoff  
  The concept that an Al model is trained at a specific point in time, so it doesn't have any knowledge of events or information after that date.
- At the heart of whatever the model is, is a person who is training it, who is evaluating it, who is applying more data to it.
- Assess whether to apply generative Al to a task
  - Is the task generative?
  - Can the task be iterated on to achieve the best outcome?  
    (Can you refine your prompt to improve your AI generative output?)
  - Are there resources to provide adequate human oversight?
- Large language model (LLM)  
  An Al model that is trained on large amounts of text to identify patterns between words, concepts, and phrases so that it can generate responses to prompts.
- Hallucination  
  AI outputs that are not true.
- Factors that can contribute to hallucinations
  - Quality of an LLM's training data
  - Phrasing of the prompt
  - Method an LLM uses

## Module 3
- Pro Tips
  - When you've arrived at an effective prompt for a particular task, save it! You can use your most effective prompts as templates for different use cases and needs. This can help you replicate successful AI-output consistently—without starting from scratch each time.
- Critically evaluate LLM output
  - Is the output accurate?
  - Is the output unbiased?
  - Does the output include sufficient information?
  - Is the output relevant to my project or task?
  - Is the output consistent if I use the same prompt multiple times?

- Few-shot prompting (少样本提示)
  - Provides 2 or more examples to help AI learn the pattern before responding.
  - Example
    - Prompt:  
      >"Classify the sentiment of the following sentences as Positive, Negative, or Neutral.  
      Example 1: 'I love this product! It works perfectly.' → Positive  
      Example 2: 'The service was terrible; I had to wait an hour.' → Negative  
      Example 3: 'It's okay, nothing special.' → Neutral  
      Now classify this sentence: 'The food was great, but the service was slow.'"
    - AI Output:  
      >"Neutral"
  - Zero-shot prompting : where no examples are given

- Chain-of-thought (CoT) prompting : 思路链提示 / AIが推論の過程をステップごとに説明しながら回答を導く手法
  - A prompting technique that involves requesting a large language model to explain its reasoning processes.
  - It asks an AI tool to trace a path through the reasoning it applied to generate its output step by step, from input to output.
  - Example
    - Prompt: Solve the following math problem step by step: "If a train travels at 60 km/h for 2.5 hours, how far does it go?"
    - AI Output:
      - Speed = 60 km/h
      - Time = 2.5 hours
      - Distance = Speed × Time = 60 × 2.5 = 150 km
      - Final Answer: 150 km
- Prompt chaining : 提示链 / プロンプト・チェイニング: AIの出力を次のプロンプトの入力として利用し、段階的により良い回答を得るテクニック
  - A technique where the output of one prompt is used as the input for another, allowing for a more structured, multi-step process. 
  - Steps
    - Task analysis. Start by breaking down your complex task into logical steps.
    - Initial prompting. Craft a prompt that effectively addresses the first step.
    - Input/output flow. Use the output from one prompt as input for the next, iterating along the way, until you complete the task.
  - Example : Text Summarization with Refinement
    - Step1: Generate a summary of a long article
      - Prompt1: "Summarize the following article in 200 words:  
                 (Insert long article here)"*
      - AI Output1:  
        "The article discusses the impact of climate change on global agriculture, highlighting rising temperatures, changing rainfall patterns, and increased extreme weather events. Farmers are adapting with new technologies and sustainable practices. Governments and organizations are investing in mitigation strategies to secure food production for future generations." 
    - Step2: Further condense the summary into 50 words
      - Prompt2: "Condense the following summary into just 50 words:  
                  (Insert the 200-word summary from Step 1)"
      - AI Output2:   
        Climate change disrupts agriculture with rising temperatures and extreme weather. Farmers adopt new technologies, and governments invest in solutions to secure future food production." 
    - Step3: Generate a catchy headline based on the summary
      - Prompt3: "Create a compelling headline for this summary:
                 (Insert 50-word summary from Step 2)"*
      - AI Output3:  
        "How Climate Change is Reshaping the Future of Farming"

## Module 4
- Responsible Al  
  The principle of developing and using Al ethically, with the intent of benefiting people and society while avoiding harm.
- Allocative harm (分配伤害)  
  Wrongdoing that occurs when an Al system's use or behavior withholds opportunities, resources, or information in domains that affect a person's well-being.
- Quality-of-service harm (服务质量伤害)  
  A circumstance in which Al tools do not perform as well for certain groups of people based on their identity.
- Representational harm (代表性伤害)   
  An Al tool's reinforcement of the subordination of social groups based on their identities.
- Social system harm (社会系统危害)  
  Macro-level societal effects that amplify existing class, power, or privilege disparities, or cause physical harm, as a result of the development or use of Al tools.
- Deepfakes  
  Al-generated fake photos or videos of real people saying or doing things that they did not do.
- Interpersonal harm (人际伤害)  
  The use of technology to create a disadvantage to certain people that negatively affects their relationships with others or causes a loss of one's sense of self and agency.
- Being aware of potential harm and negative outcomes is a first step to using Al responsibly.
- Privacy  
  The right for a user to have control over how their personal information and data are collected, stored, and used.
- Security  
  The act of safeguarding personal information and private data, and ensuring that the system is secure by preventing unauthorized access.
- Measures to protect privacy and security
  - Be aware of an Al tool's terms of use or service, privacy policy, and any associated risks.
  - Don't input personal or confidential information.
  - Stay up-to-date on the latest tools.

- Checklist for using AI responsibly
  - Review AI outputs
    - Look for sources using a search engine.
    - Prompt the AI to provide references so that you can determine where it might’ve gotten the information.
    - If possible, ask an expert to confirm whether the output is true.
  - Disclose your use of AI
    - Tell your audience and anyone it might affect that you’ve used or are using AI. 
    - Explain what type of tool you used, describe your intention, provide an overview of your use of AI, and offer any other information that could help your audience evaluate potential risks.
    - Don’t copy and paste outputs generated by AI and pass them off as your own.
  - Evaluate all content before you share it 
    - Fact check content accuracy using search engines. 
    - Before sharing, ask yourself: Can I correct this if it's wrong? If not, don't share.
    - Remember the steps to SHARE
      - **Source** your content from credible and official sources.
      - **Headlines** don't always tell the full story, so read full articles before you share.
      - **Analyze** the facts presented to determine everything you're reading is true.
      - *Retouched** photos and videos might be present in the content you want to share, so be cautious about misleading imagery.
      - **Errors** may be present in the content you're sharing and the information is more likely to be false if it’s riddled with typos and errors.
    - Consider the privacy and security implications of using AI
      - Input only essential information; avoid unnecessary, confidential, or private details to protect security.
      - Review tool documentation, including privacy safeguards, for guidance.
    - Consider the effects of using AI
      - If I use AI for this particular task, will it hurt anyone around me? 
      - Does it reinforce or uphold biases that may cause damage to any groups of people?

## Module 5
- AI tools are a fantastic way to improve your professional growth and development.
- [Google AI Studio](https://aistudio.google.com/prompts/new_chat)
- Leverage Al in your work
  - Examine the tasks you do on a typical day
  - Analyze your work process as a whole
  - Address challenges in your work process



# [Google AI Essentials用語集]([https://www.coursera.org/learn/google-ai-essentials/resources/A68dK])
- A
  - 人工知能（AI）：一般的に人間の知能に関連する認知タスクをこなすことができるコンピュータ・プログラム。
  - AIの拡張： AIを使用して、作業をより簡単にしたり、品質を向上させたりして、作業成果物を改善するプロセス。
  - AIの自動化：ユーザーが何もしなくてもAIがタスクを遂行するプロセス。
  - AIモデル： パターンを認識し、特定のタスクを実行するために、セットデータでトレーニングされたコンピュータ・プログラム。
  - AIツール：AIを搭載したソフトウェアで、さまざまなタスクを自動化したり、ユーザーを支援したりすることができる。
  - AIユーザー： AIユーザー：個人的または仕事上のタスクを完了するためにAIを活用する人
  - 他害行為： AIシステムの使用や行動が、人の幸福に影響を与える領域での機会、資源、情報を差し控える場合に発生する不正行為
- B
  - データバイアス：不完全なデータ、集団を正確に表していないデータ、特定の個人または集団に対する優遇措置を含むデータ
- C
  - 思考の連鎖プロンプティング（Chain-of-thought prompting）：大規模言語モデルに推論プロセスを説明するよう要求するプロンプティング技法。
  - 認知的課題：思考、理解、学習、記憶などのあらゆる精神活動
  - 会話型AIツール：テキスト要求を処理し、テキスト応答を生成する生成AIツール。
- D
  - データバイアス：システム的なエラーや偏見により、不公平または不正確な情報となり、結果として偏った出力となる状況。
  - ディープフェイク： AIが生成した、実在の人物がやってもいないことを言ったりやったりしている偽の写真や動画。
  - ドリフト：トレーニングデータに反映されない経時変化によるAIモデルの予測精度の低下。
- F
  - スモールショット・プロンプティング：プロンプトの中で2つ以上の例を提供するテクニック
- G
  - 生成AI：テキスト、画像、その他のメディアのような新しいコンテンツを生成できるAI
- H
  - 幻覚：真実ではないAIの出力
  - ヒューマン・イン・ザ・ループ・アプローチ：AIモデルを訓練、使用、検証、改良するための機械と人間の知能の組み合わせ
- I
  - 対人被害：テクノロジーを利用して特定の人々に不利益をもたらし、他者との関係に悪影響を与えたり、自己意識や主体性を失わせたりすること。
- K
  - 知識カットオフ： AIモデルは特定の時点で学習されるため、それ以降の出来事や情報についての知識は持たないという概念。
- L
  - 大規模言語モデル（LLM）：大量のテキストで学習され、単語、概念、フレーズ間のパターンを識別し、プロンプトに対する応答を生成できるようにしたAIモデル。
- M
  - 機械学習（ML）：データを分析して意思決定や予測を行うコンピュータ・プログラムを開発することに焦点を当てたAIのサブセット。
  - マルチモーダルモデル：画像、ビデオ、音声など、複数のタイプの入力を受け入れて学習できるAIモデル。
- N
  - 自然言語：人々が互いにコミュニケーションする際の話し方や書き方。
- O
  - ワンショット・プロンプティング：プロンプトの中で一つの例を提示するテクニック
  - オープンデータセット：誰でも自由に利用できるデータセット。
- P
  - プライバシー：P プライバシー：利用者が、自分の個人情報やデータがどのように収集、保存、使用されるかをコントロールする権利。
  - プロンプト：AIモデルに出力の生成方法を指示するテキスト入力。
  - プロンプトエンジニアリング：生成AIから有用な出力を引き出す効果的なプロンプトを開発すること。
- Q
  - サービスの質の低下：AIツールが、そのアイデンティティに基づいて特定のグループの人々に対してうまく機能しない状況。
- R
  - 代表的弊害：  AIツールが、アイデンティティに基づく社会集団の従属性を強化すること。
  - 責任あるAI:AIを倫理的に開発・使用し、人々や社会に利益をもたらすと同時に、危害を回避するという原則。
- S
  - セキュリティ： 個人情報や限定公開データを保護し、不正アクセスを防止してシステムの安全性を確保すること。
  - 社会システムへの害： AIツールの開発や利用の結果、既存の階級、権力、特権の格差を増幅させたり、身体的危害を引き起こしたりするマクロレベルの社会的影響。
  - システム的偏見：特定の結果や集団に有利または不利な制度が支持する傾向
- T
  - トレーニングセット：AIを教えるために使用されるデータの集まり
  - 透明性： AIツールは、それがどのように動作するのか、なぜ特定の出力を行ったのか、どのような要因がその出力に寄与したのかについての洞察を提供すべきであるという考え方。

# References
- [PAIR Explorables](https://pair.withgoogle.com/explorables/)
  - [What Have Language Models Learned?](https://pair.withgoogle.com/explorables/fill-in-the-blank/) a

# Next Courses
- [Google Prompting Essentials](https://www.coursera.org/learn/google-prompting-essentials)
