---
layout: post
title: Chapter 20 Software Development Security
subtitle: 
cover-img: [/assets/img/cover/security1.jpg, /assets/img/cover/security2.jpg, /assets/img/cover/security3.jpg]
thumbnail-img: https://i.imgur.com/Se6UFV3.png
share-img:
tags: [CISSP]
categories: [Security, Study]
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

Software Assurance Maturity Model
![file](https://i.imgur.com/1w1NpnR.png)

