---
layout: post
title: Building, Operating and Maintaining SOC
subtitle: 
cover-img: [/assets/img/cover/security1.jpg, /assets/img/cover/security2.jpg, /assets/img/cover/security3.jpg]
thumbnail-img: https://i.imgur.com/NvfkABU.png
share-img:
tags: [SOC, Books]
categories: [Security]
---

This blog is my reading notes on 'Security Operations Center: Building, Operating, and Maintaining Your SOC', authored by Joey Muniz, Gary McIntyre, Nadhem AlFardan.

<!-- vim-markdown-toc GFM -->

* [Chapter 1. Introduction to Security Operations and the SOC](#chapter-1-introduction-to-security-operations-and-the-soc)
  * [Cybersecurity Challenges](#cybersecurity-challenges)
  * [Threat Landscape](#threat-landscape)
  * [Business Challenges](#business-challenges)
  * [The Cloud](#the-cloud)
  * [Compliance](#compliance)
  * [Privacy and Data Protection](#privacy-and-data-protection)
  * [Introduction to Information Assurance](#introduction-to-information-assurance)
  * [Introduction to Risk Management](#introduction-to-risk-management)
  * [Information Security Incident Response](#information-security-incident-response)
    * [Incident Detection](#incident-detection)
    * [Incident Triage](#incident-triage)
    * [Incident Categories](#incident-categories)
    * [Incident Severity](#incident-severity)
    * [Incident Resolution (事件解决)](#incident-resolution-事件解决)
    * [Incident Closure](#incident-closure)
    * [Post-Incident](#post-incident)
  * [SOC Generations](#soc-generations)
    * [First-Generation SOC](#first-generation-soc)
    * [Second-Generation SOC](#second-generation-soc)
    * [Third-Generation SOC](#third-generation-soc)
    * [Fourth-Generation SOC](#fourth-generation-soc)
  * [Characteristics of an Effective SOC](#characteristics-of-an-effective-soc)
  * [Introduction to Maturity Models](#introduction-to-maturity-models)
  * [Applying Maturity Models to SOC](#applying-maturity-models-to-soc)
  * [Phases of Building a SOC](#phases-of-building-a-soc)
  * [Challenges and Obstacles](#challenges-and-obstacles)
* [Chapter 2. Overview of SOC Technologies](#chapter-2-overview-of-soc-technologies)
  * [Data Collection and Analysis](#data-collection-and-analysis)
    * [Data Sources](#data-sources)
    * [Data Collection](#data-collection)
  * [The Syslog Protocol](#the-syslog-protocol)
  * [Logging Recommendations](#logging-recommendations)
  * [Logging Infrastructure](#logging-infrastructure)
  * [Telemetry Data: Network Flows (遥测数据：网络流量)](#telemetry-data-network-flows-遥测数据网络流量)
  * [Telemetry Data: Packet Capture>](#telemetry-data-packet-capture)
  * [Parsing and Normalization / 解析和标准化](#parsing-and-normalization--解析和标准化)
  * [Security Analysis (安全分析)](#security-analysis-安全分析)
  * [Alternatives to Rule-Based Correlation](#alternatives-to-rule-based-correlation)
  * [Data Enrichment](#data-enrichment)

<!-- vim-markdown-toc -->

# Chapter 1. Introduction to Security Operations and the SOC 
 “It’s better to light a candle than curse the darkness.”

## Cybersecurity Challenges
As the previous CEO of Cisco Systems, John Chambers, said, “There are two types of companies: those who have been hacked and those who don’t yet know they have been hacked.”

**Models for defending cyberthreats (Used by defense teams)**

- The OODA Loop (Four Steps)
![file](https://i.imgur.com/2zN40R1.png)
  - **Observe**: Monitor, collect, and store data from various points in your network as the first step in the OODA Loop.
  - **Orient**: Analyze collected data in search of suspicious activities. This usually involves the use of tools to process and analyze incoming and stored data.
  - **Decide**: Determine an action course based on the results of the analysis phase and the experience you have gained from previous loop iterations.
  - **Act-**: Execute the action course you determined in the preceding step.

**Models for attacking (Used by attackers)**

- The Cyber Kill Chain
![file](https://i.imgur.com/AHLKlzs.png)
  - **Phase 1, Reconnaissance (侦察)**
  - **Phase 2, Weaponization (武器化)**
  - **Phase 3, Delivery (配送)**
  - **Phase 4, Exploitation (漏洞利用)**
  - **Phase 5, Installation (安装)**
  - **Phase 6, Command and Control (指挥与控制)**
  - **Phase 7, Actions and Objectives (行动和目标)**

## Threat Landscape
The attack and defense innovations continue to be a cat-and-mouse game, meaning both sides will develop a technique that eventually the other side will adapt to.

Tor browser : https://www.torproject.org/download/download

## Business Challenges
BYOD : Bring Your Own Device 

IoE : Internet of Everything
![file](https://i.imgur.com/nLeskQP.png)
Networked Connection of People, Process, Data, Things (Source: Cisco Internet of Everything Repor

M2M : Machine-to-Machine
P2M : Person-to-Machine
P2P : Person-to-Person

## The Cloud
## Compliance
Examples of security standards:
- The Payment Card Industry Data Security Standard (PCI DSS)
- ISO/IEC 27001:2013 (ISMS)

Failure to comply with standards may lead to large fines or jail time for all persons held accountable for information assurance.

## Privacy and Data Protection
Examples of country-specific laws and regulations:
- United States: US-EU Safe Harbor on Data Protection
- Germany: The Federal Data Protection Act
- Japan: The Act on the Protection of Personal Information18 (APPI) 個人情報保護法
- United Kingdom: The Data Protection Act 1998

## Introduction to Information Assurance
- Information Assurance (IA) is:  
“measures that protect and defend information and information systems by ensuring their availability, integrity, authentication, confidentiality, and non-repudiation. This includes providing for restoration of information systems by incorporating protection, detection, and reaction capabilities.”

The difference between IA and information security (in NIST 800-53):
- Information Security is  
  “the protection of information and information systems from unauthorized access, use, disclosure, disruption, modification, or destruction in order to provide confidentiality, integrity, and availability.”

IA is a superset that covers information security.

## Introduction to Risk Management
Dicisions (The output of risk assessment)
- Mitigate リスク軽減
- Transfer リスク移転
- Accept リスク受容
- Avoid リスク回避

Examples of frameworks of risk management:
- ISO/IEC 27005:2010  
  An international standard that provides guidelines and principles for Information Security Risk Management (ISRM). The standard focuses on ISMS.
- ISO/IEC 31000:2009  
  An international standard that provides principles and guidelines for effective risk management. Titled "Risk management - Principles and guidelines"
![file](https://i.imgur.com/YThClHt.png)
- NIST SP 800-39 
  Titled "Managing Information Security Risk: Organization, Mission, and Information Systems View,", provides guidelines on how to manage information security risk effectively within an organization.
- OWASP Risk Rating Methodology  
  A framework developed by OWASP to help organizations assess and prioritize security risks associated with web applications.
- DoD Risk Management Framework (RMF)  
  A standardized information security framework used by the United States Department of Defense (DoD / 美国国防部)
- Operationally Critical Threat, Asset, and Vulnerability Evaluation (OCTAVE) risk-assessment methodology  
  First developed by the Software Engineering Institute (SEI) at Carnegie Mellon University (卡内基·梅隆大学)

Simple Risk Heat Map:
![file](https://i.imgur.com/N097yEz.png)

## Information Security Incident Response
Incident Response Timeline:
![file](https://i.imgur.com/4HxbyJJ.png)

### Incident Detection
An incident is observed and reported by people or technology, and the process that handles the reporting aspects.
![file](https://i.imgur.com/aasrZ0c.png)

### Incident Triage
The initial actions taken on a detected event that is used to determine the remaining steps according to the incident response plan.

Three subphases: verification, initial classification, and assignment.

### Incident Categories
All computer security incidents should be assigned a category. 

Example for Computer Security Incident Categories:
![file](https://i.imgur.com/KmvrXiq.png)

### Incident Severity
Example for Computer Security Incident Severity Levels:
![file](https://i.imgur.com/DK8uFXu.png)

### Incident Resolution (事件解决)
The objective of this phase is to discover the root cause of the incident, while working on containing the incident at the earliest stage possible.

Example for Incident Analysis Phase Process:
![file](https://i.imgur.com/TeYdBfy.png)

The containment phase : 封じ込めフェーズ

### Incident Closure
The eradication phase : 根絶フェーズ

### Post-Incident
The “lessons-learned” phase : 教訓吸収フェーズ

## SOC Generations
The SOC: Four Generations:
![file](https://i.imgur.com/pOHlogr.png)
(估计我司只是第2世代而已...)

### First-Generation SOC
Example: Abnormal number of failed login attempts
- Logging messages would most likely be locally saved on each system
- SIEM isn't used yet

### Second-Generation SOC
- SIEM tools started to emerge (SEM tools -> SIM tools -> SIEM tools)
- Taking the multiple failed login attempts example
  - Windows systems would most likely be configured to forward logged events to a SIEM tool
  - The SIEM tool should be capable of receiving, parsing, normalizing, and correlating the different events and eventually alerting a security analyst that there have been multiple login failures.

### Third-Generation SOC
- The SOC team would handle tasks related to vulnerability management
  - Refers to the practice in which vulnerabilities are discovered and confirmed, their impact is evaluated, corrective measures are identified and executed

### Fourth-Generation SOC
Expanding threat data sources, layering different security capabilities to battle more advanced threats, and automating security to improve reaction time to incidents. 

## Characteristics of an Effective SOC
- Executive sponsorship (行政赞助)
- Governance (治理)
- Operate SOC as a program
- Collaboration
- Access to data and systems  
  At a minimum, SOC tools should receive logging messages from various systems and applications.
- Applicable processes and procedures
- Skill set and experience
- Budget

## Introduction to Maturity Models
- COBIT (the Control Objectives for Information and related Technology) MM  
  COBIT MM Scoring:
  ![file](https://i.imgur.com/8qIitGq.png)
- CMM (the Carnegie Mellon Software Engineering Institute (SEI) Capability)  
  SEI Maturity Levels:
![file](https://i.imgur.com/8MZ9RjR.png)

## Applying Maturity Models to SOC
A set of SOC-specific capabilities in three areas that could be evaluated:
- People
  - Structure / Relative SOC knowledge and experience / Training and awareness
- Process
  - Incident triage / Incident reporting / Incident analysis / Incident closure / Post-incident / Vulnerability discovery / Vulnerability remediation 
- Technology
  - Network infrastructure readiness / Events collection, correlation, and analysis / Security monitoring / Security control / Log management / Vulnerability assessment / Vulnerability tracking / Threat intelligence

## Phases of Building a SOC
Phases of Building a SOC:
![file](https://i.imgur.com/Jadgtho.png)

## Challenges and Obstacles

# Chapter 2. Overview of SOC Technologies
“If all you have is a hammer, everything looks like a nail.”—Abraham Maslow

## Data Collection and Analysis
- Generating and capturing event logs is crucial to security operation.
- The key is that the final product not provide too much or little data.
- To understand the structure of the data, parsing is required to extract the different fields of an event.

Basic Data Management Workflow:
![file](https://i.imgur.com/k7IM8eb.png)

### Data Sources
Logging messages are considered the most useful data type to acquire. 
- FW / IDPS / AntiVirus / Web Proxies / Malware analysis tools
- Routers / Wireless APs / Controllers
- OS (Win / UNIX / Linux / OS X)
- Virtual-Box, KVM, Microsoft Hyper-V, VMware ESX
- Web Server / DNS / email GW / Billing App / Voice GW / MDM
- DB
- Security Camera / Door AC Devices / Tracking System
- Supervisory control and Data Acquisition (SCADA) / Distributed control system (DCS) 

### Data Collection
- Data can be pulled from the source to the collector or pushed by the source to the collector.
- It is important to emphasize the need for time synchronization when collecting data. 

## The Syslog Protocol
- The syslog protocol, as defined in IETF RFC 5424.
- The syslog protocol supports three roles:
  - Originator: Generates syslog content to be carried in a message
  - Collector: Gathers syslog messages
  - Relay: Forwards messages, accepting messages from originators or other relays and sending them to collectors or other relays
![file](https://i.imgur.com/5OyXuVI.png)

    (Syslog Collection Design)
- Syslog uses User Datagram Protocol (UDP) with port number 514 to forward events. 
- UNIX and UNIX-like OSs support syslog through the use of an agent such as rsyslog and syslog-ng. 
- Syslog client need to configure at least the following parameters:
  - Logging destinations: The collector, relay IP addresses, or hostnames.
  - Protocol and port: Typically these are set to UDP and port 514 by default. 
  - Logging severity level: Can be a value ranging from 0 to 7.
![file](https://i.imgur.com/T7uwTra.png)
    (Logging Severity Levels)
  - Logging facility: A value between 0 and 23 that could be used to indicate the program or system that generated the message.
![file](https://i.imgur.com/QP6T6Le.png)
      (Example of Mapping Facility Values to Categories)

## Logging Recommendations
Some important best practices:
- Have a limited local logging facility, in file or memory, so that logs are not completely lost if the syslog collector is unavailable, such as in the case of network failure.
- Ensure that log rotation and retention policies are properly set.
- Restrict access to the system, assign proper files access permissions, and enable file encryption if needed.
- Read access to log files must be granted only to authorized users and processes.
- Write access to log files must be granted only to the syslog service.

## Logging Infrastructure
## Telemetry Data: Network Flows (遥测数据：网络流量)
In this text, the importance of monitoring network connections using devices like routers and switches for traffic visibility is highlighted. IP Flow Information eXport (IPFIX) is introduced as a protocol to export IP flow information. Flow-based detection in security is emphasized for identifying unusual behavior and enabling the entire network to act as a sensor, reducing the need for additional security products.

## Telemetry Data: Packet Capture>
- An example is the need for deep forensic capabilities to meeting strict regulation requirements for capturing raw network packets. 
- Network traffic can be captured and forwarded to an IDS, a deep packet inspection engine (DPI), or simply to a repository where captured packets are stored for future use.
- Two techniques to capture network packets (In the case of Ethernet):

  | | Port mirroring / 端口镜像 | Network taps / 网络分流器 |
  | :--: | :-- | :-- |
  | Description | uses network switches to mirror traffic seen on ports or VLANs to other local or remote ports | Connecting out-of-band devices in the form of network taps to monitor and capture packets from point-to-point links. 
  | Pros |A basic feature supported by most of today’s enterprise-level network switches | Without involving the active network components, making them suitable for most environments |
  | Cons |Copying packets to a remote switch can have implications on the overall performance of the network | Can't capture some traffic, such as packets that are exchanged locally within a switch |
  | Best Practice |Carefully selecting the sources and destinations for port mirroring | Generally connect them to the most important locations in your network, such as your IGW and data centers |

## Parsing and Normalization / 解析和标准化
- Data that requires further processing and analysis must be first parsed and normalized.
  - Parsing : the process of taking raw input in string format and traversing the different fields based on a predefined schema (解析是指获取字符串格式的原始输入并根据预定义的模式遍历不同字段的过程).
  - Normalization : the process of allowing similar extracted events from multiple sources to be uniformly stored or consumed by subsequence processing steps (标准化是指允许从多个源提取的相似事件被统一存储或由后续处理步骤使用的过程).

## Security Analysis (安全分析)
- The process of researching data for the purpose of uncovering potential known and unknown threats.
- Security event correlation (安全事件关联)
  - Correlation rules are packaged in SIEM tools

## Alternatives to Rule-Based Correlation
- Anomaly-based correlation is another approach that can be combined with rule-based correlation.
- Another approach that could also be combined with rule-based correlation is risk-based correlation, also referred to as algorithmic. 
  - The basic idea is to calculate a risk score for an event based on the content and context of an event. 

## Data Enrichment
Refers to the practice of adding additional context to the data that you receive.






