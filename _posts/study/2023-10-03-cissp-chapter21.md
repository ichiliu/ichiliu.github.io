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
  * [Time of Check to Time of Use (检查时间到使用时间)](#time-of-check-to-time-of-use-检查时间到使用时间)

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
- User and entity behavior analytics (UEBA) packages pay particular attention to user-based activity on endpoints and other devices.
- UEBA tools differ from EDR capabilities in that UEBA has an analytic focus on the user, whereas EDR has an analytic focus on the endpoint.

# Application Attacks
## Buffer Overflows (缓冲区溢出)
Buffer overflow vulnerabilities exist when a developer does not properly validate user input to ensure that it is of an appropriate size.

## Time of Check to Time of Use (检查时间到使用时间)






