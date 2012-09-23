---
layout: post
title: "The Road To Continuous Delivery"
date: 2012-09-08 18:35
comments: true
categories: [lean, continuous delivery, continuous integration, jenkins, cucumber, maven, redmine, selenium, webdriver, junit, team]
---
I've been working at my company since 1997. I've created with my team more than 36 Java web application and 29 Oracle database.
When we started at 1997, we had just an email server, a version control (CVS) server and a bug reporting system.
We didn't write unit test just Java main methods, and we didn't hear about integration test.
Few years later we have started writing unit tests, and more few years later integration tests.
{%img left /images/post/cucumber-report.png Cucumber report%}
Today, we have been using several continuous integration and delivery tools: Redmine, Maven, Jenkins, DVCS, Selenium/WebDriver, JUnit, Cucumber.
To be able to achieve continuous delivery, it has to start with continuous integration.
Of course, we are developing our process: we have some weakness and we can find new challenges. Before you start a continuous delivery process, your company must be mature. It's all about efficiency.

> Continuous delivery is able to raise your efficiency.

Before you start Continuous Delivery or Continuous Integration, check this list:
<!--more-->
### Software Configuration Management
1. Creating a new developer environment takes about 30 minutes.
1. Version number syntax is carved in stone (snapshots and releases).
1. You can create 'one step build'.
1. Your build repeatable.
1. You have runtime environment names.
1. Code is able to running on developer machine.
1. You have a Wiki, and a page with description of SCM.
1. Lead Developer is a 'software configuration master' (master and no manager).
1. You've a bug, task, feature database.

### Developer activities
1. Developer fixes bugs before writing new code.
1. Developer always writes a unit test to reproduce a bug before start a bug fixing.
1. Developer can prove the issues have been fixed (unit test, integration test).
1. Developer can reproduce a bug on the developer machine, or at least not in the production environment.
1. Developer knows what the project goal is.
1. Developer knows what she/he is working on today and tomorrow.
1. Developers have guidelines: coding style, specification, etc.

### Team
1. You must have a TEAM. Not programmers, not testers, not designers, not managers.
1. Team size between 3-8 people.
1. Team is older than 3 months.
1. Team is self organized.
1. Team visualizes up-to-date their own work, schedules and impediments.
1. Team's able to carry out specifications, codes, automatic tests and releases.
1. Team has been continuously developing their own process.
1. Team is independent of other teams (or individuals).
1. One team - one mission. One mission - one team.

### Plan
1. Product has a feature list (product backlog).
1. You have a roadmap.
1. You are able to do less.
1. Product has validated before it's releasing to production.
1. All plans have been visualized for teams (Kanban, Scrum).

## Conclusion
{%img left /images/post/jenkins.png Jenkins%}
To achieve continuous delivery: it's not a revolution, it's an evolution. You need a matured company, so
in first stage: check the list, and try to achieve goals, and do not forget: to be able to achieve continuous delivery, it has to start with continuous integration.


