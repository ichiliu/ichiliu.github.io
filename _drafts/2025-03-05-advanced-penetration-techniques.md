---
layout: Post
title: Advanced Penetration Techniques習得記
subtitle: 
cover-img: [/assets/img/cover/study1.jpg, /assets/img/cover/study2.jpg, /assets/img/cover/study3.jpg]
thumbnail-img: 
share-img:
tags: [penetest]
categories: [study]
---

# 概要
[Coursera](https://www.coursera.org/)にある[Advanced Penetration Techniques](https://www.coursera.org/learn/packt-advanced-penetration-techniques-ugb5l)コースを習得するために、学習メモを記録したもの。

Instructors:
- Mr. Daniel Lowrie (A well-known cybersecurity professional, educator, and content creator)
- Mr. Ronnie Wong (A cybersecurity professional and educator)

<!-- vim-markdown-toc GFM -->

* [Studing Notes](#studing-notes)
  * [Exploit Resources (漏洞利用资源)](#exploit-resources-漏洞利用资源)
  * [Denial Of Service](#denial-of-service)
  * [ARP And DNS Poisoning](#arp-and-dns-poisoning)
  * [Password Attacks](#password-attacks)
* [Password Spraying (密码喷射攻击 / パスワードスプレー攻撃)](#password-spraying-密码喷射攻击--パスワードスプレー攻撃)

<!-- vim-markdown-toc -->

# Studing Notes
## Exploit Resources (漏洞利用资源)
- https://www.exploit-db.com/
- https://vulners.com/
- https://packetstormsecurity.com/
- https://google.com -> To Search Vuln Information
- https://github.com -> To Search Vuln Information

## Denial Of Service
- Reflection And Amplification (反射和放大)
- Volumetric Attack (大流量攻击)
- Protocal Attack (协议攻击)
- Application Attack (应用程序攻击)
- Tools
  - hping3 - Send (Almost) Arbitrary Tcp/Ip Packets To Network Hosts
    - Example:
      >\# hping3 --flood <--spoof [偽装アクセス元のIp]> --icmp [攻撃目標のIp] &  
      >\# hping3 --flood --spoof 192.168.0.250 --icmp 192.168.0.80 &

## ARP And DNS Poisoning
- ARP (Address Resolution Protocol) Poisoning
- Commands
  - % arp -a # Be Used To Display The Arp Cache (Macos/Linux/Windows).
  - % arp -n # Displays Ip Addresses Without Resolving Hostnames (Macos/Linux).
  - % arp -d <Ip Address> # Deletes A Specific Arp Entry (Arp -D * Removes All Entries On Windows).
  - % arp -s <Ip Address> <Mac Address> # Adds A Static Arp Entry (Requires Admin Privileges On Windows).
- Common Tools
  - Wireshark
  - tcpdump
    - Example:
    - % sudo tcmdump -i <Network Interface> icmp -w <Output File>&
    - % sudo tcmdump -i En1 Icmp -w ping_capture.pcap&
    - % ping 8.8.8.8 # Google DNS Servers
    - % sudo tcpdump -n -r ping_capture.pcap -x | pbcopy # `| pbcopy` Means Copy To Clipboard
- Arp Poisoning Tools
  - Bettercap
    >A Powerful, Flexible, And Extensible Security Tool Used For Network Attacks, Monitoring, And Penetration Testing. 
  - Ettercap
    >A Network Security Tool Used For Mitm (Man-In-The-Middle) Attacks, Network Sniffing. And Packet Manipulation.  
    >% sudo ettercap -t -i eth1 -m qrp:remote /192.169.1.10/ /192.168.1.20/  
    >Result: All Traffic Between 192.169.1.10 And 192.168.1.20 Is Intercepted By The Attacker.  
    >The Attacker Can Now Sniff, Modify, Or Drop Packets Between Them.
  - Dsniff
    >A Collection Of Network Security Tools Used For Sniffing Passwords And Monitoring Network Traffic. It Is Designed To Capture Plaintext Credentials Transmitted Over Various Protocols, Such As Http, Ftp, Smtp, Imap, And Telnet.
  - Arpspoof
    >A Command-Line Tool Used For Arp (Address Resolution Protocol) Spoofing Attacks. It Is Part Of The Dsniff Suite And Allows An Attacker To Intercept Network Traffic By Sending Forged Arp Replies, Effectively Performing A Man-In-The-Middle (Mitm) Attack.

## Password Attacks
- Hash Cracking
  - Brute-Force  
  - Dictionary
- Tools
  - Cewl
    - Cewl (Custom Word List Generator) is a password cracking and social engineering tool used to create custom wordlists from website content.
    - It is designed for penetration testers and ethical hackers to gather context-specific words that can be used in brute-force and dictionary attacks against login systems.
  - John the Ripper
    - Example:
      - Preparing a password list file wordlist.txt
        ```
        12345
        password
        qwerty
        letmein
        welcome
        secret
        admin
        ```
      - Making a passwd file password.txt likes this
        ```
        user1:$1$saltstring$qQY4WxjABChYG1ccLpfkz/
        user2:$1$saltstring$QTO6JC6Q8mH9rFmjXsvtT.
        ```

        BTW, the hash likes `qqy4wxjabchyg1cclpfkz/` is generated the following command
        ```
        # openssl passwd -1 -salt saltstring password
        $1$saltstring$qQY4WxjABChYG1ccLpfkz/
        # openssl passwd -1 -salt saltstring admin
        $1$saltstring$QTO6JC6Q8mH9rFmjXsvtT.
        ```
        >md5crypt, used for password hashing on unix systems, limits the salt to 8 characters, ignoring any excess.

      - Running the following command to hack (on kali linux)
        ```
        # john --wordlist=wordlist.txt --format=md5crypt password.Txt
        ..省略..
        admin            (user2)     
        password         (user1)     
        ..省略..
        ```
        - Try using sha-512-crypt (\$6\$)
          ```
          # openssl passwd -6 -salt randomsalt 12345 | tee password.txt
          $6$randomsalt$xtHmIxnmWmusizQhZM9zN1IRwXFfxIrrOY6sS92J/69QPf8rSYsg/iYRKvpwfcDJeQ33R/AxB3EahA2FlJS6.1

          # john --wordlist=wordlist.txt --format=sha512crypt password.txt
          ..省略..
          No password hashes left to crack (see faq)
          ```
      - Trouble Shooting  
        The command above `hohn --wordlist=wordlist.txt --format=sha512crypt password.txt` didn't work. In this case perfor the following command
        ```
        # cat ~/.john/john.pot
        $1$randomsa$d8b0kohdyuesco.0x0ngg0:password
        $1$randomsa$8afsmry8dgoxxkbn23wfi0:qwerty
        $1$randomsa$oq91yvhtw.Gr4ri64zrtd0:letmein
        $1$saltstring$qto6jc6q8mh9rfmjxsvtt.:admin
        $1$saltstring$qqy4wxjabchyg1cclpfkz/:password
        $6$saltstring$addbxsjjcdlq2662qpgd.tksovmng9tt3oxl4hr60susc3agjirndenvzp3dgwlwqy6iykczannhax9dr72nn1:password
        $6$randomsalt$xthmixnmwmusizqhzm9zn1irwxffxirroy6ss92j/69qpf8rsysg/iyrkvpwfcdjeq33r/axb3eaha2fljs6.1:12345

        # rm ~/.john/john.pot
        # john --incremental password.txt
        ..省略..
        12345            (?)     
        ..省略..
        ```
  - Hashcat
    >s a powerful and versatile password-cracking tool that is used to recover passwords from various types of hash algorithms.
  - Ophcrack
    >is an open-source Windows password recovery tool that uses rainbow tables to crack password hashes, specifically LM (LAN Manager) and NTLM (New Technology LAN Manager) hashes stored in the Windows SAM (Security Account Manager) database.

# Password Spraying (密码喷射攻击 / パスワードスプレー攻撃)
Is a type of brute force attack where an attacker tries a small number of commonly used passwords across many different accounts, rather than attempting many different passwords on a single account.

- Mitigation
  - Implementing Account Lockout Mechanisms
  - Enforcing Strong Password Policies
  - Multi-Factor Authentication (MFA)
  - Monitoring and Alerts

- Hydra
  - A fast, powerful brute-force tool for cracking network authentication, supporting protocols like SSH, RDP, FTP, HTTP, and MySQL 
  - Example: Brute-force SSH Login with Hydra
    - Attack ssh login user "admin" with multiple passwords
      ```
      # hydra -l admin -P passwords.txt ssh://192.168.1.100
      ```
    - Advanced Example: Parallel Attack with Multiple Threads
      ```
      # hydra -L user_list.txt -P passwords.txt -t 4 ssh://192.168.1.100
      ```

- Medusa
  - A fast, parallel brute-force password-cracking tool for testing network authentication. It supports multiple protocols, offers high customization, and fine-grained threading control. More modular than Hydra, both tools are used for ethical penetration testing.
  - Example: Brute-force SSH Login
    >To attempt brute-forcing the SSH login for the admin user at the specified IP address (192.168.1.100) using passwords from the passwords.txt file. 

    ```
    # medusa -h 192.168.1.100 -u admin -P passwords.txt -M ssh
    ```
