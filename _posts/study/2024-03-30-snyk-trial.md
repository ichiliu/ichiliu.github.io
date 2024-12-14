---
layout: post
title: Trial Snyk Open Source Personally
subtitle: 
cover-img: [/assets/img/cover/study1.jpg, /assets/img/cover/study2.jpg, /assets/img/cover/study3.jpg]
thumbnail-img: https://i.imgur.com/7rkJS6d.png
share-img:
tags: [Snyk]
categories: [Study]
---

## About Snyk
Snyk is a developer-first security platform that helps software-driven businesses enhance security posture by finding, prioritizing, and fixing vulnerabilities in open-source libraries and containers.

https://snyk.io/

![file](https://i.imgur.com/7rkJS6d.png)

<!-- vim-markdown-toc GFM -->

* [Key Features and functionalities of Snyk](#key-features-and-functionalities-of-snyk)
* [Start free with Github](#start-free-with-github)
  * [Steps](#steps)
* [Install or update the Snyk CLI](#install-or-update-the-snyk-cli)
  * [Install with standalone executables](#install-with-standalone-executables)
  * [Authenticate the CLI with Snyk account](#authenticate-the-cli-with-snyk-account)
* [Add projects on Snyk UI](#add-projects-on-snyk-ui)
* [Snyk Code](#snyk-code)
* [Open a fix PR](#open-a-fix-pr)
  * [Project Page](#project-page)

<!-- vim-markdown-toc -->

## Key Features and functionalities of Snyk
- Vulnerability Detection: Snyk scans your codebase and dependencies to identify vulnerabilities in open-source libraries and container images. It provides detailed information about each vulnerability, including severity level, impact, and remediation steps.
- Continuous Monitoring: Snyk offers continuous monitoring of your codebase and dependencies to detect newly discovered vulnerabilities. It notifies you of any newly identified security issues so that you can take immediate action to address them.
- Integration with Development Workflow: Snyk seamlessly integrates with popular development tools and platforms such as GitHub, GitLab, Bitbucket, Jenkins, and IDEs like VS Code and IntelliJ IDEA. This allows developers to incorporate security checks into their existing workflows.
- Remediation Guidance: Snyk provides actionable remediation guidance to help developers fix vulnerabilities efficiently. It offers suggestions for upgrading to patched versions, applying workarounds, or using alternative libraries to mitigate security risks.
- Container Security: In addition to open-source library vulnerabilities, Snyk also focuses on container security. It scans container images for vulnerabilities and provides insights into container security posture, helping organizations secure their containerized applications.
- Policy Enforcement: Snyk allows you to define security policies based on your organization's requirements and compliance standards. It enforces these policies during the development process, ensuring that only secure code and dependencies are deployed into production.

## Start free with Github
Create your free Snyk account to start securing AI-generated code in minutes. Or book an expert demo to see how Snyk can fit your developer security use cases.

### Steps
- Sign in to GitHub to continue to Snyk Login

![file](https://i.imgur.com/Gf2cFn9.png)

- Choose the code you want to scan

![file](https://i.imgur.com/XtUoVdN.png)

- Set access permissions

![file](https://i.imgur.com/8Hcx2oj.png)

- Configure automation settings & authenticate

![file](https://i.imgur.com/bv6mHYV.png)

- Authorize Snyk

![file](https://i.imgur.com/EYqWo9G.png)

After the above steps, the following syny UI is displayed.

![file](https://i.imgur.com/KhPMJXF.png)

## Install or update the Snyk CLI
ref: https://docs.snyk.io/snyk-cli/install-or-update-the-snyk-cli

### Install with standalone executables
```sh
$ curl --compressed https://static.snyk.io/cli/latest/snyk-macos -o snyk
$ chmod +x ./snyk
$ mv ./snyk /usr/local/bin/
$ snyk --version
1.1286.2
```

### Authenticate the CLI with Snyk account
ref: https://docs.snyk.io/snyk-cli/authenticate-the-cli-with-your-account

```sh
$ snyk auth
```

Then a browser is launched the authentication dialog, after entering my github account and password,
the following page appears,

![file](https://i.imgur.com/UpEXW0a.png)

After clicking "Authenticate",

![file](https://i.imgur.com/yfJYsnR.png)

## Add projects on Snyk UI
I want to add some projects that contain vulnerabilities for testing, so I found the following two repos:
- https://github.com/Neo23x0/log4shell-detector
- https://github.com/christophetd/log4shell-vulnerable-app

After forking the above repos, I added them to the Snyk UI

![file](https://i.imgur.com/eDO1VPm.png)

There are some critical, high and medium vulnerabilities, one of them is the famous Log4Shell.

![file](https://i.imgur.com/4ezOrxZ.png)

## Snyk Code
In additional to SCM, Snyk Code detected some vulnerabilities as follows:

![file](https://i.imgur.com/Ni3WSCX.png)

On the project detail page, the vulnerability is a "Path Traversal"

![file](https://i.imgur.com/TO3fhtr.png)

## Open a fix PR

### Project Page

![file](https://i.imgur.com/3glokYr.png)

Click the "Open a fix PR" and then,

![file](https://i.imgur.com/rOpW579.png)

Something went wrong...

![file](https://i.imgur.com/2mS9yAh.png)

To be continued...
