---
layout: post
title: Penetration Testing Study
permalink: /security/penetration-testing-study
subtitle: 
cover-img: [/assets/img/cover/security1.jpg, /assets/img/cover/security2.jpg, /assets/img/cover/security3.jpg]
thumbnail-img: https://i.imgur.com/ksR28RZ.png
share-img:
tags: [Penetration Test]
categories: [Security]
---

# Abstruct
I want to study the skill of penetration testing (pen test), so I purchased a lesson named [Full Ethical Hacking & Penetration Testing Course | Ethical](https://www.udemy.com/course/full-ethical-hacking-penetration-testing-course/) on udemy.com.

Here, I write my note of studying the lesson.

![file](https://i.imgur.com/ksR28RZ.png)

# About Penetration Testing
Also known as **pen testing** or **ethical hacking**, is a type of security testing conducted to identify vulnerabilities and weaknesses in computer systems, networks, applications, or other digital assets.

## Types of Pen Testing
1. Network Penetration Testing
Focuses on identifying vulnerabilities in a network infrastructure.

1. Web Application Penetration Testing
Used to identify security vulnerabilities in web applications.

1. Mobile Application Penetration Testing
Used to identify vulnerabilities in mobile applications.

1. Wireless Network Penetration Testing
Used to identify vulnerabilities in wireless networks.

1. Social Engineering Penetration Testing
Used to test an organization's security awareness and vulnerability to social engineering attacks.

1. Physical Penetration Testing
Used to test an organization's physical security controls.

## Pen Testing vs.Vulnerability Diagnosis 
Pen testing is a method of **actively attempting to exploit vulnerabilities** in a system or application in order to identify weaknesses that could be exploited by an attacker.

Vulnerability diagnosis is a less intrusive approach that aims to identify and assess vulnerabilities **without actively attempting to exploit them**.

## Threat-Led Penetration Test (TLPT) 
A type of penetration testing that is based on the concept of threat intelligence. The goal is to simulate a real-world attack scenario by taking into account the specific threat actors and tactics that are most likely to target a particular organization.

![file](https://i.imgur.com/cajIk93.jpg)

There was a valuable research report by PwC:
[諸外国の「脅威ベースのペネトレーションテスト（TLPT）」に関する報告書](https://www.fsa.go.jp/common/about/research/20180516/TLPT.pdf)

![file](https://i.imgur.com/k0t7mf3.png)
（ref:　The above report）

# Lab Environment
I plan to make the following lab environment to practice the lesson.
![file](https://i.imgur.com/s3j4Lbs.png)

## Oracle VM VirtualBox
At first, I've got to install a virtualization platform likes Oracle VM VirtualBox and VMWare. I determine to use VirtualBox, so I downloaded it from `https://www.virtualbox.org/wiki/Downloads`
And then installed `VirtualBox 7.0.6 for macOS / Intel hosts`.

## Kali Inside VirtualBox
About Kali Linux, ChatGPT told me:
>Kali Linux is a Debian-based Linux distribution designed for advanced penetration testing and security auditing. It is an open-source operating system that comes pre-installed with a wide range of security tools for various tasks, such as vulnerability analysis, digital forensics, reverse engineering, and wireless network assessment. The Kali Linux operating system is maintained and funded by Offensive Security, a leading provider of professional cybersecurity training and certification.
>
>Kali Linux is known for its robust and comprehensive set of tools, including popular tools such as Nmap, Metasploit, Wireshark, John the Ripper, Aircrack-ng, and many others. These tools are frequently used by security professionals, researchers, and ethical hackers to identify and address vulnerabilities in computer systems, networks, and applications. Kali Linux also provides a customizable desktop environment and supports a wide range of hardware platforms, making it a versatile and flexible tool for cybersecurity professionals.
>
>Overall, Kali Linux is a powerful and widely-used tool for conducting security assessments and testing, and is a go-to choice for many cybersecurity professionals and organizations.

I downloaded and installed Kali by following the guide below:
[Kali inside VirtualBox (Guest VM)](https://www.kali.org/docs/virtualization/install-virtualbox-guest-vm/)

Here is the capture of my Kali vbox's settings:
![file](https://i.imgur.com/WAbmdDy.png)

### Updating Kali VM
ref:[KaliLinuxを使えるようになるのだ（基礎編）](https://qiita.com/TAKANEKOMACHI/items/428f47999c834656eb64)
+ First look
```sh
$ cat /etc/os-release
PRETTY_NAME="Kali GNU/Linux Rolling"
NAME="Kali GNU/Linux"
VERSION="2022.4"
VERSION_ID="2022.4"
VERSION_CODENAME="kali-rolling"
ID=kali
ID_LIKE=debian
HOME_URL="https://www.kali.org/"
SUPPORT_URL="https://forums.kali.org/"
BUG_REPORT_URL="https://bugs.kali.org/"
ANSI_COLOR="1;31"
```
+ Update the OS
```sh
# Updating packages information
$ sudo apt-get update
# Updating packages according to information updated above
$ sudo apt-get upgrade
```
+ Set locales for Chinese
Because I try to run Kali Linux in a Chinese language environment, so I set locales to `zh-CN.UTF-8.UTF-8`
```sh
$ sudo dpkg-reconfigure locales
```
Cancel the pre-selected `en_US.UTF-8 UTF-8` and select `zh-CN.UTF-8 UTF-8`.
![file](https://i.imgur.com/df1DiC7.png)

And then preform the following command:
```sh
$ sudo update-locale LANG=zh_CN.UTF-8
```
After restart it, the locale becomes Chinese!
![file](https://i.imgur.com/S33gwB5.png)

+ Set TZ to Asia/Tokyo
```sh
$ sudo dpkg-reconfigure tzdata
```
Select`Asia`->`Tokyo`.
The following command will be ok instead. 
```sh
$ sudo timedatectl set-timezone Asia/Tokyo
```
Later, I found English language is a good study to me, so I changed the locale to en_US.UTF-8 again.
```sh
$ localectl
System Locale: LANG=en_US.UTF-8
    VC Keymap: (unset)         
   X11 Layout: us
    X11 Model: pc105
```
+ Setting Keyboard to Japanese 106
```sh
$ localectl set-x11-keymap jp
```
Confirming...
```sh
$ localectl
System Locale: LANG=en_US.UTF-8
    VC Keymap: jp106
   X11 Layout: jp
```
This sets the Japanese keyboard 106.

## Metasploitable 2
In the udemy's lesson, as an attack target, metasploitable2 VM needs to be installed. I downloaded it from [Metasploitable 2](https://docs.rapid7.com/metasploit/metasploitable-2/).
Metasploitable 2 is created by *RAPID7* and is described as:
>Metasploitable 2 is an intentionally vulnerable Ubuntu Linux virtual machine that is designed for testing common vulnerabilities. This virtual machine (VM) is compatible with VMWare, VirtualBox, and other common virtualization platforms.

### Metasploitable 2 VM
ref: https://tumaboki.com/sec-2/1501/
I installed a Metasploitable 2 as a VM inside VirtualBox.
![file](https://i.imgur.com/sb6qXOk.png)

The credenticals for Metasploitable2 is: `msfadmin:msfadmin`（by default）。

## Vagrant & Metesploitable3
### Vagrant
About vagrant,
>Vagrant is an open-source tool that helps developers create and manage portable virtual development environments. It allows developers to create virtual machines (VMs) or containers that can be quickly and easily configured to match the needs of a particular project or application.
>
>Vagrant simplifies the process of creating and managing virtual development environments, making it easier for developers to collaborate and work on projects across different platforms.

On my host OS（macOS）, I installed vagrant via brew as below:
```sh
$ brew install hashicorp/tap/hashicorp-vagrant
$ which vagrant
/usr/local/bin/vagrant
$ vagrant --version
Vagrant 2.3.4
```
### Metasploitable3
About Metasploitable3,
>Metasploitable3 is a vulnerable virtual machine designed to simulate a realistic and complex environment for security testing and penetration testing. It is based on the Windows operating system and includes a wide range of known vulnerabilities, misconfigurations, and weaknesses that can be exploited by security professionals to test and improve their skills in a safe and controlled environment.

About vagrant box,
>A Vagrant box is a pre-built, reusable, and portable virtual machine image that can be used as a base for creating new virtual development environments. It typically includes a pre-configured operating system, software packages, libraries, and other dependencies required for a specific project or application.

Because I couldn't start Metasploitable3 W2k8 VM following the lesson, I decided to follow the steps of the page [rapid7/metasploitable3](https://github.com/rapid7/metasploitable3).

#### To build automatically
+ Requirements
I should install `Packer` to meet the requirement.
```sh
$ brew install pecker
```
About packer:
>Packer is an open-source tool for creating identical machine images for multiple platforms from a single source configuration. It was developed by HashiCorp and is designed to simplify the process of creating machine images for different platforms such as Amazon Web Services, Google Cloud Platform, Microsoft Azure, and VMware.

+ git clone
```sh
$ mkdir -p <workspace-dir>
$ cd <workspace-dir>
$ git clone https://github.com/rapid7/metasploitable3.git
```
While I was cloning metasploitable3, my avast installed in my computer detected `caidao.asp` as a threat and isolated it to quarantine. So I've got to restore it.

+ build command
```sh
$ cd workspace-dir>/metasploitable3
$ ./build.sh windows2008 
```
To Be Continued...

