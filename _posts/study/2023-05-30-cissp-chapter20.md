---
layout: post
title: Chapter 20 Software Development Security
subtitle: 
cover-img: [/assets/img/cover/study1.jpg, /assets/img/cover/study2.jpg, /assets/img/cover/study3.jpg]
thumbnail-img: https://i.imgur.com/Se6UFV3.png
share-img:
tags: [CISSP]
categories: [Study]
---

# Chatpter 20 Software Development Security

## Introducing Systems Development Controls (引入系统开发控制)
### Software Development
It's much easier to build security into a system than it is to add security to an existing system. 
### Programming Languages
+ Two options are available to execute the programs: compilation and interpretation.
+ Reverse engineering may be able to reverse the compilation process with the assistance of tools known as decompilers and disassemblers.
+ Decompliers(反编译器) 
  Take binary executables and convert them back into source code form.
+ Disassemblers(返回便器) 
  Convert back into machine-readable assembly language.
+ Compiled code
  + Advantages  
    Less prone to manipulation by a 3rd party.
  + Disadvantages
    + Easier for a malicious (or unskilled) programmer to embed backdoors and other security flaws in the code.
    + Escape detection
+ Compiled code
  + Advantages  
    Less prone to the undetected insertion of malicious code by the original programmer.
  + Disadvantages  
    The programmer's original instructions is easy to be modified.

### Libraries
### Development Toolsets
eg.IDEs
### Object-Oriented Programming (OOP)
### Assurance
### Avoiding and Mitigating System Failure
+ Input Validation
  + Escaping input  
    Performed by replacing occurrences of sensitive characters with alternative code that will render the same to the end user but will not be executed by the system.
  + In most organizations, security professionals come from a system administration background and don't have professional experience in software development.
+ Authentication and Session Management
  + Users are properly authenticated
  + They perform only authorized actions
  + More secure to make use of existing, hardened authentication system than to try to develop an authentication system.
  + Session tokens should expire after a specified period of time and require that the use reauthenticate.
+ Error Handling
  + Dangerous information
    + The stucture of database tables
    + The addresses of internal servers.
  + SHOULD
    + Disable detailed error messages (aka. debugging mode) on any servers/apps that are publicly accessible.
+ Loggin
  + Detailed logging of errors and other security events SHOULD be sent to a centralized log repository.
  + OWASP (the Open Web Application Security Project) Secure Coding Proctices suggest logging the following events:
    + Input validation failures
    + Authentication attempts, especially failures
    + Access control failures
    + Tampering attempts (企图篡改)
    + Use of invalid or expired session tokens
    + Exceptions raised by the operating system of applications
    + Use of administrative privileges
    + TLS failures
    + Cryptographic errors
+ Fail-Secure and Fail-Open (故障保护和故障打开)
  + The fail-secure failure state puts the system into a high level of security, until its restored to normal operation.
  + The fail-open state allows users to bypass failed security controls, erring on the side of permissiveness.
  + Fail-secure is the appropriate failure state
    + Software should revert to a fail-secure condition
    + infamous Blud Screen of Death (BSOD) is an example of fail-secure.
    + Once a fail-secure operation occurs, it shold remain in a fail-secure state of to automatically reboot the system.

### Systems Development Lifecycle
Security is most effective if it is planned and managed throughout the lifecycle of a system/app.
+ Conceptual definition (概念定义) ビジネスコンセプト
Is a very high-level statement of purpose and should not be longer than one or two paragraphs.
+ Functional requirements determination (功能需求确定) 要件定義/外部設計
  + Input(s)
  + Behavior
  + Output(s)
+ Control specifications development (控制规范开发) 非機能要件
Designing security into a system is not a onetime process and it must be done proactively.
+ Design review (设计审查) 設計レビュー
The design review meeting should include security professionals who can validate that the proposed design meets the control specifications developed in the previous phase.
+ Coding (编码) 実装
Developers should use the secure software coding principles discussed in this chapter.
+ Code review walk-through (代码评审演练) コードレビュー
+ System test review (系统测试审查)
  + Regression testing
  + UAT (User acceptance testing) 
+ Maintenance and change management (维护和变更管理)

### Lifecycle Models
SDLC (Software Development Liftcycle)

CMM (Capability Maturity Model) 能力成熟度模型

+ Waterfall Model (1970)  
The iterative lifecycle model with feedback loop
  + System Requirements ↓
    + ↑ Software Requirements ↓
      + ↑ Preliminary Design ↓
        + ↑ Detailed Design ↓
          + ↑ Code and Debug ↓
            + ↑ Testing ↓
              + ↑ Operation and Maintenance

+ Spiral Model (1988)
+ Agile Software Development (mid-1990s)
  + Types
    + Scrum
    + Kanban 看板
    + Rapid Application Development (RAD) 快速应用程序开发
    + Agile Unified Process (AUP) 敏捷统一流程
    + Dynamic Systems Development Model (DSDM) 动态系统开发模型
    + Extreme Programming (XP) 极限编程
  + Integrated Product Teams (IPT) 集成产品团队

### Capability Maturity Model
Software Capability Maturity Model (abbreviated as SW-CMM, CMM, or SCMM)  
The stages of the SW-CMM:
+ Level 1:Initial
Little or no defined SW development process.
+ Level 2:Repeatable
  + Basic lifecycle management processes are introduced.
  + Reuse of code.
+ Level 3:Defined
Operate according to a set of formal, documented SW development processes.
+ Level 4:Managed
  + Quantitative Process Management
  + Software Quality Management
+ Level 5:Optimizing
  + Defect Prevention
  + Technology Change Management
  + Process Change Management.

### Software Assurance Maturity Model (SAMM)
An open source project maintained by the Open Web Application Security Project (OWASP).  
SAMM divides the SW development process into five business functions:

1. Governance
1. Design
1. Implementation
1. Verification
1. Operations

Software Assurance Maturity Model ![file](https://i.imgur.com/1w1NpnR.png))

### IDEAL Model
Five phases:
1. Initiating
1. Diagnosing (诊断)
1. Establishing
1. Acting
1. Learning

|IDEAL Model|SW-CMM|
|:-|:-|
|Initiating|Initial|
|Diagnosing|Repeatable|
|Establishing|Defined|
|Acting|Managed|
|Learning|Optimizing|

## Gantt Charts and PERT
Program Evaluation Review Technique (PERT) ぱーと

## Change and Configuration Management
Three basic components:
1. Request Control
1. Change Control
1. Release Control

SCM (Software Configuration Management) has four main components:
1. Configuration Identification
1. Configuration Control
1. Configuration Status Accounting
1. Configuration Audit

## The DevOps Approach
DevSecOps refer to the integration of development, security, and operations.

### Application Programming Interfaces (APIs)
### Software Testing
+ The best time to address testing is as the modules are designed.
  + resonableness test / 合理性テスト / 合理性检验
+ Should assign the testing of your software to someone other than the programmer(s) who developed the code to avoid a conflict of interest and assure a more secure and functional finished product.
+ Three different philosophies
  + White-Box Testing  
    -> That the testers have access to the source code.
  + Black-Box Testing  
    -> Fincal acceptance testing is a common example.
  + Gray-Box Testing  
    -> Combines the two approaches and is popular for software validation.

### Code Repositories
+ Act as a central storage point for developers to place their source code.
+ Provide version control, bug tracking, web hosting, release management, and communications functions.

#### Sensitive Information and Code Repositories
Be careful to avoid placing API keys, passwords, internal server names, database names, and other sensitive information in code repositories.

### Service Level Agressments (SLA / 服务等级协定) 
+ System uptime (as a percentage of overall operating time) / 系统正常运行时间 / システムの通常の稼働時間
+ Maximum consecutive downtime (in seconds/minutes/and so on) / 最大连续停机时间 / 最大連続ダウンタイム
+ Peak load / 峰值负荷 / ピーク負荷
+ Average load / 平均负荷 / 平均負荷
+ Responsibility for diagnostics / 诊断责任 / 診断責任
+ Failover time (if redundancy is in place) / 故障切换时间 / フェイルオーバー時間

### Third-Party Software Acquisition / 第三方软件收购
+ Commercial off-the-shelf (COTS / 商业现成)

## Establishing Databases and Data Warehousing (建立数据库和数据仓库)
### Database Management System Architecture
Two important DBMS architectures:
+ hierarchical (/ˌhaɪəˈrɑːrkɪkl/ 层次结构)
+ distributed (分布式结构)

#### Hierarchical and Distributed Databases
+ Relational Datebases
  + Object-Oriented Programming and Databases
    + Each customer would have their own record, or tuple, represented by a row in the table.
      + Cardinality
        ->The number of rows in the relation
      + Degree
        ->The number of columns
  + Three types of keys
    + Candidate Keys (候选键 / 候補キー)
    + Primary Keys
      A primary key is selected from the set of candidate keys for a table to be used to uniquely identify the records in a table.
    + Alternate Keys (备用键 / 代替キー)
      Any candidate key that is not selected as the primary key is referred to as an alternate key.
    + Foreign Keys (外键 / 外部キー)
      A foreign key is used to enforce relationships between two tables, also known as
      referential integrity (引用完整性 / 参照整合性)

  + Database Normalization (数据库规范化 / データベースの正規化)
    + The three most common are first normal form (1NF), second normal form (2NF), and third normal form (3NF).
    + SQL itself is divided into two distinct components
      + Data Definition Language (DDL)
        Allows for the creation and modification of the database's structure (known as the schema)
      + Data Manipulation Language (DML)
        Allows users to interact with the data contained within that schema.

#### Database Transactions
Relational databases support the explicit (显式) and implicit (隐式) use of transactions.

Relational database transactions have four required characteristics:
+ ACID model
  + Atomicity (原子性 / 原子性)
    Database transactions must be atomic—that is, they must be an “all-or-nothing” affair. If any part of the transaction fails, the entire transaction must be rolled back as if it never occurred.
  + Consistency (一致性 / 一貫性)
    No other transaction should ever be able to use any inconsistent data that might be generated during the execution of another transaction.
  + Isolation (隔离性 / 分離性)
    The isolation principle requires that transactions operate separately from each other.
  + Durability (持久性 / 耐久性)
    Once they are committed to the database, they must be preserved.

#### Security for Multilevel Databases
Way to implement multilevel security in a database:
- Keep data with different security requirements separate.
- Through the use of database views.
  - Views are stored in the database as SQL commands rather than as tables of data.

### Concurrency (并发性 / 並行性)
Databases that fail to implement concurrency correctly may suffer from the following issues:
- Lost Updates
- Dirty Reads

```
User A : ---lock---update---unlock--------xxxxxxxxxxxxxxxxxxxxxx---  
User B : ---xxxxxxxxxxxxxxxxxxxxxx-read---lock---update---unlock---
```

### Aggregation (聚合)
Access aggregation attacks (接入聚合攻击):
- Cyberattacks where an attacker combines multiple low-impact or low-privileged accesses to gain higher privileges or broader access within a system or network.

### Inference (推理)
Inference attacks (推理攻击):
- Inference attacks involve combining several pieces of nonsensitive information to gain access to information that should be classified at a higher level.
- The best defense against inference attacks is to maintain constant vigilance over the permissions granted to individual users.  

### Other Security Mechanisms (其他安全机制)
The document discusses various security mechanisms that administrators can deploy when using a Database Management System (DBMS) to enhance security.
- Semantic integrity
- Time and date stamps
- Granular object control
- Context-dependent access control
- Database partitioning
- Polyinstantiation
- The use of false or misleading data (noise and perturbation)
  >想象一个包含患者记录的医疗数据库。为了保护敏感信息并遵守隐私规定，管理员决定添加噪声和扰动。对于每位患者的年龄，会加入一个小范围内（±2岁）的随机值。例如，患者的实际年龄是35岁，但在数据库中记录为33岁或37岁。这种有意的不一致有助于匿名化数据，同时保持其用于分析和研究的实用性。这使得潜在攻击者更难以准确获取详细信息，增强了隐私和安全性。

### Open Database Connectivity (ODBC / 开放数据库连接)
ODBC as the interface between applications and a back-end database system:
![file](https://i.imgur.com/llnDms6.png)

### NoSQL
Many different types of NoSQL database:
- Key/value (Be useful for high-speed applications and very large datasets)
- Graph databases (Be useful for representing any type of network)
- Document (Be similar to key/value stores, Common document types used in document stores include XML and JSON)

## Storage Threats
- First, the threat of illegitimate access to storage resources exists no matter what type of storage is in use.
- Covert channel attacks pose the second primary threat against data storage resources.

## Understanding Knowledge-Based Systems
### Expert Systems
Two main components: 
- The knowledge base  
  Contains the rules known by an expert system (in a series of “if/then” statements)
  - ex) If the hurricane is a Category 4 storm or higher, then flood waters normally reach a height of 20 feet above sea level.
- The inference engine  
  Analyzes information in the knowledge base to arrive at the appropriate decision. 

### Machine Learning
The core approach of machine learning is to allow the computer to analyze and learn directly from data, developing and updating models of activity.

Two major categories:
- Supervised learning techniques (监督学习技术)
- Unsupervised learning techniques(无监督学习技术)

### Neural Networks (神经网络)
Neural networks are an extension of machine learning techniques and are also commonly referred to as deep learning or cognitive systems.

# Summary
# Exam Essentials
- Explain the basic architecture of a relational database management system (RDBMS).
- Explain how expert systems, machine learning, and neural networks function.
- Understand the models of systems development.
- Explain the Scrum approach to Agile software development.
- Describe software development maturity models.
- Understand the importance of change and configuration management.
- Understand the importance of testing.
- Explain the role of DevOps and DevSecOps in the modern enterprise.
- Know the role of different coding tools in software development ecosystems.
- Explain the impact of acquired software on the organization.

# Review Questions
```
1 A
2 B
3 C
4 A → C
5 B
6 B
7 C
8 D
9 C
10 C → D
11 C
12 C → D
13 B
14 A
15 A
16 D → C
17 A → D
18 D → C
19 B
20 B
```
正解率：14 / 20 = 70%
