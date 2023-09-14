---
layout: post
title: Chapter 13 Managing Identity and Authentication
subtitle: 
date: 2022-05-09 09:59:00 +0900
cover-img: [/assets/img/cover/security1.jpg, /assets/img/cover/security2.jpg, /assets/img/cover/security3.jpg]
thumbnail-img: https://i.imgur.com/Se6UFV3.png
share-img:
tags: [CISSP]
categories: [Security, Study]
---

![file](https://i.imgur.com/Se6UFV3.png)

# Controlling Access to Assets
Information / Systems / Devices / Facilities / Applications

+ Controlling Physical and Logical Access
+ The CIA Triad and Access Controls
+ Three categories of IT loss:
  + Loss of confidentiality
  + Unauthorized entities can access systems or data.
  + Loss of integrity
  + Unauthorized or unwanted changes to objects.
  + Loss of availability
  + The systems or data is not available to subjects that have been granted privilege within a reasonable amount of time.

# Managing Identification and Authentication
>Identification is the process of a subject claiming, or professing, an identity.
A core principle with authentication is that all subjects must have unique identities.
Occur together as a single two-step process.

+ Comparing Subjects and Objects
+ The roles of subject and object can switch back and forth.
+ Registration, Proofing, and Establishment of Identity
+ Knowledge-based authentication (KBA)
+ Cognitive password (security questions)
+ Authorization and Accountability
+ Authorization
  + Identification and authentication are “all-or-nothing” aspects of access control.
+ Accountability
  + Auditing, logging, and monitoring provide accountability by ensuring that subjects can be held accountable for their actions.
+ Authentication Factors Overview
Three primary authentication factors:
  + [Weakest] Something You Know (Older documents call "Type 1 authentication factor")  
    Memorized secrets:
    + password
    + personal identification nmber (PIN)
    + Typically 4, 6, or 8 numbers long.
    + passphrase
    + Something You Have (Older documents call "Type 2 authentication factor")
    + smartcard
    + hardware token
    + memory card
    + Universal Serial Bus (USB)
   + [Strongest] Something You Are (Older documents call "Type 2 authentication factor")
    + Physical characteristics of a person and is based on biometrics.
    + fingerprints (指纹)
    + Ridges (山脊)
    + Bifurcations (分岔)
    + Whorls (螺纹)
    + face scans (面部扫描)
    + retina patterns (视网膜) JP:網膜
    + iris patterns (虹膜) JP:虹彩
    + palm scans (手掌静脉扫描)

+ Attributes for additional authentication:
  + Somewhere You Are
    + Context-Aware Authentication (上下文感知认证)
  + Something You Do
  + Something You Know

+ Password Policy Components
  + Maximum Age (password expiration)
  + Password Complexity
  + Password Length
  + Minimum Age  
    Password policies enforcing password history typically have a minimum age of one day.  
    Authoritative Password Recommendations (权威密码推荐)

+ NIST Password Recommendations
  + Passwords must be hashed.
  + Passwords should not expire.
  + Users should NOT be required to changed their passwords regularly, such as every 30 days.
  + Users should not be required to use special characters.
  + Users should be able to copy and paste passwords.
  + Users should be able to use all characters.
  + Password length should be at least eight characters and as many as 64 characters.
  + Password systems should screen passwords.

+ PCI DSS Password Requirements
  + Passwords expire at least every 90 days.
  + Passwords must be at least seven characters long.

+ Something You Have
  + Smartcards  
    Aren't effective identification methods by themselves.
  + Token (令牌) 
    A password-generating device.
    An Authentication server knows what number is displayed on the user's token at any moment.
    Dynamic onetime passwords, more secure than static passwords.
  + Two types of tokens  
  + Synchronous dynamic password tokens.
    + Synchronized with an authentication server.
    + Requires the token and the server to have accurate time.
    + Combined with Type 1 factor.

+ Asynchronous dynamic password tokens.
  + Does not use a clock.
  + Based on an algorithm and an incrementing counter.
  + After configured to work with an authentication server, it sends a new PIN to the app every 30 seconds.

+ Something You Are
  + Fingerprints
  + Face Scans
  + Retina Scans  
    The most accurate form of biometric authentication.
    Focus on the pattern of blood vessels at the back of the eye.
    Typically require users to be as close as three inches from the scanner.

+ Iris Scans
  + Focusing on the colored area around the pupil.
  + The second-most accurate form of biometric authentication.
  + Like the retina, the iris remains relatively unchanged throughout a person's life.
  + Scans can occur from far away (6 to 12 meters) and are less intrusive.

+ Voice Pattern Recognition (voiceprint)  
  Sometimes used as an additional authentication mechanism but is rarely used by itself.

+ Biometric Factor Error Ratings
  + False negative (假阴性 / 偽陰性) 検知漏れ
  + False positive (假阳性 / 偽陽性) 誤検知
  + Ratings
  + False Rejection Rate (FRR) 本人拒否率
    + False negative authentication.
    + Sometimes called a Type I error.
  + False Acceptance Rate (FAR)
    + False positive authentication.
    + Sometimes called a Type II error.

+ Biometric Registration  
  Subjects typically accept a throughput rate of about 6 seconds or faster.

+ Multifactor Authentication (MFA)
  + 2FA (Two-factor Authentication)
  + single-factor Authentication

+ Two-Factor Authentication with Authenticator Apps
  + Provide a simple way to implement 2FA without a hardware token.
  + Takes advantage of one of the following standards:
  + HOTP (HMAC-based One-Time Password)
    + values of six to eight numbers.
    + remains valid until used.
  + TOTP (Time-based One-Time Password)
   + uses a timestamp and remains valid for a certain time frame, such as 30 seconds.

  + Emain challenge (Another popular method of 2FA)
  + NIST Deprecates SMS for 2FA
  + SMS messages are displayed on the lock screen without the user logging on.
  + SMS messages are sometimes edirected to an attacker's devices via SIM card fraud.

+ Passwordless Authentication
  + Growing trend toward passwordless.
  + Level
  + Weakest : Static passwords.
  + Worse : Force users into creating longer and more complex PWs with expiration dates.
  + FIDO

+ Device Authentication  
  Device identification and authentication methods
  + Device Fingerprinting
  + OS and verson / Web browser / Browser fonts / Browser plug-ins / Time zone / Data storage / Screen resolution / Cookie settings / HTTP headers
  + MDM systems use context-aware authentication methods
  + 802.1X

+ Service Authentication  
  Best practices
  + With a strong, complex PW that is changed more often than regular users.
  + Configure the account to be noninteractive (aka, can not logon)
  + Use certificate-based authentication.

+ Mutual Authentication (相互认证)
  + Commonly use digital certificates.
  + VPN's case study
  + Both the server and the client present digital certificates to the other endpoint.
  + Providing two-way authentication.

+ Implementing Identity Management
  + Centralized access control.
  + Decentralized access control (distributed access control)

+ Single Sign-On (SSO)
  + A centralized acces control technique.
  + Advantage
  + Convenient for users, has security benefits.
    + Eases administration by reducing the number of accounts.
  + Diadvantage
  + Once an account is compromised, an attacker gains unrestrivated access to all of the authorized resources.

+ LDAP and Centralized Access Control
  + AD DS is LDAP based.

+ LDAP and PKIs
  + A public key infrastructure (PKI) uses LDAP when integrating digital certificates into transmissions.

+ SSO and Federated Indentities
  + FIM : Federated indentities management
  + SAML : Security Assertion Markup Language.  
    OIDC : OAuth and OpenID Connect.

+ Cloud-Based Federation
+ On-Premise Federation
+ Hybrid Federation  
  Is a combination of a cloud-based solution and an on-premises solution.
  + Federation = フェデレーション = 認証情報を共有することで使う人の認証の手間を最初の1回だけにする仕組み = ID連携 = 認証連携

+ just-in-time (JIT)
+ Credential Management Systems
+ Credential Manager Apps
  + Windows includes the Credential Manager applet in the Control Panel.
  + Third-party credential management systems
  + KeePass
  + 1Password

+ Scripted Access
  + Scripts and batch files should be stored in a protected area because they usually contain access credentials in cleartext.

+ Session Management
  + User closes a browser tab without logging off is NOT safe!
  + Timeout periods
  + High-value applications : 2 to 5 minutes.
  + Low-value applications : 15 to 20 minutes.

# Managing the Identity and Access Provisioning Lifecycle
+ Provisioning and Onboarding (资源调配和入职)
+ Deprovisioning and Offboarding
+ Defining New Roles
+ Account Maintenance
+ Account Access Review
+ Checking
  + Don't have excessive privileges.
  + Accounts comply with security policies.
+ Account types
  + user accounts
  + system accounts
  + service accounts

# Summary
## Exam Essentials
+ Know how physical access controls protect assets.
+ Know how logical access controls protect assets.
+ Know the difference between subjects and objects.
+ Know the difference between identification and authentication.
+ People, devices, and services all verify their identity by giving proper credentials.
+ Understand the establishment of identity, registration, and proofing.
+ Understand the difference between authorization and accountability.(了解授权和问责之间的区别)
+ Understand the details of the primary authentication factors.
+ Understand single sign-on.
+ Describe how federated identity systems are implemented.
+ Describe just-in-time (JIT) provisioning.
+ Explain session management.
+ Understand the identity and access provisioning lifecycle.
+ Explain the importance of role definition.
+ Describe the purpose of account access reviews.
```
01 A
02 D->A
03 C
04 D ★
05 B
06 B
07 A
08 C
09 A
10 A->C
11 B
12 ABD ★ ->BCD
13 A
14 AC->AD
15 A->C
16 B ★->C
17 D->C
18 D
19 B->C
20 D
```
正解率：12 / 20 = 60%

# Knowledge points
+ A primary focus is on identification, authentication, authorization, and accountability.  
  Devices with lower CERs are more accurate than devices with higher CERs.
+ The strength of two authentication methods of the same factor is no greater than it would be if just one method were used.
+ NIST advices that, regular users are required to change their passwords only if the current password is comporomised.
+ Authenticator app is the least expensive secure solution of 2FA.
