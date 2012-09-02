---
layout: post
title: "From idea to working application with tools"
date: 2012-09-02 11:02
comments: true
categories: [lean, tool, scrum, netbeans, mercurial, git, jenkins, cucumber, bdd, tdd, redmine, maven, nexus, java, jmeter]
published: false
---
In the past, I have seen a development team who have optimized a part of the development process. They focused on write of Java code and automated some code generation. Of course, they have been failed in delivery software. Today we have [Lean Software Development](http://www.poppendieck.com/), so we know what means __Optimize the Whole__ and __Focus on the Entire Value Stream__.

We have been using several tools and methods at [my software development team](http://www.jurahungaria.com/dev) and we focus on the entire value stream.

## Discussions and planning
Tools: _Scrum, Whiteboard, Sketchbook, UML notation, Wiki, Email, Chat_

{%img left /images/post/sketchbook.jpg Use sketchbook!%}
We've been collecting all requirements, because they are constantly changing. Your best friends are sketchbook and whiteboard. I'm drawing diagrams, screens, data blocks with connections, etc. I’ve always been a big fan of visualization. After all, I've publishing results (wiki, email, product backlog, etc.). _Do not forget to eliminate waste!_ Throws out heavyweight and unnecessary tools.

## Continuous delivery

Tools: _NetBeans, DVCS, Apache Maven, JUnit, Spring, Automated Integration Test, Automated Acceptance Test, User Acceptance Test, WebDriver, Cucumber, jMeter, Code review, Logging, Redmine_

We do not optimize just writing of Java code. We have been optimizing the whole process. [Continuous delivery](http://en.wikipedia.org/wiki/Continuous_delivery) helps your team to deliver fast and maintain a good quality.
{%img left /images/post/team-discussion.jpg Discussions %}
How we do it: we start with Sprint planning and determine the most important tasks. _Do not waste your time!_ Determine the most important tasks! After we start coding, and if necessary, programmer and product owner create more detailed specification. _Do not create unnecessary documentation!_ The created specification often just one page! We have been using sketchbook, whiteboard and UML drawing program. After all, they publish it.

> We know why we have been using a particular tool, this is a __conscious choice__.

Some examples:

1. We do not use Eclipse editor, because NetBeans is simpler. We can start Maven project with it faster and cleaner. Tool version update is bug free. Code does not depend on it.
1. We do not use Ant, but Maven. Maven has dependecy managment, life cycle, and capable to release software from CLI.
1. We use DVCS: Mercurial and Git. We can commit offline, and merge branch between developer. It is tracking changesets, not files.
1. We have been writing unit test. This is a standard solution for testing our daily work: all unit test run from NetBeans after every compile, so we are always testing all changes!
1. We use Spring Framework, because "Write Once - Run Anywhere" is working. Spring upgrade on any project are seamless. It doesn't accumulate technical debt. It is free and costless!

{%img left /images/post/cucumber.jpg Cucumber feature file%} Jenkins CI server start testing Integration Tests and Automated Acceptance Test after code have been commited to DVCS. [Cucumber](http://cukes.info/) is the best tool for AAT (Automated Acceptance Test). I've tested several other BDD tools (Spock, jBehave, etc.) before we start using AAT. Cucumber feature text is written in a business-readable domain-specific language and serves as documentation, automated tests and development-aid - all rolled into one format! Read more: [The Cucumber Book: Behaviour-Driven Development for Testers and Developers](http://pragprog.com/book/hwcuc/the-cucumber-book) - sample codes has been written in ruby, but useful to Java developers too.

> Do not waste your time to try testing all feature with AAT!

Most important features has been tested with AAT, but not all. We do manual test before we release a new version (UAT), focused on new features (product backlog items). At the end of the Sprint, we show features at Sprint Review Meeting.

## Conclusion

