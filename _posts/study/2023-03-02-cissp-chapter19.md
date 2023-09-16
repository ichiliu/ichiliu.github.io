---
layout: post
title: Chapter 19 Investigations and Ethics
permalink: /study/chapter-19-investigations-and-ethics
subtitle: 
cover-img: [/assets/img/cover/study1.jpg, /assets/img/cover/study2.jpg, /assets/img/cover/study3.jpg]
thumbnail-img: https://i.imgur.com/Se6UFV3.png
share-img:
tags: [CISSP]
categories: [Study]
---

# Chapter 19 Investigations and Ethics
## Investigations
### Investigation Types
#### Administrative Investigations (行政调查)
#### Criminal Investigations
Criminal Investigations must follow strict evidence collection and preservation processes.
#### Civil Investigations
Most civil cases do not follow the beyond a reasonable doubt standard of proof. Instead, they use the weaker preponderance of the evidence standard.
#### Regulatory Investigations (监管调查)

#### Industry Standards
Investigations into violations of industry standards should be treated in a similar manner as regulatory investigations (e.g. PCI DSS)

#### Electronic Discovery
EDRM (Electronic Discovery Reference Model) : A standard process for conducting eDiscovery
1. Information Governance
1. Identification
1. Preservation
1. Collectionj
1. Precessing
1. Review
1. Analysis
1. Production
1. Presentation

#### Evidence
NIST SP800-86, Guide to Integrating Forensic Techniques into Incident Response

##### Admissible Evidence (可接受的证据)
Three basic requirements
1. Be relevant to determining a fact (与确定事实相关)
1. The fact that the evidence seeks to determine must be material (related) to the case (事实必须对案件具有重要意义)
1. Must be competent, meaning it must have been obtained legally (证据必须是合法获得的)

##### Types of Evidence
Four major categories
1. Real evidence (真实证据)  
   Object evidence 
1. Documentary evidence (书证)
   1. The best evidence rule : the original document must be introduced (secondary evidence will not be accepted)
   1. The parol evidence rule (口头证据规则)
1. Testimonial evidence (证言)
1. Domonstrative evidence (证明性证据)

##### Artifacts, Evidence Collection, and Forensic Procedures (文物、证据收集和法医程序)
Six principles:
  1. All of the general forensic and procedural principles must be applied.
  1. Actions taken should not change that evidence.
  1. The person to access original digital evidence should be trained.
  1. All activity relating to the operating of digital evidence must be fully documented, preserved and available for review.
  1. An individual is responsible for all actions while the digital evidence is in their possession.
  1. Any agency that is responsible for the operations of digital evidence must be compliance with these principles.

Types of analysis:
  1. Media Analysis
  1. In-Memory Analysis
  1. Network Analysis  
    Forensic technicians should use a SPAN port on a switch (which mirrors data sent to one or more other ports for analysis) or a network tap.
  1. Software Analysis
  1. Hardware/Embedded Device Analysis

#### Investigation Process
##### Gathering Evidence
Methods
1. The person who owns the evidence could voluntarily surrender it or grant consent to a search.
1. Get a court to issue a subpoena, or court order, that compels an individual or organization to surrender evidence.
1. Plain view doctrine (平视主义)
1. Search warrant (捜査令）
1. A law enforcement officer may collect evidence when exigent circumstances exist.

##### Calling in Law Enforcement
1. Never conduct your investigation on an actual system that was compromised.
1. Never attempt to “hack back” and avenge a crime.
1. If in doubt, call in expert assistance.

### Interviewing Individuals (采访个人)
* Interview
  * Seek only to gather information to assist with your investigation.
  * Always consult an attorney before conducting any interviews.
* Interrogation (审讯)
  Suspect the person of involvement in a crime and intend to use the information gathered in court. 

### Data Integrity and Retention (数据完整性和保留)
One technique is to implement remote logging, where all systems on the network send their log records to a centralized log server that is locked down against attack and does not allow for the modification of data.

### Reporting and Docuamenting Investigations

## Major Categories of Computer Crime
Types of computer crimes
1. Military and intelligence attacks(军事和情报攻击)
1. Business attacks (商业攻击)
1. Financial attacks (金融攻击)
1. Terrorist attacks (恐怖袭击)
1. Grudge ([ɡrʌdʒ]) attacks (怨恨攻击)
1. Thrill ( [θrɪl]) attacks (刺激攻击)
1. Hacktivist attacks (黑客攻击)

### Military and intelligence
#### Advanced Persistent Threat (APT) APT攻撃

#### Business Attacks
* Business attacks focus on illegally jeopardizing the confidentiality, integrity, or availability of information and systems operated by a business.
* The gathering of a competitor's confidential intellectual property, also called corporate espionage or industrial espionage, is not a new phenomenon.

#### Financial Attacks
* To unlawfully obtain money or services.
* DDoS

### Terrorist Attacks
* The purpose is to disrupt normal life and instill fear (灌输恐惧).

### Grudge Attacks
* The motivation behind a grudge attack is usually a feeling of resentment.
* Take extreme care when a person with known cracking ability leaves your company.
* Diligent monitoring and assessing systems for vulnerabilities is the best protection.

### Thrill Attacks
* Script kiddies or script bunnies.

### Hacktivist
Hacker + Activist = 黑客行为主义者

## Ethics ([ˈɛθiks]) 伦理
### Organizational Code of Ethics
The U.S. government has a Code of Ethics for Government Service that is written into federal law.

### (ISC)2 Code of Ethics
#### Code of Ethics Preamble
#### Code of Ethics Canons
#### Code of Ethics Complaints (投诉道德规范)

#### Ethics and the Internet
##### RFC 1087
Ten Commandments of Computer Ethics (计算机伦理十诫)
1. Thou shalt not use a computer to harm other people. 
1. Thou shalt not interfere with other people's computer work. 
1. Thou shalt not snoop around in other people's computer files. 
1. Thou shalt not use a computer to steal. 
1. Thou shalt not use a computer to bear false witness(你不应该用电脑来做伪证) 
1. Thou shalt not copy proprietary software for which you have not paid. 
1. Thou shalt not use other people's computer resources without authorization or proper compensation. 
1. Thou shalt not appropriate other people's intellectual output (你不应盗用他人的智力成果)
1. Thou shalt think about the social consequences of the program you are writing or the system you are designing. 
   (你应该考虑你正在编写的程序或你正在设计的系统的社会后果)
1. Thou shalt always use a computer in ways that ensure consideration and respect for your fellow humans.
   (你应该始终以确保尊重和尊重你的人类同胞的方式使用电脑)

##### Code of Fair Information Practices (公平信息实践守则)
1. There must be no personal data record-keeping systems whose very existence is secret. 
   (绝不能存在秘密存在的个人数据记录保存系统)
1. There must be a way for a person to find out what information about the person is in a record and how it is used. 
   (必须有一种方法可以让一个人找出记录中有关该人的哪些信息以及这些信息的使用方式)
1. There must be a way for a person to prevent information about the person that was obtained for one purpose from being used or made available for other purposes without the person's consent. 
   (一个人必须有办法防止为某一目的获得的有关该人的信息在未经该人同意的情况下被使用或用于其他目的)
1. There must be a way for a person to correct or amend a record of identifiable information about the person.
   (一个人必须有一种方法来更正或修改有关该人的可识别信息的记录)
1. Any organization creating, maintaining, using, or disseminating records of identifiable personal data must assure the reliability of the data for their intended use and must take precautions to prevent misuses of the data.
   (任何创建、维护、使用或传播可识别个人数据记录的组织都必须确保数据用于其预期用途的可靠性，并且必须采取预防措施以防止滥用数据)

## Summary
## Exam Essentials
* Know the definition of computer crime.
* Be able to list and explain the six categories of computer crimes.
* Know the importance of collecting evidence.
* Understand the eDiscovery process.
* Know how to investigate intrusions and how to gather sufficient artifacts from the equipment, software, and data.
* Know the basic alternatives for confiscating evidence and when each one is appropriate.
* Know the importance of retaining investigatory data.Know the basic requirements for evidence to be admissible in a court of law.
* Know the basic requirements for evidence to be admissible in a court of law.
* Explain the various types of evidence that may be used in a criminal or civil trial.
* Understand the importance of ethics to security personnel.
* Know the (ISC)2 Code of Ethics and RFC 1087, Ethics and the Internet.

## Review Questions
```
01 C
02 B
03 A
04 A C D
05 B
06 D
07 A B C -> A C
08 C
09 D
10 C
11 C
12 D -> B
13 A
14 D
15 B
16 A
17 D
18 D
19 B
20 B
```
正解率：17 / 20 = 85%
