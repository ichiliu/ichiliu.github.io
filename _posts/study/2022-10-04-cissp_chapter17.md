---
layout: post
title: Chapter 17 Preventing and Responding to Incidents
permalink: /study/chapter-17-preventing-and-responding-to-incidents
subtitle: 
cover-img: [/assets/img/cover/study1.jpg, /assets/img/cover/study2.jpg, /assets/img/cover/study3.jpg]
thumbnail-img: https://i.imgur.com/Se6UFV3.png
share-img:
tags: [CISSP]
categories: [Study]
---

# Chapter 17 Preventing and Responding to Incidents
## Conducting Incident Management
The primary goal of incident management is to minimize the impact on the organization.

<img src="https://i.imgur.com/Se6UFV3.png">

### Defining an Incident
  * RFC2350
    * Any adverse events which compromises some aspect of computer or network security.
  * NIST SP800-61
    * A violation or imminent threat of violation of computer security policies, acceptable use policies, or standard security practices.
  * Examples of incidents
    * Any attempted network intrusion (侵入网络)
    * Any attempted denial-of-service attack (DoS网络)
    * Any detection of malicious software (病毒软件)
    * Any unauthorized access of data (未授权访问数据)
    * Any violation of security policie (违反安全政策)

### Incident Management Steps
![file](https://imgur.com/ZkEttEh.png)

NIST SP800-61 identifies the following 4 steps
1. Preparation
1. Detectin and Analysis
1. Containment, Eradication, and Recovery (遏制、根除和恢复)
1. Post-incident Recovery (事故后恢复)

Incident management does not include a counterattack against the attacker.

#### Detection
* IDS and IPS sent alerts
* Antimaoware software
* Automated tools regularly scan audit logs looking for predefined events.
* End users detect irregular activity such as the inability to access a network resource etc.

#### Response
* Teams
  * CIRT (computer incident response team)
  * CSIRT (computer security incident response team)
* Computers should not be turned off when containing an incident.

#### Mitigation
* Mitigation steps attempt to contain an incident.

#### Reporting
* If a data breach exposes PII, the oroganication muset report it.
* The owner of the system have a responsibility to inform you of the attack   
  and what data the attackers accessed.

#### Recovery
Is to recover the system or return it to a fully functioning state.
* Double check lists
  * ACLs (include firewall and router rules)
  * Services and protocols (unneeded ones are disabled or removed)
  * Patches (all up-to-date)
  * User accounts (have changed from their default configuratons)
  * Compromises (have been reversed)

#### Remediation ([rɪˌmiːdiˈeɪʃn] 修复;补救;整治) (再発防止)
Identify what allowed it to occur, and then implement methods to prevent it from happening again.
* Root cause analysis  
Examines the incident to determine what allowed it to happen.

#### Lessons Learned (振り返り)
Personnel examine the incident and the response to see if there are any lessons to be learned.

## Implementing Detective and Preventive Measures (实施检测和预防措施)
No matter how effective preventive countermeasures are, incidents will still happen.
* Preventive and detective controls
  * Preventive Control 
    Attempts to thwart or stop unwanted or unauthorized activity from occurring.
  * Detective Control
    Attempts to discover or detect unwanted or unauthorized activity.

### Basic Preventive Measures
* Keep systems and applications up to date.
* Remove or disable unneeded services and protocols.
* Use intrusion detection and prevention systems.
* Use up-to-date antimalware software.
* Use firewalls.
  * Network-based firewalls protect entire networks.
  * Host-based firewalls protect individual systems.
* Implement configuration and system management processes.

### Understanding Attacks
* Botnets (bots / zombies)
  * A bot herder (牧民) is typically a criminal who controls all the computers in the botnet via one or more command-and-control (C&C or C2) servers.
  * Real World Scenario
    * Botnets, IoT, and Embedded Systems
      * Mirai malware

#### Denial-of-Service Attacks  
Prevent a system from processing or responding to legitimate traffic or requests for resources and objects.
* The source address in a DoS attack is rarely the attacker's address.

#### SYN Flood Attack
* Is a common DoS attack, it disruputs the standard three-way handsshake used by TCP to initiate communication sessions.
* Using SYN cookies is one method of blocking this attack.
* Another method of blocking this attack is to reduce the amount of time a server will wait for an ACK.

#### Smurf and Fraggle Attacks
* A smurf attack is another type of flood attack.
* It floods the victim with ICMP echo packets instead of with TCP SYN packets.
* When standard security practices are used, smurf attacks are rarely a problem today.
* Fraggle attacks use UDP packets over UDP ports 7 and 19.

#### Ping Flood
* Floods a victim with ping requests.
* Active IDS can detect a ping flood and modify the environment to block ICMP echo requests during the attack.

#### Legacy Attacks
* Ping of Death  
Used oversized ping packets.
* Teardrop  
Fragments data packets.
* Land  
Sends spoofed SYN packets to a victim using the victim's IP address as both src and dst.

#### Zero-Day Exploit (零日漏洞利用)
Some examples:
* Attacker discovers a vulnerability first.
* Vendor learns of vulnerability but hasn't released a patch.
* Verdor releases patch and systems are attacked within 24 hours.

Honeypots give administrators an opportunity to observe attacks and may reveal an attack using a ZDE.

#### Man-in-the-Middle Attacks (MiTM / on-path attack / 中间人攻击 / 中間者攻撃)
* Two types
  1. Involves copying or sniffing the traffic between two parties.
  1. Involves attackers positioning themselves in the line of communication, where they act as a  
     store-and-forward or proxy mechanism.
* Countermeasures
  1. Keeping systems up to date with patches.
  1. Using VPNs to avoid these attacks.

#### Sabotage (蓄意破坏)
Employee terminations should be handled swiftly and account access should be disabled as soon as possible after the termination.

## Intrusion Detection and Prevention Systems
* An IDS is intended as part of a defense-in-depth security plan.
* An IPS includes all the capabilities of an IDS but can alse take additional steps to stop or prevent intrusions.

### Knowledge- and Behavior-Based Detection
* Knowledge-Based detection  
Uses signatures similar to the signature definations used by antimalware software.
  * The most common method of detection.
  * also called signatur-based detection or pattern-mathching detection.
  * Drawback:  
    It is effective only against known attack methods. 
  * IDS vendors commonly provide automated methods to update the signatures.

* Behavior-Based detection  
Doesn't use signatures but instead compares activity against a baseline of normal performance to detect abnormal behavior.
  * Also called
    * Statistical intrusion detection (统计入侵检测)
    * Anomaly detection (异常检测)
    * Heuristics-based detection (启发式检测)
  * A significant benefit is that it can detect newer attacks that have no signatures and are not detectable with the signature-based method.

* False Positive or True Negative

  ![file](https://imgur.com/6blc1Se.png)

  * IDPSs
    * True positive  - An incident occures and is detected.
    * Flase negative - An incident occures but is not detected (漏报)
    * Flase positive - An incident is detected but did not occur (误报)
    * True negative  - An incident does not occue and is not detected.

  * Biometrics
    * True positive  – A registered user tries to authenticate and is authenticated.
    * False negative – A registered user tries to authenticate but is not authenticated (or is rejected).
    * False positive – An impostor tries to authenticate and is authenticated.
    * True negative  – An impostor tries to authenticate but is not authenticated.

### IDS Response
* Passive Response (被动响应)
  * Notifications via email or text messages, generate a detail report.
  * Network Operations Centers (NOCs)
* Actie Response (主动响应）
  * Can modify the environment, include firewall ACLs to block traffic based on ports, protocals, and source addresses etc.
  * NIST SP 800-94 recommends placing all active IDSs inline with the traffic so that they function as IPSs.

### Host- and Network-Based IDSs
* Host-Based IDS (HIDS)
  * Can often examine events in more detail than an NIDS can.
  * Many HIDSs include antimalware capabilities.
  * Some of disadvantages of HIDSs are related to the cost and usability.
* Network-Based IDS (NIDS)
  * Can monitor a large network by using remote sensors to collect data at key network locations, and send data to SIEM.

* Monitoring Encrypted Traffic
  * TLS decryptors
    * Detect TLS traffic, takes steps to decrypt it, send the decrypted traffic to an IDPS for inspection.
    * Is often a standalone HW appliance dedicated to this function. 
    * Can be within an IDPS, a next-generation FW.
    * Typically placed inline with the traffic.
    * Then establish two HTTPS sessions
      The internet server <-> TLS decryptor <-> The internal client
    * Weakness: TLS decryptor cannot decrypt the traffic encrypted APTs before establishing a HTTPS connection.

  * Switched Port Analyzer (SPAN) port : The port used for post mirroring of Cisco switches.

  * NIDS (Network Intrusion Detection System)
    * The NIDS central console is often installed on a hardened single-purpose computer.
    * Measures to discover the source of an attack
      * RARP (Reverse address resolution protocol / 反向地址解析协议 / 逆アドレス解決プロトコル)  
        MAC address -> IP address
      * Reverse DNS lookups  
        IP address -> domain name

### Intrusion Prevention Systems (IPSs)
* A special of active IDS, detect and block attacks BEFORE they reach target systems.
* NIDS vs. NIPS
  * NIPS is placed inline with the traffic.
  * Active NIDS is not placed inline can check the activity only after it has reached the target.

### Specific Preventive Measures (具体预防措施)
* Honeypots and Honeynets (蜜罐和蜜网 / ハニーポットとハニーネット)
  * Honeypots are individual computers created as a trap or a decoy for intruders or insider threats.
  * A Honeynet is two or more networked honeypots used together to simulate a network.
  * Administrators often include pseudo-flaws on honeypots to emulate well-known operating system vulnerabilities.
  * The use of honeypots raises the issue of enticement versus entrapment.

* Warning Banners
  * Inform users and intruders about basic security policy guidelines.
  * Inform both authorized and unauthorized users.

* Antimalware
* Whitelisting and Blacklisting 
  * The terms of whitelists and blacklists are falling into disuse.
  * More intuitive phrases are allow lsit (for whitelisting) and deny/block list (for Blacklisting).
  * It's important that a system would only use ONE list, either an allow list or a deny list.
  * The Apple iOS is an example for an extreme version of allow list (Only apps available from Apple's App Store are allowed to be installed)

* Firewalls  
Are preventive and technical controls, attempt to prevent security incidents using technical methods.
  * Protection against attacks
    * Block directed broadcasts on routers.
    * Block private IP addresses at the border.
  * Types
    * Second-generation firewalls
      * Application-level gateway firewall -> filters traffic based on specific application requestments.
      * Circuit-level gateway firewalls -> based on the communications circuit.
    * Third-generation firewalls (Statefull inspection FWs / Dynamic packet filtering FWs) -> based on its state within a stream of traffic.
    * Application firewalls  
      Control traffic going to or from a specific application or service. 
      * Web application firewall (WAF)
        * Inspects all traffic going to a web server
        * Block malicious traffic such as SQLi attacks and XSS attacks.
        * Filters traffic going to the web server but not all NW traffic.
    * Next-generation firewall (NGFW)  
      Functions as a unified threat management (UTM) device and combines several filtering capabilities.

* Sandboxing (沙盒)
  * Provides a security boundary for applications and prevents the application from interacting with other applications.
  * Application developers often use virtualization techniques to test applications.

* Third-Party Security Services
  * PCI DSS requires organizations to ensure that service providers also comply with PCI DSS requireements.

## Logging and Monitoring
Logging records events into various logs, and monitoring reviews these events.
### Logging Techniques
Logs are often referred to as audit logs, and logging is ofter called audit logging.

### Common Log Types
* Security Logs  
  Record access to resource such as files, folders, printers, and so on.
* System Logs
  * Record system events such as a system starts/stops, services start/stop, service attritures modified.
  * Logs that detect when systems reboot, or when services stop or are modified, can help administrators discover potentially malicious activity.
* Application Logs
* Firewall Logs  
  Commonly log key packet information.
* Proxy Logs  
  Include the ability to record details such as what sites specific users visit and how much time they spend on these sites.
* Change Logs

### Protecting Log Data
* It's common to store copies of logs on a central system, such as a SIEM system, to protect it.
* Organizations often have strict policies mandating backups of log files.
* It's important to destroy logs when they are no longer needed.
* Keeping unnecessary logs can cause excessive labor costs if the organization experiences legal issues.
* FIPS 200 specifies the minimum security requirements for audit data.

### The Role of Monitoring
#### Audit Trails (审计跟踪 / 監査証跡)
* Using audit trails is a passive form of detective security control.

#### Monitoring and Accountability
Legislation often requires specific monitoring and accountability practices.
* Monitoring Activity  
  You cannot hold them accountable for mistakes or misdeeds they commit without monitoring.

#### Monitoring and Investigations
* Accurate timestamps (via a internal NTP server)

#### Monitoring and Ploblem Identification
#### Monitoring Techniques
Personnel can manually review logs or use tools to automate the process.

#### Security Information and Event Management (SIEM / シーム)
A centralized application to automate the monitoring of systems on a network.

SIEM : Security Information and Event Management  
SEM  : Security Event Management  
SIM  : Security Information Management  

* Many IDSs and IPSs send collected data to a SIEM system.
* Provodes long-term storage of data, allowing security professionals to analyze the data later.
* Most SIEMs are configurable.
* SIEMs ofter include sophisticated correlation engines.

#### Syslog
* RFC 5424, the Syslog Protocal is used to send event notification messages.
* Syslog-ng and rsyslog allow the syslog server to accept messages from any source, not just Unix and Linux systems.

#### Sampling (抽样)
Sampling is a form of data reduction, allow someone to glean valuable information by looking at only a small sample of data in an audit trail.

#### Clipping Levels (剪裁级别)
* Clipping level is a predefined threshold for the event (e.g. five failed logon attempts within a 30-minute period)
* Widely used to establish a baseline of routine system or user acvtivity.
* Be effective and less expensive and easier to implement than statistical sampling.

#### Other Monitoring Tools
* CCTV system (闭路电视系统)
* Keystroke Monitoring (击键监控)  
  There is some debate about whether keystroke monitoring should by restricted and controlled.
* Traffic Analysis and Trend Analysis (流量分析和趋势分析)

#### Log Management
* Rollover Loggin = Circular Logging = Log Cycling (滚动日志=循环日志=日志循环) = Log Rotation
* For windows systems, implement a method will save the log entries and prevent the logs from filling a disk drive.

#### Egress ([ˈiːɡres]) Monitoring (出口监控)
* An advanced implementation of watermarking is digital watermarking.
* DLP systems can detect watermarks in unencrypted files.

## Automating Incident Response
### Understanding SOAR
SOAR = Security Orchestration, Automation, and Response (安全协调、自动化和响应)
* Playbook
  * A document or checklist defines how to verify an incident, gives details on the response.
  * Listing the same actions security adminstrators take to verrify attacks and the steps taken after verifying them.
* Runbook
  * Implments the playbook data into an automated tool.

### Machine Learning and AI Tools
* ML  
  A part of AI, gives computer systems the ability to learn.
* AI  
  A broad field includes ML, it gives machines the ability to do things a human can do better or allows a machine to perfoem tasks we previously thought required human intelligence.

### Threat Intelligence (威胁情报)
Refers to gathering data on potential threats.

### Understanding the Kill Chain
Cyber Kill Chain framework (Created by Lockheed Martin)
* Reconnaissance (侦查)
* Weaponization (武器化)
* Delivery (传送)
* Exploitation (搾取)
* Installationa (安装)
* Command and Control (命令与控制)
* Actions on objectives (目标行动)

### Understanding the MITRE ATT&CK
ATT&CK Matrix is a living document that is update at least twice a year.

### Threat Hunting
* The process of actively searching for cyber threats in a network.
* ATPs ofter stay undetected in netwoks for months.
* One popular method of threat hunting is to use a kill chain model.

### The Intersection of SOAR, Machine Learning, AI, and Threat Feeds
* Computers are great at performing repetitive steps and eliminating human errors, so they are welcomed by most administrators.

## Summary
## Exam Essentials
* List and describe incident management steps. 
  * detection, response, mitigation, reporting, recovery, remediation, lesson learned
  * 检测、响应、缓解、报告、恢复、补救、吸取教训
* Understand basic preventive measures.
* Know the difference between whitelisting and blacklisting.
* Understand sandboxing.
* Know about third-party provided security services.
* Understand botnets, botnet controllers, andbot herders.
* Know about denial-of-service (DoS) attacks.
* Understand zero-day exploits.
* Understand man-in-the-middle attacks.
* Understand intrusion detection and intrusion prevention.
* Recognize IDS/IPS responses.
* Understand the difference between HIDSs and NIDSs.
* Describe honeypots and honeynets.
* Understand the methods used to block malicious code.
* Know the types of log files.
* Understand monitoring and uses of monitoring tools.  
  Log management includes analyzing logs and archiving logs.
* Be able to explain audit trails.
* Understand how to maintain accountability.
* Describe threat feeds and threat hunting.
* Know the relationship between ML and AI.
* Know the benefits of SOAR.

## Review Questions
```
1 B C D
2 A
3 A (The question and the answer is not matched)
4 A B C → A C D
5 B
6 B
7 C → A
8 A
9 C
10 C → D
11 B
12 D → A
13 B → D
14 B
15 B
16 B
17 B
18 D
19 B → A
20 A
``````
正解率：15 / 20 = 75%
