---
layout: post
title: Chapter 18 Disaster Recovery Planning
subtitle: 
cover-img: [/assets/img/cover/study1.jpg, /assets/img/cover/study2.jpg, /assets/img/cover/study3.jpg]
thumbnail-img: https://i.imgur.com/Se6UFV3.png
share-img:
tags: [CISSP]
categories: [Study]
---

# Chapter 18 Disaster Recovery Planning (DRP)
DRP is the technical complement to the BCP exercise.
Business continuity management (BCM) encompasses BCP, DRP, and crisis management under a single umbrella.

![file](https://i.imgur.com/Se6UFV3.png)

## The Nature Disaster
### Natural Disasters
#### Earthquakes
Seizmic hazard map

#### Floods
flash floods (山洪暴发)
* Check with responsible individuals and ensure that organization has sufficient insurance in place to protect it from the financial impact of a flood.
* Areas shaded with the darkest color are described as falling within the 100-year floodplain (1%).
* Those shaded more lightly lie within the 500-year floodplain (0.2%).

#### Storms
It's important to regularly monitor weather forecasts from responsible government agencies.

#### Fires
wildfires, camp fires, forest fires 

#### Pandemics
#### Other Natural Events
#### Human-Made Disasters
* Fires
* Acts of Terrorism  
General business insurance may not properly cover an organization against acts of terrorism.
* Bombings/Explosions (爆炸/爆炸)  
From a disaster planning perspective, the effects of bombings and explosions are like those caused by a large-scale fire.
* Power Outages
  * What is your planning horizon? 
  * Do you need enough fuel and other supplies to last for 48 hours? Seven days?

* Network, Utility, and Infrastructure Failures
* Hardware/Software Failures 
BCP/DRP teams must provide adequate redundancy in their systems.
  * Far enought away from the main site.
  * Threats are both internal and external.
  * Disasters don't usually come with advance warning.

* Strikes/Picketing (罢工/纠察)
  * Human factor is importance in emergency planning.
  * One form of human-made disaster that is often overlooked is the possibility of a strike of other labor crisis.

* Theft/Vandalism (盗窃/故意破坏)
  * Theft and vandalism represent the same kind of threat on a much smaller scale.

## Understand System Resilience, High Availability, and Fault Tolerance (了解系统弹性、高可用性和容错性)
A primary goal of system resilience and fault tolerance is to eliminate single points of failure in critical business systems.
* System resilience refers to the ability of a system to maintain an acceptable level of service during an adverse event. 
  implies that the cluster can fail back to the original server after the original server is repaired.
* Fault tolerance is the ability of a system to suffer a fault but continue to operate, achieved by adding redundant components.
* 99.9% means 44 minutes of downtime per month.
* 99.999% ("five nines") means 26 seconds of downtime per month.

### Protecting Hard Drives
* Common RAID configurations
  * RAID-0 : 2 or more disks, Striping (high performance but no fault tolerance)
  * RAID-1 : 2 disks, Mirroring
  * RAID-5 : 3 or more disks, Striping with Parity
  * RAID-6 : 4 or more disks, Striping with Parity
    * Stores parity information on two disks.
    * Protecting against the failure of two separate disks.
  * RAID-10 : 4 or more EVEN NUMBER disks, RAID 1+0 or "Stripe of Mirrors"
* Fault tolerance is not the same as a backup.
* Hardware RAID systems are generally more efficient and reliable.
* Hardware-based RAID arrays typically include spare drives that can be logically added to the array.

### Protecting Servers
* Failover clusters are not the only method of fault tolerance for servers.
* Three of methods that replicate database
  1. Electronic vaulting
  1. Remote journaling
  1. Remote mirroring

### Protecting Power Sources
UPS or Generator
* Goal of UPS is to provide power long enough to complete a logical shutdown of a system, or until a generator is powered on and providing stable power.
* Generator commonly uses diesel fuel.

### Trusted Recovery
* Fail-secure system  
Default to a secure state in the event of a failure, blocking all access.
* Fail-open system  
Fail in an open state, granting all access.
* Two elements of the recovery process
  * Failure preparation
  * The process of system recovery
* Four types of trusted recovery
  1. Manual Recovery
  1. Automated Recovery
  1. Automated Recovery without Undue Loss (无不当损失的自动恢复)  
     Would include steps to restore data or other objects.
  1. Function Recovery

### Quality of Service
Some factors contributing to QoS
* Bandwidth (带宽 / 帯域幅)
* Latency (延迟 / レイテンシー)
* Jitter (抖动 / ゆらぎ)
* Packet Loss (数据包丢失 / パケットロス)
* Inerference (干涉 / 干涉)

## Recovery Strategy
* In addition to improving response capabilities, purchasing insurance can reduce the impact of financial losses.
  * Be sure to purchase sufficient coverage.

### Business Unit and Functional Priorities
* Engineer disaster recovery plan so that those business units with the highest priority are recovered first.
* Identify and prioritize critical business functions.

### Crisis Management
All employees should be trained to activate the fire alarm or contact emergency officials when they spot a fire.
* Crisis management steps in to cover crises of forms.
* Crisis management is a science and an art form.

### Emergency Communications
* It is important that the organization be able to communicate internally as well as with the outside world.
* Employees participating in disaster recovery efforts should be instructed to refer media inquiries to the public relations team. You

### Workgroup Recovery
* The goal of DRP is the restoration of workgroups to the point that they can resume their activities in their usual work locations.

### Alternate Processing Sites
The most importance element of DRP is the selection of alternate processing sites to be used when the primary sites are unavailable.
#### Cold Sites
* Large enougt, load of an organization, equipped with appropriate electrical and environmental support systems.
* Have no computing facilities preinstalled etc.
* The least expensive option.
* The drawbacks : A tremendous lag between the time the decision is made to activate the site.
#### Warm Sites
* Contain the data links and preconfigured equipment, but no usable data or information.
* Do not typically contain copies of the client's data.
* Switchover times is typically at least 12 hours.
#### Hot Sites  
* Three optons to activate the hot site
  1. Force replication btw two sites before transition
  1. Carry backup tapes, manually reapply transactions took place since last replication.
  1. Accept the loss of some portion of the data.
* Switchover times is typically in seconds or minutes.
* Provide the same level of technicial and physical security controls of the primary sites.
#### Mobile Sites  
Usually configured as cold sites or warm sites.

#### Cloud Computing
The following IaaS are offering on-demand services at low cost
* Amazon Web Services (AWS)
* Microsoft Azure
* Google Cloud Platform (GCP)
The use of cloud services to take advantage of redundancy options, geographic dispersion, and similar considerations.

#### Mutual Assistance Agreements (互助协议) aka Reciprocal Agreements
* Popular in disaster recovery literature
* Rarely implemented in real-world practice
* Merit
  * Appear to be extremely cost effective at first glance.
* Drawbacks
  * Difficult to enforece
  * Should be located in relatively close proximity to each other
  * Confidentiality concerns often prevent businesses from placing their data in the hands of others

#### Database Recovery
It's a wise idea to have a databse specialist on the DRP team.
* Electronic Vaulting  
A written definition of the service are important 
  * Storage capacity
  * Bandwidth of the communications link to the electronic vault
  * The time necessary to retrieve vaulted data

* Remote Journaling
  * More expeditious
  * More frequent basis

* Remote Mirroring
  * The most advanced database backup solution
  * The most expensive

## Recovery Plan Development
List worth considering
* Executive summary
* Department-specific plans
* Technical guide for IT personnel
* Checklists for individuals on the disaster recovery team
* Full copies of the plan for criticaldisaster recovery team members

### Emergency Response
KEEP ONE ESSENTIAL DESIGN PRINCIPLE IN MIND: ARRANGE THE CHECKLIST TASKS IN ORDER OF PRIORITY, WITH THE MOST IMPORTANT TASK FIRST!

### Personnel and Communications
A DRP should contain a list of personnel to contact in the event of disaster.
* Alternate means of contact (备用联系方式)
* Backup contacts for each role (备用联系人)

The Power of Checklists -> Invaluable tools in the face of disaster

#### Assessment
* Performing a simple assessment to TRIAGE activity and get the disaster response under way.
* Gauging the effectiveness of disaster recovery efforts and prioritize the assignment of resources.

#### Backups and Off-site Storage
DRP should fully address the backup strategy pursued by organization.

Three main types of backups
1. Full Backups
1. Incremental Backups (增量备份)
1. Differential Backups (差异备份) -- does not change the archive bit

Time required to create the backups : differentical backup > incremental ones

* Using Backups
  * Two common methods to restore data from backups
    1. Full backup (on Monday) + differential backups (on every other night of the week)  
      → To restore: Use full backup + last differential backup
    1. Full backup (on Monday) + incremental backups (on every other night of the week)  
      → To restore: Use full backup + ALL incremental BACKUPS in original chronological order

* The Oft-Neglected Backup (经常被忽视的备份)  
Backups are probably the least practiced and most neglected preventive measure known to protect against computing disasters.

#### Disk-to-Disk Backup (D2D)
* Organizations seeking to adopt an entirely disk-to-disk approach must remember to maintain geographical diversity.

#### Backup Best Proactices
* Several common issues
  * Backups should be scheduled during the low peak periods.
  * The potential for data loss up to the length of the period.
* Only include necessary information in backups.
* Remember to test your organization's recovery precesses.

#### Tape Rotation
* the Grandfather-Father-Son (GFS) strategy
* the Tower of Hanoi strategy
* the Six Cartridge Weekly Backup strategy

### Software Escrow Arangements (软件托管安排)
* A unique tool used to protect a company against the failure of a software developer

### Utilities (公用事业)
Electric power, water, natural gas, sewer service, and so on

### Logistics and Supplies

### Revocery vs. Restoration (恢复和复原)
Are separate concepts
  * Recovery involves bringing business operations and processes back to a working state.
  * Restoration involves bringing a business facility and environment back to a workable state.

## Training, Awareness, and Documentation
* Elments included in a training plan
  * Orientation training for all new employees
  * Initial training for employees taking on a new disaster recovery role for the first time
  * Detailed refresher training for disaster recovery team members
  * Brief awareness refreshers for all other employees

* DRP should alse be fully documented.
  * Should be treated as an extremely sensitive document.
  * Is essential to ensure that key DRP team members and senior management have access to the extire plan.

## Testing and Maintenance
The five main test types
1. Checklist tests
1. Structured walk-throuths
1. Simulation tests
1. Parallel tests
1. Full-interruptino tests

### Read-Through Test (通读测试)
Three goals
1. Key personnel are aware of their responsibilityes
1. Provides individuals with an opportunity to review the plan
1. Helps identify situations in which key personnel have left the company

### Structured Walk-Through (结构化演练)
Often referred to as a tabletop exercise, members of the disaster recovery team gather in a large conference room and role-play a disaster scenario. 

### Simulation Test (模拟测试)
Disaster recovery team members are presented with a scenario and asked to develop an appropriate response.

### Parallel Test (平行测试)
* Involve relocating personnel to the alternate recovery site and implementing site activation procedures.
* The operations at the main facility are not interrupted.

### Full-Interruption Test (全中断测试)
* Actually shutting down operations at the primary site and shifting them to the recovery site.
* Often encounter resistance from management.

### Lessones Learned (吸取教训 / 学んだ教訓)
* Ideally, this facilitator should have played no role in the incident response, leaving them with no preconceived notions about the response. 
* Time is of the essence with the lesssons learned session.
* Facilitator should work with the team leader to document the lessons learned in a report that includes suggested process improvement actions.

### Maintenance
Adapt the disaster recovery plan to meet those changed needs to follow suit.

## Summary
## Exam Essentials
* Know the common types of natural disasters that may threaten an organization.
* Know the common types of human-made disasters that may threaten an organization.
* Be familiar with the common types of recovery facilities.
* Explain the potential benefits behind mutual assistance agreements as well as the reasons they are not commonly implemented in businesses today.
* Understand the technologies that may assist with database backup.
* Explain the common processes used in disaster recovery programs.
* Know the five types of disaster recovery plan tests and the impact each has on normal business operations.

## Review Questions
1 C
2 A → C
3 D
4 B
5 C
6 A D → A B D
7 D → B
8 C → D
9 C
10 B
11 C
12 B → C
13 D
14 B → D
15 A
16 D
17 A
18 B
19 A
20 A → B
正解率： 13 / 20 = 65%

