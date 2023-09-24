---
layout: post
title: AWS Security Services
subtitle: 
cover-img: [/assets/img/cover/security1.jpg, /assets/img/cover/security2.jpg, /assets/img/cover/security3.jpg]
thumbnail-img: https://i.imgur.com/7jkDxaE.png
share-img:
tags: [AWS, Security]
categories: [Security]
full-width: true
---

# Abstract
A brief introduction of AWS Security Services.

<!-- vim-markdown-toc GFM -->

* [Amazon Cognito](#amazon-cognito)
* [AWS Single Sign-On (AWS SSO / AWS单点登录)](#aws-single-sign-on-aws-sso--aws单点登录)
* [Infrastructure Protection (基础设施保护)](#infrastructure-protection-基础设施保护)
  * [AWS Shield (AWSシールド)](#aws-shield-awsシールド)
  * [AWS Firewall Manager](#aws-firewall-manager)
  * [AWS Web Application Firewall (WAF)](#aws-web-application-firewall-waf)
* [Date Protection](#date-protection)
  * [AWS Macie (AWSメイシー)](#aws-macie-awsメイシー)
  * [AWS Key Management Service (KMS)](#aws-key-management-service-kms)
  * [AWS CloudHSM (Cloud Hardware Security Module)](#aws-cloudhsm-cloud-hardware-security-module)
  * [AWS Certificate Manager](#aws-certificate-manager)

<!-- vim-markdown-toc -->


# Amazon Cognito
Amazon Cognito is a fully managed identity and access management service provided by AWS. It allows developers to easily add user identity and authentication to their applications, whether they are web or mobile apps.

Some key features and aspects:

1. **User Pools (用户池)**: Amazon Cognito User Pools allow you to create and manage a directory of users and provide sign-up and sign-in functionality. User Pools support various identity providers, including social identity providers (e.g., Facebook, Google) and SAML-based providers.

1. **Identity Pools (Federated Identities / 联合身份)**: Amazon Cognito Identity Pools enable you to grant temporary AWS credentials to users, providing access to AWS services like Amazon S3 or DynamoDB. Users can be authenticated via User Pools or through third-party identity providers.

1. **Authentication and Authorization (身份验证和授权)**: Amazon Cognito handles user authentication and authorization by providing secure and scalable user directories. It supports multi-factor authentication (MFA) and integrates with various federation standards.

1. **Mobile and Web Integration (跨设备同步)**: Amazon Cognito is often used with mobile and web applications to manage user identities, including features like secure sign-up, sign-in, and token management for accessing AWS resources.

1. **Secure User Data Storage (安全数据存储)**: Cognito allows you to store user data and app preferences securely in the Cognito Sync service. This enables synchronization of user data across devices.

1. **Customizable Workflows (可定制的工作流程)**: Amazon Cognito provides the flexibility to customize authentication flows and implement custom authentication processes based on your application's requirements.

1. **Integration with AWS Services (与AWS服务集成)**: Cognito integrates with other AWS services, allowing secure access to AWS resources.

1. **Scalability and Reliability (可伸缩性和高可用性)**: Being an AWS service, Amazon Cognito is designed to be highly scalable and reliable, ensuring that it can handle varying workloads and maintain high availability.

Developers often use Amazon Cognito in combination with other AWS services to build secure, scalable, and user-friendly applications by managing user identities and authentication seamlessly. 

![file](https://i.imgur.com/RmvVhwl.png)

引用:https://aws.amazon.com/jp/cognito/

# AWS Single Sign-On (AWS SSO / AWS单点登录)
Is a cloud-based service provided by AWS that enables users to securely access multiple applications with a single set of credentials. It simplifies user access management and authentication for AWS accounts and business applications by centralizing access and authentication across various AWS accounts and third-party applications.

Key features:

1. **Centralized Access Control (集中访问控制)**: AWS SSO allows administrators to centrally manage user access to multiple AWS accounts and applications from a single location, providing a unified access control mechanism.

1. **Single Sign-On (SSO / 单点登录)**: Users can log in once using their credentials and gain access to various applications without needing to enter passwords again. This enhances user experience and security.

1. **Integration with Business Applications (与业务应用程序集成)**: AWS SSO integrates with a range of popular business applications, allowing users to access these applications seamlessly once authenticated.

1. **Multi-Factor Authentication (MFA / 多因子身份认证 / 多因素身份验证)**: Enhanced security is provided through MFA, which adds an additional layer of protection by requiring multiple forms of verification before granting access.

1. **User Provisioning and Deprovisioning (用户配备和去配备)**: Administrators can automate user provisioning and deprovisioning processes, ensuring that users have appropriate access based on their roles within the organization.

1. **Audit and Compliance (审计和合规性)**: AWS SSO provides audit logs that help in monitoring user activities, access requests, and overall system usage. This supports compliance requirements and security monitoring.

1. **Customization and Branding (定制和品牌化)**: Organizations can customize the login page and user interface to match their branding, providing a consistent user experience.

AWS Single Sign-On streamlines access management and enhances security by reducing the need for users to remember multiple passwords. It is especially valuable in organizations that utilize multiple AWS accounts and external applications, simplifying the authentication process and improving overall security posture.

![file](https://i.imgur.com/lqUBEPp.png)

引用:https://aws.amazon.com/jp/blogs/news/introducing-aws-single-sign-on/

# Infrastructure Protection (基础设施保护)
(aka. IT Infrastructure security / Cybersecurity for Infrastructure) 

Refers to the set of practices, measures, and technologies put in place to safeguard critical information technology (IT) infrastructure, systems, and assets from unauthorized access, disruption, misuse, or destruction.

The goal of infrastructure protection is to ensure the confidentiality, integrity, and availability of information and resources within an organization's IT environment. This involves protecting against various cyber threats, including cyberattacks, malware, unauthorized access, data breaches, and other potential risks that can compromise the security and stability of the infrastructure.

Key components and aspects:

1.** Access Control (访问控制)**: Implementing measures to control and manage access to systems and data, ensuring that only authorized users have the appropriate level of access.

1. **Firewalls and Network Security (防火墙和网络安全)**: Utilizing firewalls and other network security measures to monitor and control incoming and outgoing network traffic, preventing unauthorized access and potential threats.

1. **Intrusion Detection and Prevention Systems (IDPS / 入侵检测和防御系统)**: Employing IDPS to detect and respond to suspicious activities or potential intrusions in real-time to mitigate threats promptly.

1. **Endpoint Protection (终端保护)**: Securing individual devices (endpoints) such as computers, mobile devices, and servers from various security threats using antivirus software, anti-malware tools, and security patches.

1. **Data Encryption (数据加密)**: Encrypting sensitive data to protect it from unauthorized access, especially during data transmission or when stored on devices or servers.

1. **Security Audits and Monitoring (安全审计和监控)**: Conducting regular security audits, monitoring system activities, and analyzing logs to identify security vulnerabilities and take necessary preventive actions.

1. **Disaster Recovery and Redundancy (灾难恢复和冗余)**: Establishing disaster recovery plans and redundancy measures to ensure business continuity in case of system failures, disasters, or cyber-attacks.

1. **Incident Response Plans (事件响应计划)**: Developing incident response plans and procedures to efficiently respond to and recover from security incidents, minimizing potential damage and downtime.

1. **Patch Management (补丁管理)**: Regularly updating and applying security patches to address known vulnerabilities and weaknesses in software and hardware components.

1. **Security Awareness and Training (安全意识和培训)**: Providing education and training to employees and users to raise awareness about security best practices, social engineering, and potential security threats.

Infrastructure Protection is a critical aspect of overall cybersecurity, ensuring the stability and integrity of an organization's IT environment. It requires a comprehensive and proactive approach to identify, assess, and mitigate potential risks and vulnerabilities effectively.

![file](https://i.imgur.com/l6K26jn.png)

引用:https://www.thelightningpress.com/critical-infrastructure-protection/

## AWS Shield (AWSシールド)
Is a managed DDoS protection service provided by AWS. It is designed to safeguard AWS infrastructure and applications from the adverse effects of DDoS attacks. DDoS attacks attempt to overwhelm a target, such as a website or online service, with a flood of traffic, causing disruption and unavailability.

Key features of AWS Shield include:

1. **DDoS Protection (DDoS防护)**: AWS Shield provides automatic protection against DDoS attacks, helping to minimize downtime and ensure the availability of applications.

1. **Layer 3-4 and Layer 7 Protection (第3-4层和第7层防护)**: It protects against both network and application layer DDoS attacks, covering a wide range of potential threats.

1. **Global Anycast Network (全球Anycast网络)**: Utilizes a global network that can absorb large-scale DDoS attacks, spreading the traffic across multiple locations to mitigate the impact.

1. **Intelligent DDoS Mitigation (智能DDoS缓解)**: AWS Shield uses machine learning and automated traffic analysis to detect and mitigate DDoS attacks in real-time.

1. **Always-On Protection (始终保护)**: Offers continuous protection for applications and websites hosted on AWS, safeguarding against both known and emerging DDoS threats.

1. **Integration with AWS WAF (与AWS WAF集成)**: Can be seamlessly integrated with AWS Web Application Firewall (WAF) to provide comprehensive protection against a variety of threats, including DDoS attacks and application layer attacks.

AWS Shield helps organizations to ensure their applications remain accessible and operational during DDoS attacks, enhancing the overall security posture of their AWS-hosted resources.

![file](https://i.imgur.com/zJ3rDDo.png)

引用:https://aws.amazon.com/jp/shield/

## AWS Firewall Manager
AWS Firewall Manager is a centralized security management service provided by AWS. It allows organizations to easily configure and manage firewall rules and policies across multiple AWS accounts and resources. With AWS Firewall Manager, security administrators can apply and enforce security rules consistently to help protect their applications and data.

Key features:

1. **Centralized Rule Management (集中化规则管理)**: Security administrators can centrally configure and manage firewall rules for WAF and AWS Shield Advanced.

1. **Application and Resource Grouping (应用程序和资源分组)**: AWS Firewall Manager allows the grouping of applications and resources, making it easier to apply rules based on specific business requirements.

1. **Integration with AWS Organizations (与AWS组织集成)**: Integration with AWS Organizations enables the management of firewall rules across all member accounts of an organization.

1. **Compliance and Reporting (合规性和报告)**: Provides compliance and reporting capabilities to ensure that security policies are followed and to generate reports on security posture and rule effectiveness.

1. **Automated Security Policy Enforcement (自动化安全策略强制执行)**: Enables the automatic application of security policies across multiple accounts and resources, helping ensure consistent security posture.

AWS Firewall Manager simplifies the task of managing security across complex AWS environments, providing a centralized and streamlined approach to firewall rule management and enforcement.

![file](https://i.imgur.com/mz7RZzU.png)

引用:https://aws.amazon.com/jp/firewall-manager/

## AWS Web Application Firewall (WAF)
AWS WAF is a managed firewall service provided by AWS to protect web applications from various web-based attacks. It helps organizations secure their web applications by allowing them to control and filter traffic based on defined security rules.

Key features of AWS WAF include:

1. **Web Traffic Control (Web流量控制)**: AWS WAF enables organizations to control and filter web traffic to their applications by defining customizable rules and policies.

1. **Protection Against Common Threats (防御常见威胁)**: It offers protection against common web vulnerabilities and exploits, such as SQL injection, cross-site scripting (XSS), and more.

1. **Integration with AWS Services (与AWS服务集成)**: AWS WAF can be seamlessly integrated with other AWS services, providing security for applications hosted on Amazon CloudFront, Application Load Balancer, and API Gateway.

1. **Rule Management (规则管理)**: Users can create and manage rules to block, allow, or monitor requests based on various criteria like IP addresses, country of origin, or HTTP headers.

1. **Real-Time Monitoring and Logging (实时监控和日志记录)**: AWS WAF provides real-time monitoring and detailed logging, allowing users to monitor traffic patterns and identify potential threats.

AWS WAF helps organizations maintain a secure web application environment by offering protection against a wide range of web-based attacks and providing the tools to customize and manage security rules.

![file](https://i.imgur.com/HQQqjbv.png)

引用:https://aws.amazon.com/jp/waf/

# Date Protection
AWS Data Protection involves a comprehensive set of services, tools, and best practices provided by AWS to help ensure the security, privacy, and compliance of data stored, processed, and transmitted in the AWS cloud environment.

Key aspects:

1. **Encryption (加密)**: AWS offers various encryption mechanisms to protect data at rest and in transit. This includes server-side encryption for storage services (e.g., Amazon S3, Amazon EBS) and encryption in transit using protocols like SSL/TLS.

1. **Identity and Access Management (IAM / 身份和访问管理)**: AWS IAM allows organizations to manage access to AWS services and resources securely. Controlling who has access to data and services is a fundamental part of data protection.

1. **Key Management Service (KMS / 密钥管理服务)**: AWS KMS provides a fully managed encryption key management service to create, control, and manage cryptographic keys used for data encryption.

1. **Data Masking and Anonymization (数据脱敏和匿名化)**: Techniques such as data masking and anonymization help protect sensitive information by replacing, encrypting, or obfuscating identifiable data, making it difficult to link back to individuals.

1. **Compliance and Regulatory Controls (合规性和监管控制)**: AWS provides services and features that help customers comply with various data protection regulations and industry standards by offering configurations and controls to meet specific compliance requirements.

1. **Secure Data Transfer (安全数据传输)**: AWS provides secure data transfer options, including Virtual Private Cloud (VPC) and Direct Connect, to establish private network connections and ensure secure data transmission between on-premises environments and AWS.

1. **Data Loss Prevention (DLP / 数据丢失防止)**: AWS offers DLP solutions to monitor and protect sensitive data, helping organizations identify and prevent unauthorized exposure or transmission of sensitive information.

1. **Backup and Disaster Recovery (备份和灾难恢复)**: AWS provides backup and disaster recovery solutions to ensure data resilience and availability in case of accidental deletion, hardware failure, or other incidents.

1. **Secure Data Deletion (安全数据删除)**: AWS provides mechanisms to securely delete data, ensuring that it is unrecoverable when no longer needed.

AWS Data Protection is designed to help organizations maintain the confidentiality, integrity, and availability of their data, meeting both regulatory requirements and internal security policies.

## AWS Macie (AWSメイシー)
AWS Macie is a managed security service provided by AWS that utilizes machine learning and artificial intelligence to automatically discover, classify, and protect sensitive data such as personally identifiable information (PII), intellectual property, and financial data.

>利用机器学习和人工智能自动发现、分类和保护诸如个人身份信息（PII）、知识产权和财务数据等敏感数据

>機械学習による機密データの検出、分類、保護）

Key features:

1. **Data Discovery and Classification (数据发现和分类)**: Macie uses advanced machine learning to identify and classify sensitive data within AWS environments, helping organizations understand and manage their data exposure risks.

1. **Sensitive Data Protection (敏感数据保护)**: Macie provides monitoring and protection for sensitive data, allowing organizations to set up alerts and automate responses to potential security risks and policy violations.

1. **Contextual Insights (上下文洞察力)**: Macie provides contextual insights into data access and usage patterns, enabling better understanding of how sensitive data is accessed and shared.

1. **Compliance and Privacy Reporting (合规和隐私报告)**: Macie offers compliance and privacy reporting features, helping organizations comply with various data privacy regulations and demonstrate their adherence to industry standards.

1. **Integration with AWS Services (与AWS服务集成)**: Macie integrates seamlessly with various AWS services, enabling easy setup and deployment for monitoring and protecting sensitive data across the AWS ecosystem.

AWS Macie helps organizations meet regulatory requirements, protect their intellectual property, and enhance data privacy by identifying and safeguarding sensitive information effectively.

![file](https://i.imgur.com/ayvFbZB.png)

引用:https://aws.amazon.com/jp/macie/

## AWS Key Management Service (KMS)
Is a fully managed encryption service provided by AWS. It allows you to create, manage, and control encryption keys used to secure your data and integrate them with various AWS services and your applications.

>创建、管理和控制用于保护数据的加密密钥，并将其与各种AWS服务和应用程序集成

>アプリケーションと AWS のサービス全体で暗号キーを作成、管理、制御する

Key features:

1. **Key Generation and Management (密钥生成和管理)**: AWS KMS enables the generation and management of encryption keys used to encrypt and decrypt data.

1. **Secure and Centralized Key Storage (安全和集中化的密钥存储)**: KMS provides secure and centralized key storage, ensuring that encryption keys are safeguarded and controlled.

1. **Integration with AWS Services (与AWS服务集成)**: KMS integrates seamlessly with various AWS services, allowing encryption of data in services like Amazon S3, Amazon EBS, Amazon RDS, and more.

1. **Key Usage Policies and Access Control (密钥使用策略和访问控制)**: Users can define key usage policies to control how encryption keys are used and who has access to them, enhancing security.

1. **Multi-Region Replication (多区域复制)**: KMS allows for replication of keys in multiple AWS regions to enhance availability and durability.

1. **Hardware Security Modules (HSMs / 硬件安全模块)**: KMS uses dedicated HSMs to further enhance the security of the key storage and management process.

1. **Integration with AWS CloudTrail (与AWS CloudTrail集成)**: AWS KMS integrates with AWS CloudTrail to provide detailed audit logs for key usage and key management activities.

AWS Key Management Service (KMS) helps organizations meet compliance requirements, protect sensitive data, and ensure secure encryption practices across their AWS environments.

![file](https://i.imgur.com/wy14zMy.png)

引用:https://aws.amazon.com/jp/kms/

## AWS CloudHSM (Cloud Hardware Security Module)
Is a fully managed hardware security service offered by AWS that provides secure key storage and cryptographic operations within a dedicated hardware security module.

Key features:

1. **Dedicated Hardware Security Module (专用硬件安全模块)**: AWS CloudHSM utilizes dedicated FIPS 140-2 Level 3 validated hardware security modules to securely store and manage cryptographic keys and perform cryptographic operations.

1. **Secure Key Storage (安全密钥存储)**: CloudHSM provides a highly secure environment for key storage, protecting sensitive data such as encryption keys.

1. **Integration with AWS Services (与AWS服务集成)**: CloudHSM can be seamlessly integrated with various AWS services and applications, allowing secure key storage and cryptographic operations within the AWS ecosystem.

1. **Custom Cryptographic Operations (自定义加密操作)**: Users have the flexibility to perform custom cryptographic operations, including encryption, decryption, digital signatures, and more, using the CloudHSM.

1. **High Availability and Redundancy (高可用性和冗余)**: AWS CloudHSM offers high availability and redundancy, ensuring continuous access to keys and cryptographic capabilities.

1. **Compliance and Security Controls (合规性和安全控制)**: CloudHSM helps organizations meet compliance requirements and security controls by providing a secure hardware-based solution for key management and cryptographic operations.

1. **Integration with AWS Key Management Service (KMS) (与KMS集成)**: CloudHSM can be used as a custom key store within AWS KMS, allowing for the management and storage of keys in the dedicated hardware module.

AWS CloudHSM is suitable for applications and workloads that require the highest levels of security for key management and cryptographic operations.

![file](https://i.imgur.com/UjLbWhf.png)

引用:https://aws.amazon.com/jp/cloudhsm/

## AWS Certificate Manager
Is a managed service provided by AWS that allows you to provision, manage, and deploy SSL/TLS certificates for use with AWS services and your internal resources.

Key features:

1. **SSL/TLS Certificates (SSL/TLS证书)**: ACM provides SSL/TLS certificates to secure network communications and enable encrypted data transfer.

1. **Automated Certificate Management (自动化证书管理)**: ACM automates the process of certificate provisioning, renewal, and management, reducing administrative overhead.

1. **Integration with AWS Services (与AWS服务集成)**: ACM seamlessly integrates with various AWS services, making it easy to deploy SSL/TLS certificates for services like Amazon CloudFront, AWS Elastic Load Balancer, API Gateway, and more.

1. **Public and Private Certificates (公共和私有证书)**: ACM supports both public and private SSL/TLS certificates, catering to various use cases, including public-facing websites and internal applications.

1. **Renewal and Auto-Rotation (续订和自动轮换)**: ACM manages certificate renewals and auto-rotates them, ensuring that certificates are always up to date and secure.

1. **Secure Certificate Storage (安全的证书存储)**: ACM securely stores and manages SSL/TLS certificates in AWS, safeguarding them from unauthorized access.

Custom Domain Validation: ACM supports various domain validation methods to ensure that the requester has control over the domain for which the certificate is requested.

Using ACM, you can simplify the process of obtaining and managing SSL/TLS certificates, ensuring that your applications and services are encrypted and secure.

![file](https://i.imgur.com/WfnZfrB.png)

引用:https://aws.amazon.com/jp/certificate-manager/

To be continued...
