---
date: '2026-01-09'
title: "How to Build Software in the Age Where AI Writes Most of It"
draft: false
description: "The durable parts of software organizations are not disappearing. The winning move is faster feedback loops, clearer roles, and infrastructure AI systems can actually use."
---

# How to Build Software in the Age Where AI Writes Most of It

There's a lot of noise right now about agents building software — autonomous systems, AI engineers, fully automated development pipelines. Some of it is true. But most of the conversation misses something fundamental about how software organizations actually work.

If you want to build software in the age of code generation, you shouldn't start by thinking about agents. You should start by thinking about the structures that have survived for decades, and asking why they lasted.

---

## The Half-Life of Ideas

A useful mental model here is the half-life of concepts. If something has been around for fifty years, it will probably be around for another fifty. If it's been around for one year, it might last another year. Ideas are sticky that way.

This matters because many of the things people assume will disappear in the age of AI — databases, systems of record, organizational structures, code review processes, roles and responsibilities — are actually the most durable parts of the system. They've been around long enough that betting against them is a bad idea. Meanwhile, the shiny things — frameworks, "agent architectures", orchestration layers — will probably have a much shorter shelf life.

The paradox is that the future of autonomous software development will likely look much more like traditional organizations than like a swarm of abstract agents.

---

## Stop Talking About Agents

If you want people to actually use a system, it has to speak a language they already understand. Nobody outside the AI bubble understands agent orchestration frameworks. But everyone understands org charts, roles, teams, managers, reviews, and projects. These concepts have existed for centuries, and they persist because they work.

So instead of designing systems around agents, a better model is to design them around organizational metaphors:

| Traditional Organization | AI Software Organization |
| --- | --- |
| Engineer | Software worker (human or AI) |
| Team | Set of cooperating workers |
| Manager | Coordination layer |
| Code review | Output verification |
| Project manager | Task planner |
| Hiring | Resource allocation |

In this framing, an AI system is not an "agent" — it's a resource with a defined role, and that role exists inside a structure people already understand. This isn't just semantics. It's about interfaces. If you want the general public, or even most companies, to use these systems, you have to expose them through concepts they already recognize.

---

## Specialization Isn't Going Away

Another idea with a very long half-life is specialization. Companies organize work by defining roles — frontend engineer, backend engineer, data engineer, QA, product manager — and these roles exist for a reason: they make work predictable. When a company hires someone, they know roughly what they're getting.

The same will happen with AI systems. Instead of generic "agents", we'll define specialized resources: API implementers, test generators, integration fixers, migration engineers, documentation writers. Initially, these will be humans. Over time, some of those roles will be filled by software. From the outside, the structure doesn't change. The org chart stays the same. Only the type of worker changes — the "resource" used to be a person, now it might be a program.

Many people dislike the term "resource" for humans, and fair enough. But conceptually it captures something important: once work becomes definable enough, it can be automated. And once it's well defined, it can be performed by either a human or a machine.

---

## The Real News: Software Development Is Basically Solved

This still might sound controversial (in Dec 2025, the time of writing), but it's increasingly clear that writing software is no longer the hard part. If you think it still is, you probably haven't spent enough time with the latest models. Given a clear task, modern systems can generate large amounts of working code extremely quickly.

But here's the catch: software development was never just about writing code. The real difficulty has always been elsewhere — understanding what to build, managing complexity, coordinating work, validating behavior, integrating systems. And most importantly, getting the feedback loops right.

---

## The Real Bottleneck: Feedback

Developers don't get stuck because they can't write code. They get stuck because the system around them is slow. The examples will sound familiar to anyone who's worked at a company of any real size: CI pipelines that take 45 minutes, integration environments that take days to configure, test suites nobody trusts, deployment pipelines controlled by three different teams, local setups that require tribal knowledge passed down through Slack threads.

When this happens, the feedback loop is broken. And AI systems depend on feedback even more than humans do. For autonomous development to work, an AI system needs to write code, run tests, observe failures, fix the code, and repeat — quickly and automatically. If every step requires human coordination, the whole thing collapses.

---

## The Coming Race

The real competition between companies won't be about who has the best models. It will be about who closes the development loop fastest. Organizations that succeed will have systems where an AI worker can spin up environments automatically, run full test suites, simulate integrations, analyze results, and iterate — all without human intervention.

Companies that still rely on manual integration testing, fragile CI pipelines, undocumented systems, and monolithic architectures will be dramatically slower. And in a world where software can be generated continuously, speed of feedback becomes everything.

---

## Monoliths, Meet AI Refactoring

The uncomfortable truth for many organizations is that their internal systems were never designed for this world. Large monoliths, undocumented dependencies, hidden operational knowledge — historically, fixing these was almost impossible because the effort required was enormous and the payoff uncertain.

Ironically, AI might be the tool that finally makes it feasible. Modern models are increasingly capable of analyzing large codebases, mapping dependencies, proposing refactors, generating tests, and modularizing systems. Six months ago this was borderline science fiction. Today it's increasingly practical. Which means organizations that want to survive this transition need to start doing something uncomfortable: breaking apart the systems that slow them down.

---

## The Quiet Shift

The shift to AI-driven software development won't look like science fiction. There won't be swarms of visible agents arguing with each other. Instead, it will look strangely familiar — teams, projects, roles, managers, review processes. The difference is that many of the workers inside that structure will no longer be human.

The organizations that succeed won't be the ones that adopt the most futuristic tools. They'll be the ones that combine centuries-old organizational ideas with fast feedback loops and automated infrastructure. Because in the end, the hardest part of software development was never writing the code. It was building the system that allows code to improve itself.
