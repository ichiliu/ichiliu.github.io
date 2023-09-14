---
layout: post
title: Backup EBS to S3 by AMI
subtitle: 
date: 2022-11-06 01:05:00 +0900
cover-img: [/assets/img/cover/technology1.jpg, /assets/img/cover/technology2.jpg, /assets/img/cover/technology3.jpg]
thumbnail-img: https://i.imgur.com/bl7gTfY.png
share-img:
tags: [EBS, S3, AMI]
categories: [Technology]
---

## What I want to do?
* Backup EBS to S3 by AMI every week.
* Maximum to four generations.

![file](https://i.imgur.com/bl7gTfY.png)

## Work Steps
1. Making Lifecycle Policy
   ![file](https://i.imgur.com/hmMtxsM.png)
   
   and then select "volumn" and input tag information.
   ![file](https://i.imgur.com/2tt9I60.png)
   
   and then using the default role.
   ![file](https://i.imgur.com/KqqCKHB.png)
   
   and then setting tags
   ![file](https://i.imgur.com/xI4jbcP.png)
   
   and then setting policy status to valid
   ![file](https://i.imgur.com/gYrDNnK.png)
   
   and setting do not reboot the instance
   ![file](https://i.imgur.com/krqPNqY.png)
   
1. Setting Schedules
   At 6 am on Monday of JST is equal to at 21 pm on Sunday of UTC
　　　![file](https://i.imgur.com/o8BQTut.png)
   
   the other settings
   ![file](https://i.imgur.com/UiXZC39.png)
   
1. Reviewing
   Detail of the policy
   ![file](https://i.imgur.com/mC7N8mt.png)
   
   and detail of the schedules
   ![file](https://i.imgur.com/Xu7Wq4A.png)

1. Completing
   ![file](https://i.imgur.com/eW5A5Em.png)

## Result of AMI
As the result of the first backup made by AMI
![file](https://i.imgur.com/pZKpQHA.png)

The detail of the above AMI
![file](https://i.imgur.com/QjUFSIQ.png)

The creation date indicates that the AMI was created after 6 a.m. on Monday of Japan, just the same as the descrption. AMI was well done!
   
## Reference
+ [AMI ライフサイクルの自動化](https://docs.aws.amazon.com/ja_jp/AWSEC2/latest/UserGuide/ami-policy.html)
