---
date: '2026-03-09'
title: "How to Build Software in the Age Where AI Writes Most of It"
draft: false
description: "The durable parts of software organizations are not disappearing. The winning move is faster feedback loops, clearer roles, and infrastructure AI systems can actually use."
---

# How to Build Software in the Age Where AI Writes Most of It

There’s a lot of noise right now about agents building software. Autonomous systems. AI engineers. Fully automated development pipelines.

Some of that is true.

But most of the conversation is missing something fundamental: how software organizations actually work.

If you want to build software in the age of code generation, you shouldn’t start by thinking about agents.

You should start by thinking about structures that have survived for decades.

---

## The Half-Life of Ideas

A useful mental model is the half-life of concepts.

If something has been around for:

- 50 years, it will probably be around for another 50
- 10 years, it might survive another 10
- 1 year, it might last another year

Ideas are sticky.

This matters because many of the things people assume will disappear in the age of AI are actually the most durable parts of the system.

Take a few examples:

- Databases
- Systems of record
- Organizational structures
- Code review processes
- Roles and responsibilities

These things are not going away.

Meanwhile, many of the shiny things—frameworks, “agent architectures”, orchestration layers—will probably have a much shorter half-life.

The paradox is that the future of autonomous software development will likely look much more like traditional organizations than like a swarm of abstract agents.

---

## Stop Talking About Agents

If you want people to use a system, it has to speak a language they already understand.

Nobody outside the AI bubble understands agent orchestration frameworks.

But everyone understands:

- Organizational charts
- Roles
- Teams
- Managers
- Reviews
- Projects

These concepts have existed for centuries.

So instead of designing systems around agents, a better model is to design them around organizational metaphors.

For example:

| Traditional Organization | AI Software Organization |
| --- | --- |
| Engineer | Software worker (human or AI) |
| Team | Set of cooperating workers |
| Manager | Coordination layer |
| Code review | Output verification |
| Project manager | Task planner |
| Hiring | Resource allocation |

In this framing, an AI system is not an “agent”.

It’s a resource with a defined role.

And that role exists inside a structure people already understand.

This is not just semantics.

It’s about interfaces.

If you want the general public—or even most companies—to use these systems, you must expose them through concepts they already recognize.

---

## Specialization Isn’t Going Away

Another idea with a very long half-life is specialization.

Companies organize work by defining roles:

- frontend engineer
- backend engineer
- data engineer
- QA
- product manager

These roles exist for a reason: they make work predictable.

When a company hires someone, they know roughly what they’re getting.

The same will happen with AI systems.

Instead of generic “agents”, we will define specialized resources.

For example:

- API implementer
- test generator
- integration fixer
- migration engineer
- documentation writer

Initially, these resources will be humans.

Then, over time, some of those roles will be filled by software systems.

From the outside, the structure doesn’t change.

The org chart stays the same.

Only the type of worker changes.

The “resource” used to be a person.

Now it might be a program.

Many people dislike the term resource for humans. But conceptually it captures something important: work becomes definable enough that it can be automated.

And once work is well defined, it can be performed by either a human or a machine.

---

## The Real News: Software Development Is Basically Solved

This might sound controversial, but it’s increasingly clear:

Writing software is no longer the hard part.

If you think it still is, you simply haven’t spent enough time with the latest models (e.g. GPT-5.3 Codex XHigh).

Given a clear task, modern systems can generate large amounts of working code extremely quickly.

But there’s a catch.

Software development was never just about writing code.

The real difficulty lies elsewhere:

- understanding what to build
- managing complexity
- coordinating work
- validating behavior
- integrating systems

And most importantly:

feedback loops.

---

## The Real Bottleneck: Feedback

Developers don’t get stuck because they can’t write code.

They get stuck because the system around them is slow.

Examples will sound familiar:

- CI pipelines that take 45 minutes
- integration environments that take days to configure
- test suites that nobody trusts
- deployment pipelines controlled by three different teams
- local setups that require tribal knowledge

When this happens, the feedback loop is broken.

And AI systems depend on feedback even more than humans do.

For autonomous development to work, an AI system needs to be able to:

1. Write code
2. Run tests
3. Observe failures
4. Fix the code
5. Repeat

This loop must happen quickly and automatically.

If every step requires human coordination, the system collapses.

---

## The Coming Race

The real competition between companies will not be about who has the best models.

It will be about who closes the development loop fastest.

Organizations that succeed will have systems where an AI worker can:

- spin up environments automatically
- run full test suites
- simulate integrations
- analyze results
- iterate

All without human intervention.

Companies that still rely on:

- manual integration testing
- fragile CI pipelines
- undocumented systems
- monolithic architectures

will be dramatically slower.

And in a world where software can be generated continuously, speed of feedback becomes everything.

---

## Monoliths, Meet AI Refactoring

The uncomfortable truth for many organizations is that their internal systems were never designed for this world.

Large monoliths.

Undocumented dependencies.

Hidden operational knowledge.

Historically, fixing these systems was almost impossible because the effort required was enormous.

Ironically, AI might be the tool that finally makes it feasible.

Modern models are increasingly capable of:

- analyzing large codebases
- mapping dependencies
- proposing refactors
- generating tests
- modularizing systems

Six months ago this was borderline science fiction.

Today it is increasingly practical.

Which means organizations that want to survive this transition need to start doing something uncomfortable:

breaking apart the systems that slow them down.

---

## The Quiet Shift

The shift to AI-driven software development will not look like science fiction.

There won’t be swarms of visible agents arguing with each other.

Instead, it will look strangely familiar.

You’ll see:

- teams
- projects
- roles
- managers
- review processes

The difference is that many of the workers inside that structure will no longer be human.

And the organizations that succeed will not be the ones that adopt the most futuristic tools.

They will be the ones that combine centuries-old organizational ideas with fast feedback loops and automated infrastructure.

Because in the end, the hardest part of software development was never writing the code.

It was building the system that allows code to improve itself.
