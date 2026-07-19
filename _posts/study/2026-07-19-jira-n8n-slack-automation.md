---
layout: post
title: Jira → n8n → Slack DM Automation: Automatically Notify the Jira Reporter
subtitle: 
cover-img: [/assets/img/cover/study1.jpg, /assets/img/cover/study2.jpg, /assets/img/cover/study3.jpg]
thumbnail-img: https://i.imgur.com/YCTXd2z.png
share-img:
tags: [Jira, n8n, Slack, Automation]
categories: [Study]
---

# Goal
Automatically send a Slack Direct Message (DM) to the Jira reporter whenever a new Jira issue is created.

<!-- vim-markdown-toc GFM -->

* [Architecture](#architecture)
* [Environment](#environment)
* [Prerequisites](#prerequisites)
  * [Jira Cloud](#jira-cloud)
  * [n8n](#n8n)
  * [Slack Workspace](#slack-workspace)
  * [Slack App](#slack-app)
  * [n8n Slack Credential](#n8n-slack-credential)
* [Step 1. Expose n8n to the Internet](#step-1-expose-n8n-to-the-internet)
* [Step 2. Create a Jira Automation Rule](#step-2-create-a-jira-automation-rule)
* [Step 3. Build the n8n Workflow](#step-3-build-the-n8n-workflow)
* [Step 4. Look Up the Slack User](#step-4-look-up-the-slack-user)
* [Step 5. Send the DM](#step-5-send-the-dm)
* [Result](#result)
* [Problems I Encountered](#problems-i-encountered)
* [Lessons Learned](#lessons-learned)
* [Next Steps](#next-steps)

<!-- vim-markdown-toc -->

# Architecture
The overall architecture is shown below.
```text
                   +----------------+
                   |   Jira Cloud   |
                   +--------+-------+
                            |
                            | Jira Automation
                            |
                            v
                 HTTPS Webhook Request
                            |
                            v
               +-----------------------+
               |      Cloudflare       |
               |        Tunnel         |
               +-----------+-----------+
                           |
                           v
                    +-------------+
                    |     n8n     |
                    +------+------+ 
                           |
          +----------------+----------------+
          |                                 |
          v                                 v
 Lookup Slack User                 Send Slack DM
    by Email                         to Reporter
```

# Environment
The environment used in this article:

| Component | Version / Service |
|-----------|-------------------|
| Jira | Jira Cloud |
| n8n | Self-hosted (Docker) |
| Slack | Slack Workspace |
| Cloudflare | Tunnel |
| OS | macOS |
| Container Runtime | Docker + Colima |

# Prerequisites
Before building this automation, make sure the following components are already configured.
## Jira Cloud
A Jira Cloud instance with:

- A project for testing
- Permission to create Jira Automation rules
- Permission to create Web Requests

## n8n
A self-hosted n8n instance.

In my environment:
- Docker
- Colima
- macOS
- Cloudflare Tunnel

The n8n instance is publicly accessible through a secure HTTPS URL.

Example:
```text
https://automation.example.com
```

>Note
>
>Jira Cloud cannot call a webhook running on localhost.
>A public HTTPS endpoint (e.g., Cloudflare Tunnel) is required.

## Slack Workspace
A Slack workspace where the Jira reporters are members.

## Slack App
Create a Slack App from Slack API.

Configure the following Bot Token Scopes:
```text
users:read
users:read.email
chat:write
im:write
```

Install the app into your Slack workspace and obtain the Bot User OAuth Token:
```text
xoxb-xxxxxxxxxxxxxxxx
```

This token will be used by n8n to:

- Look up a user by email
- Send Direct Messages (DMs)

## n8n Slack Credential

# Step 1. Expose n8n to the Internet
Since Jira Cloud cannot access localhost, I exposed my local n8n instance through Cloudflare Tunnel.

```text
Jira
    │
Internet
    │
Cloudflare Tunnel
    │
localhost:5678
```

- Webhook URL:
  ```text
  https://<my-subdomain>.<my-domain>/webhook/jira-test
  ``` 

Cloudflare Tunnel is free for personal use and is a secure way to expose local services to the Internet. It also provides a public URL that can be used in Jira Automation.

![file](https://i.imgur.com/fkR9Nlt.png)

Tunneling through Cloudflare allows me to run n8n locally while still being able to receive webhooks from Jira Cloud.

![file](https://i.imgur.com/zFfvoCl.png)

# Step 2. Create a Jira Automation Rule
- Trigger:
  ```text
  Work item created
  ```

- Action:
  ```text
  Send web request
  ```

- Method:
  ```text
  POST
  ```

- Request body:
  ```json
  {
    "issue": {
      "key": "{{issue.key}}",
      "summary": "{{issue.summary}}",
      "reporter": "{{issue.reporter.displayName}}",
      "reporterEmail": "{{issue.reporter.emailAddress}}"
    }
  }
  ```

  ![file](https://i.imgur.com/YCTXd2z.png)

# Step 3. Build the n8n Workflow
```text
- Webhook
      │
      ▼
Slack
(Look up user by email)
      │
      ▼
Slack
(Send message)
      │
      ▼
Respond to Webhook
```

# Step 4. Look Up the Slack User
- Slack node:
  ```text
  Resource
      User

  Operation
      Look Up by Email
  ```

- Expression:
  ```json
  {{$json.body.issue.reporterEmail}}
  ```

- Slack returns:
  ```json
  {
      "id": "U012345678",
      "real_name": "Firstname Lastname",
      ...
  }
  ```

# Step 5. Send the DM
- Slack node:
  ```text
  Resource
      Message

  Operation
      Send
  ```

- Destination:
  ```text
  User
  ```

- Selection:
  ```text
  By ID
  ```

- Expression:
  ```json
  {{$node["Look up a user by email"].json.id}}
  ```

- Message:
  ```text
  Hello {{$node["Look up a user by email"].json.real_name}}!

  Issue:
  {{$node["Webhook"].json.body.issue.key}}

  Summary:
  {{$node["Webhook"].json.body.issue.summary}}
  ```

# Result
Whenever a Jira issue is created:
```text
Jira
    ↓
n8n
    ↓
Slack DM
```

The reporter immediately receives a Direct Message from:
```text
Jira Automation
```
Which is sent by the Slack bot.

# Problems I Encountered
- Reporter email was empty  
  Wrong:
  ```json
  {{reporterEmail}}
  ```
  Corrent:
  ```json
  {{issue.reporter.emailAddress}}
  ``` 

- "Respond to Webhook" error

The Webhook node was configured to:
```text
Using 'Respond to Webhook' Node
```

Therefore, the workflow must end with:
```text
Respond to Webhook
```

![file](https://i.imgur.com/cWkbKyg.png)

# Lessons Learned
- Use Cloudflare Tunnel to expose a local n8n instance securely.
- Jira Automation can send rich JSON payloads to n8n.
- Slack's Look Up by Email operation makes it easy to identify a user.
- A Bot Token (xoxb-...) sends messages as the Slack App rather than as a personal user.
- n8n's node-based workflow makes integrating SaaS services straightforward.

# Next Steps

The next improvement is to make the workflow production-ready by adding:

- Data normalization (Edit Fields node)
- Better Slack message formatting (Block Kit)
- Error handling
- Logging
- Reusable sub-workflows

Eventually, this workflow will become one component of a larger Company AI Assistant, integrating Slack, Jira, Notion, and AI through n8n.


