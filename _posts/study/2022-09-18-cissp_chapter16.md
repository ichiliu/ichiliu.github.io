---
layout: post
title: Chapter 16 Managing Security Operations
permalink: /study/chapter-16-managing-security-operations
subtitle: 
cover-img: [/assets/img/cover/study1.jpg, /assets/img/cover/study2.jpg, /assets/img/cover/study3.jpg]
thumbnail-img: https://i.imgur.com/Se6UFV3.png
share-img:
tags: [CISSP]
categories: [Study]
---

# Chapter 16 Managing Security Operations
## Apply Foundational Security Operations Concepts 

<img src="https://i.imgur.com/Se6UFV3.png">

* Need to Know and Least Privilege
  * Need-to-Know Access 
    * The need-to-know principle imposes the requirement to grant users access only to data or resources they need to perform assigned work tasks.

  * The Principle of Least Privilege
    * The least privilege principle states that subjects are granted only the privileges necessary to perform assigned work tasks and no more.
    * Relies on the assumption that all users have a well-defined job description that personnel understand.
    * Without a specific job description, it is not possible to know what privileges users need.

  * Separation of Duties (SoD) and Responsibilities
    * Ensures that no single person has total control over a critical function or system.

  * Two-Person Control ("two-man rule")
    * Requires the approval of two individuals for critical tasks.

  * Job Rotation ("rotation of duties")
    * A security control provides review, reduces fraud, and enables cross-training.

  * Mandatory Vacations
    * Provides a form of peer review and helps detect fraud and collusion.

  * Privileged Account Management (PAM)
    * Microsoft domains
      * local administrator accounts
        * have full control over a computer
      * Domain Admins group
        * have full control over any computers in a domain
      * Enterprise Admins gropu
        * have full control over all the domains in a forest
    * Linux / Unix
      * root account
      * anyone granted root access via sudo

  * Sevice Level Agreements (SLAs)
    * Stipulates performance expectations and often includes penalties if the vendor doesn't meet these expectations.

* Addressing Personnel Safety and Security (处理人员安全和安保问题)  
It's always possible to replace things such as data, servers, and even entire buildings. In contrast, it isn't possible to replace people 

  * Duress
    * The monitoring entity would recognize that the guard skipped the code phrase and send help.

  * Travel
    * Many risks associated with electronic devices
      * Sensitive Data
      * Malware and Monitoring Devices
        * Maintaining physical control of devices.
        * Bringing temporary devices to be used during the trip.
      * Free Wi-Fi
      * VPNs

  * Emergency Management
    * The safety of personnel should be a primary consideration during any disaster.

  * Security Training and Awareness
    * Aware of duress systems
    * Travel best practices
    * Emergency management plans
    * General safety
    * Security best practices

* Provision Resources Securely
  * Information and Asset Ownership
    * The data owner is the person who has ultimate organizational responsibility for the data.
      * Senior Managers
        * CEO / President / Department Head

  * Asset Management
    * An automated configuration management system (CMS) helps with hardware asset management.

  * Hardware Asset Inventories
    * RFID tags and readers are more expensive than bar codes and bar-code readers.
    * RFID methods significantly reduce the time needed to perform an inventory.
    * Before disposing of equipment, personnel sanitize it.

  * Software Asset Inventories
    * Operating systems and applications.
    * Software licensing also refers to ensuring that systems do not have unauthorized software installed.

  * Intangible Inventories
    * Organication needs to keep track of intangible assets to protect them.

* Apply Resource Protection
  * Media Management
  * Media Protection Techniques
    * The primary risks from USB flash drives are malware infections and data theft.
    * Properly managing media helps prevent
      * Unauthorized disclosure (loss of confidentiality)
      * Unauthorized modification (loss of integrity)
      * Unauthorized destruction (loss of availability).

  * Tape Media
    * Tapes should not be exposed to magnetic fields that can come from sources such as elevator motors and some printers.

  * Mobile Devices
  * Managing Media Lifecycle
    * All media has a useful but finite lifecycle.
    * Instead of attempting to remove data from SSDs, many organizations destroy them.

## Managed Services in the Cloud
* Shared Responsibility with Cloud Service Models (与云服务模型共担责任)
  * Software as a Service (SaaS)
  * Platform as a Service (PaaS)
    * The runtime environment includes programming languages, libraries, services, and other tools supported by the vendor.
  * Infrastructure as a Service (IaaS)
  * TIPS
    * NIST SP 800-145
      * The NIST Definition of Cloud Computing.
    * NIST SP 800-144
      * Guidelines on Security and Privacy in Public Cloud Computing.
  * Four cloud deployment models
    * public cloud
    * private cloud
    * community cloud
    * hybrid cloud

* Scalability and Elasticity (可扩展性和弹性)
  * Elasticity methods don't require shutting a system down to add the resources.
  * Scalability methods are not automatic or dynamic.

## Perform Configuration Management (CM)
Configuration management (CM) (配置管理 / 構成管理)

* Provisioning (配置;供应)  
Hardening a system makes it more secure than the default configration
  * Disable all unused services.
  * Close all unused logical ports.
  * Remove all unused application.
  * Change default passwords.

* Baselining  
Is the starting configuration for a system.

* Using Images for Baselinning
  * Steps
    * An administrator starts by installing the OS and all desired applications on a computer.
    * The administrator captures an image of the system using imaging software and stores it on a server on external storage.
    * Personnel deploy the image to systems as needed.
  * Benefit
    * Improve the security of system by
      * Ensuring that desired security settings are always configured correctly.
      * Reducing the amount of time required to deploy and maintain systems.

* Automation

## Managing Change
The primary goal of change management is to ensure that changes do not cause outages. 
* Change Management (变更管理)  
Common tasks
  * Request the change.
  * Review the change.
  * Approve / reject the change.
  * Test the change.
  * Schedule and implement the change.
  * Document the change.

* Versioning
* Configuration Documentation

## Managing Patches and Reducing Vulnerabilities
* Systems to Manage
* Patch Management
  * Common steps within an effective patch management program
    * Evaluate patches  
      e.g. A patch released to fix a feature is not needed if the feature is not installed.
    * Test patches
    * Approve the patches
    * Deploy the patches
  * Patch Tuesday and Exploit Wednesday
    * MS, Adobe and Oracle regularly release patches on the second Tuesday of every month.
    * Some attackers have reverse-engineered patches to identity the underlying vulnerability,   
      and then created methods to exploit the vulnerability, aka exploit Wednesday.

* Vulnerability Management
  * Refers to regularly identifying vulnerabilities, evaluating them, and taking steps to mitigate risks associated with them.
  * Two common elements of a vulnerability management program
    * Vulnerability scans
    * Periodic vulnerability assessments

  * Vulnerability scans
    * A vulnerability scan enumerates all the vulnerabilities in a system.
    * Simply recommending applying patches doesn't reduce the vulnerabilities. Administrators need to   
      take steps to apply patches.
    * Any lossed that occur from residual risk are the responsilibity of management.

* Common Vulnerabilities and Exposures (共通脆弱性識別子CVE)
  * MITRE maintains the CVE database.

## Summary
## Exam Essentials
* Know the difference between need to know and the least privilege principle.
* Understand separation of duties and job rotation.
* Know about monitoring privileged operations.
* Understand service-level agreements.
* Describe personnel safety and security concerns.
* Understand secure provisioning concepts.
* Know how to manage and protect media.
* Recognize security issues with managed services in the cloud.
* Explain configration and change control management.
* Understand patch management.
* Explain vulnerability management.

## Review Questions
```
1 C
2 A → C
3 C
4 D
5 D
6 A
7 C
8 A
9 B
10 C
11 A
12 C
13 A
14 C
15 B C D
16 C
17 D
18 A
19 B
20 D
```
正解率：19 / 20 = 95%
