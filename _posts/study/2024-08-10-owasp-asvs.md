---
layout: post
title: OWASP ASVS Study Notes
subtitle: 
cover-img: [/assets/img/cover/study1.jpg, /assets/img/cover/study2.jpg, /assets/img/cover/study3.jpg]
thumbnail-img: 
share-img:
tags: [owasp asvs]
categories: [Study]
---

<!-- vim-markdown-toc GFM -->

  * [About OWASP ASVS](#about-owasp-asvs)
    * [Definiton](#definiton)
    * [Goals](#goals)
    * [Application Security Verification Levels](#application-security-verification-levels)
    * [Assessment and Certification](#assessment-and-certification)
      * [Guidance for Certifying Organizations](#guidance-for-certifying-organizations)
      * [Other uses for the ASVS](#other-uses-for-the-asvs)
  * [V1 Architecture, Design and Threat Modeling](#v1-architecture-design-and-threat-modeling)
    * [Control Objective](#control-objective)
        * [V1.1 Secure Software Development Lifecycle](#v11-secure-software-development-lifecycle)
        * [V1.2 Authentication Architecture](#v12-authentication-architecture)
* [Glossaries](#glossaries)

<!-- vim-markdown-toc -->

## About OWASP ASVS
https://github.com/OWASP/ASVS/raw/v4.0.3/4.0/OWASP%20Application%20Security%20Verification%20Standard%204.0.3-en.pdf
### Definiton
ASVS = Application Security Verification Standard

The ASVS is a community-driven effort to establish a framework of security requirements and controls that focus on defining the functional and non-functional security controls required when designing, developing and testing modern web applications and web services.

### Goals
- to help organizations develop and maintain secure applications.
- to allow security service vendors, security tools vendors, and consumers to align their requirements and offerings.

### Application Security Verification Levels
- ASVS Level 1 is for low assurance levels, and is completely penetration testable
  >The minimum required for all applications.
- ASVS Level 2 is for applications that contain sensitive data, which requires protection and is the recommended level for most apps
  >Standard
- ASVS Level 3 is for the most critical applications - applications that perform high value transactions, contain sensitive medical data, or any application that requires the highest level of trust.
  >Advanced

![file](https://i.imgur.com/whb6RdY.png)

### Assessment and Certification
- All assurance assertions, trust marks, or certifications are not officially vetted, registered, or certified by OWASP.
- ASVS can be used as an open book verification of the application, including open and unfettered access to key resources such as architects and developers, project documentation, source code, authenticated access to test systems, particularly for L2 and L3.

#### Guidance for Certifying Organizations
- The Role of Automated Security Testing Tools
  - Automated penetration testing tools are encouraged for broad coverage.
  - These tools alone cannot fully complete ASVS verification.
  - Many Level 1 requirements can be automated, but most ASVS requirements need manual testing.
  - Experts often combine both automated tools and manual testing for thorough verification.
- The Role of Penetration Testing
  - Version 4.0 allows L1 testing without source code or developer access, but this method is less thorough.
  - L2 and L3 assessments require access to developers, documentation, and test environments.
  - Testing at L2 and L3 is called "hybrid reviews" or "hybrid penetration tests."

#### Other uses for the ASVS
- As Detailed Security Architecture Guidance
  - ASVS can be used by choosing one of its three levels or customizing it.
  - Forking ASVS is allowed if traceability is maintained.
  - Compliance with requirements should be consistent across all versions.

- As a Guide for Automated Unit and Integration Tests
  - ASVS: Highly testable except for architectural and malicious code aspects.
  - Unit and Integration Tests: Useful for verifying specific fuzz and abuse cases.
  - Example Tests:
    - Login controller: Test for default usernames, account enumeration, brute forcing, LDAP and SQL injection, XSS.
    - Password parameter: Test for common passwords, length, null byte injection, removal, XSS.

- As a Framework for Guiding the Procurement of Secure Software
  - ASVS helps in procuring secure software or custom development services.
  - Buyers can specify that software must meet ASVS level X.
  - Sellers need to prove compliance with the specified ASVS level.
  - Combining ASVS with the OWASP Secure Software Contract Annex is effective.

## V1 Architecture, Design and Threat Modeling
### Control Objective
- Security architecture has become less emphasized in many organizations.
- DevSecOps has shifted focus from traditional enterprise architecture.
- Security architecture is about problem-solving, not rigid implementations.
- There is no single "correct" architectural solution; flexibility is key.
- Implementing sound architecture today saves time and money in the future.
- Examples like multi-factor authentication show the evolution of security practices.
- ASVS covers core security principles: availability, confidentiality, integrity, non-repudiation, and privacy.
- Emphasize "shift left": integrate security from development through to independent testing.
- Traditional security methods are outdated due to frequent code changes.
- Security professionals need to adapt to agile practices and work directly with developers.

##### V1.1 Secure Software Development Lifecycle
##### V1.2 Authentication Architecture

# Glossaries

