---
date: '2026-04-15'
title: "Building My Own Software Dark Factory"
draft: false
description: "My experience building a software dark factory to automate the development of an existing application."
---

# Building My Own Software Dark Factory

The following is a narration of my own experience implementing a software dark factory: a software system that autonomously implements software. We build the factory; the factory builds the product.

This is my own experience applying the principles outlined in [Ryan Lopopolo’s](https://x.com/_lopopolo) [OpenAI post on harness engineering](https://openai.com/index/harness-engineering/), which may well go down as one of the most influential software engineering posts in recent times. There is also a [Latent Space episode](https://www.youtube.com/watch?v=CeOXx-XTYek) with [@swyx](https://twitter.com/swyx) interviewing Ryan Lopopolo, which is well worth listening to alongside the blog. The core framing from the post is simple and powerful:

> “Humans steer. Agents execute.”

The basic idea is to build a system that can autonomously build and maintain your software product. Before late 2025, this still felt unthinkable. Now it is very much real. The latest models gave a big jump in capability and, if we are being honest, a huge amount of development work is now automatable. Humans are increasingly there to guide, steer, constrain, review the system, and shape direction.

That may sound shocking if you are not deep in software automation, but the trend line is unmistakable. Most of us now need to start acting more like engineering managers [of agentic systems]. If you had a team of a hundred developers under you, would you review every line of code, every commit, every pull request? Of course not. You would implement best practices, establish cultural habits, put in place guardrails, inspect progress, occasionally go deep in one area, maybe create a bug-fix week, and so on.

Now you need to build a system that does exactly this for your agents.

In my own case, unlike the OpenAI blog post, I did not start from a fresh repository. I started from an existing application. I could not initially see how to go from “here to there” — from manually describing issues, creating and reviewing PRs, and steering everything directly — to a world where agents autonomously build, test, review, and merge code without my involvement.

Some things seemed obvious. Agents need context, so putting documentation directly in the code repository made complete sense. An agent with more context will make better decisions. If your agent knows it is building an enterprise application in a highly regulated domain, it will naturally make different assumptions about reliability, process, auditability, and best practices. So the repository had to contain a lot more product and architectural context. That part I understood.

Still, something was missing.

After reading the OpenAI post, my real “ah ha!” moment came when it discussed system architecture. The post argues that agents are most effective in environments with strict boundaries and predictable structure, and that they deliberately built the application around a rigid architectural model. Sure: more constraints, more linters, more checkers, and more testing obviously matter. But then it got more interesting. The post describes a system in which code inside a domain can only depend “forward” through a fixed set of layers, and where cross-cutting concerns enter only through explicit interfaces. Anything else is disallowed and enforced mechanically.

That was the key insight for me. As the post states, this is exactly the kind of architecture many teams would postpone until they had hundreds of engineers. But with coding agents, it becomes an early prerequisite. The constraints are what allow speed with less decay. That was one of the biggest lessons in the OpenAI post, and I think it is completely right.

Once you have tens or hundreds of agents working in your codebase, you need to rearchitect your code in ways that would previously have seemed overblown or overly complex for smaller teams. Those things are no longer optional. They become mandatory, because your team is no longer small: we are onboarding tens of "new developers".

At that point, I had a roadmap. Broadly, it looked like this:

1. Concentrate the entire set of architectural and product documentation into the code repository and build a proper set of agent rules
2. Redo the architecture into much more fine-grained domains
3. Add guardrails
4. Improve testing, dramatically
5. Then, finally, implement the software dark factory

So what did we actually do? Let’s go through it.

## 1. Concentrate the entire set of architectural and product documentation

The OpenAI blog post has an excellent example of this. One of the biggest takeaways from it is that AGENTS.md should not be the encyclopedia. It should be the table of contents, pointing into a structured in-repo knowledge base.

That is the same the direction I took, and based on a well battle-tested: progressive disclosure.

When I say I moved the documentation into the repository, I mean everything I could think of: who the customer is, what kind of buyer we are selling to, what experience they are supposed to have, what feedback we have received, what the major workflows are, why certain design decisions were made, what tradeoffs matter, what constraints define the product, and so on.

Because of the amount and density of information, a good organization - a good "table of contents" - is essential. Therefore I made AGENTS.md into the map across all of that information, so agents could find what they needed when they needed it, rather than trying to cram everything into a set of giant instruction files.

## 2. Architecture

At this point I had to migrate my code from "Here to There".

That meant domain isolation, small granular changes, and one-way dependencies between subsystems as much as possible. The blog says this clearly enough, but I think it is worth internalizing properly. If you want agents to move quickly without slowly wrecking the codebase, they need strong structure around them. Small domains - coupled with smaller issues later on - will lead to small, short-lived PRs, which will move work further along fast. All classical s/w dev practices.

There was a long design phase, which involved exploring every aspect of the codebase and better identifying the domains. Once that was decided, we went from ~4 major components to over ~18 subsystems.

Then it was time to migrate. I did not automate that migration. It was a long and rough sprint, the "old-fashioned way" with _N_ coding agents open in parallel, resulting in hundreds of PRs. (I understand that using multiple coding agents is somewhat novel or far-fetched in some domains, but for this type of migration work, it was perfectly adequate.) It was rough and long and tiring, but there was enough testing around to support the churn.

Remarkably, only one bug was introduced while the codebase churned into a new architecture. Agents were extremely competent at breaking these files apart per domain and moving code mostly untouched, to another domain, while adding temporary scaffolding - "connectors", "ports", etc - to bridge the new and old architectures at the same time.

That, by itself, tells you something about how capable software agents have become. And I'm not the only one experiencing this. In fact, the OpenClaw folks recently went over a similar mass migration, with reports stating most of the code was rewritten. Again, this is possible now, but it requires a healthy dose of grind...

## 3. Guardrails

When GPT-5.4 repeatedly kept telling me “this is good enough,” I knew it was time for the next phase: guardrails. 

In reality, I was adding guardrails continuously, even during the migration. But at that time, I was closely supervising; I was "the main guardrail". Every time a component was starting to take check, I'd ask the agents to create or modify scripts that enforce architectural checks at the CI level. Our CI became much more complex and much more thorough. It gained more phases, deeper checks, and stricter requirements.

At this phase, I also added much stronger GitHub checks and GitHub rulesets to prevent merges without reviews, without comments being addressed, and without required CI stages passing green. We had several of these before, but we made them much stricter. This prevents an agent from merging code that does not pass the most stringent validations: the merge will get refused by GitHub if e.g. a comment is not responded to.

I also did another pass on the docs I had written in phase one. Once that documentation existed, we could start enforcing it more. That meant linters, checks, cleaner validation scripts, and simpler consistency rules. This required a large set of bespoke scripts — many of them —, completely tailored to how we build software and our specific architecutre. These enforced dependency chains between modules, architectural boundaries, repository conventions, and so on.

All of this was of course built with agentic coding itself.

## 4. Testing, testing

At this point we were almost _there_ to "unleash" the agents. We had a much better architecture, but we still were not ready for massive agent throughput, because the testing was still not good enough. And most important, it was not parallelizable enough.

Our unit tests were decent: we had plenty and added a very healthy chunk during the migration. But our integration tests were messy and required too many services set up in specific ways. Our end-to-end tests were even more brittle and basically had to be treated as occasional ceremonies that a central CI or dev would run occasionally: specific services on specific ports, etc.

That had to change because it would be a massive constraint as the "team" got larger.

More specifically, our entire testing - in fact, our entire application - had now to work cleanly on git worktrees. Git worktrees matter a lot here. They are what make true parallelism possible. The OpenAI team explicitly notes that making the app bootable per worktree was critical to letting agents run isolated instances per change. Since we did not want to do all development and testing on cloud VMs, we opted for git worktrees.

So we reworked the testing harness heavily. We moved toward Compose-based execution for everything. Integration tests ran entirely inside Compose; ports were auto-selected, and the testing harness were adapted to cope with that. Then we did the same for end-to-end tests. The system boots everything and runs every flow and every component of the stack in isolation.

This was not just about testing. It improved development ergonomics too. Now I can have tens of instances of our software and all its dependencies — databases, Temporal, Redis, workers, everything — all isolated. I can spin up as many instances as I want and start a new one trivially and discard it shortly after. Again, this would have been months of works a while ago; now it's a highly-focused "afternoon" with GPT 5.4 on "extra high"...

## 5. Then, finally, implement the “Software Dark Factory”

So what is, concretely, a software dark factory?

In my case, it is... a script. That may sound underwhelming; and it's by design.

My basic starting point was GitHub Issues. I know many teams use Linear, but we are not there. So I decided to rely on GitHub labels. The dark factory essentially picks issues according to one or more GitHub issue labels that I pass in at startup, and starts working on them, one issue after the other.

Why labels? Because I do not want it to take everything. I explicitly label issues that are eligible for autonomous development — and increasingly that is most of them. If the issue description is good enough, it goes into the queue.

Then the factory loops issue by issue. It implements one, then moves to the next. That is the basic idea.

I had to iterate a few times to get the dark factory to behave autonomously. In the first iterations, the script was extremely opinionated. It had a set of deterministic steps in it: after X, ask Codex for a review; after Y, do Z; if a comment appears, take action Q; and so on. In the real world, it kept failing on edge conditions that I hadn't considered.

I was not being AI-pilled enough. I was not internalizing the bitter lesson. I should have been letting the model handle much more of the behavior itself. Now the loop basically hands the entire state of a GitHub PR to the model and says: "advance this as far as you can". Then the model responds with one of a few possible outcomes. It may say that a human needs to take over the PR, and leaves a comment in the PR explaining why. It may say to sleep for some number of seconds and wake up later because CI is still running and there is no point staying active. Or it may say that the work is merged. Because the model reads the entire GitHub state — comments, checks, failures, reviews, status, everything — it can usually resolve the next step by itself. If I leave a random steering comment in the middle of the PR while work is happening, it incorporates that too. But normally it just runs autonomously: resolving conflicts, addressing code review comments, and fixing CI failures. The model is instructed to consider running optional long test suites when it touches certain aspects of the code. And it does so, obediently and patiently.

Originally, I also had very specific rules embedded in the dark factory prompts themselves about how the system should behave. That was a mistake. I realized that many of the rules I wanted did not belong in the dark factory script at all. They belonged in AGENTS.md, so they would apply universally to any coding agent - and to any work happening outside the dark factory. It is much better if your repo-level instructions teach agents how to respond to GitHub comments, when to leave a comment if uncertain, how to escalate, how to close loops, and how to behave generally speaking: adding comments when they are not sure or need clarification, etc. This just makes for a superior development experience, and while it is mandatory in the dark factory agent, it is super helpful in general, as AGENTS.md instructions or skills.

As a result, the dark-factory loop became much smaller. Its job is basically just to say: keep making progress. I also added an issue-ordering phase so that it picks the next logical issue to work on. I let it look at all candidate issues under the chosen label, so it can choose a sensible sequence and "respect" - or find - issue dependencies. Usually I do this ordering up front, partly to avoid hammering the GitHub APIs too often.

Could I do all of this with skills and more elegant infrastructure? Probably. But here we are on April 15, 2026, and this is how I roll.

## What next

The next phase is integrating observability and feedback. That is the next obvious layer, and it makes perfect sense. The OpenAI post talks about giving agents direct access not just to code and tests but also to logs, metrics, traces, and UI state, so they can validate behavior directly and reason from real runtime feedback.

So that is where this goes next.

## The result?

Last night I went to bed — rather late; these are exciting times — and woke up to 35+ high-quality PRs merged, cleaning up bugs, tech debt, and other issues. I took a brief look. They all looked excellent. Good job team!

I also noticed one convention I do not like: agents, like people, tend to add more code than they remove. So I made a note to tune the contributor guidance. There's also a certain set of features that may need refactoring soon; I may schedule a few issues to tackle it soon.

I will also be adding more cron-style automations to discover new issues automatically. My code-reviewer cron job already found a couple of tech-debt issues we were not tracking and filed them autonomously.

And I spent most of the morning thinking about product direction, unencumbered by implementation details.

It is liberating. Honestly it is stressful in a different way, because now I think more about the bigger (business) issues.

## "But I am not ready!"

Look, I get it. But I'd encourage you to do points 1 through 4 anyway. Topics like tighter architecture, fine-grained domains, stronger CI, richer documentation - including product requirements, users, etc -, better testing and perhaps worktree compatibility will dramatically improve your PR quality even before you go fully autonomous. Your agents - even if you are for now keeping them strangled on a tight leash - will get much better context and hence, work better in general.

And after seeing some more significant productivity gains, you will be much more willing to graduate, over time, into the role that actually matters here: engineering manager of an agentic system.

## Oh — and what are we building?

It is a platform called [Kora](https://raw-labs.com/platform/kora/). Kora is a workflow operating system for real business processes. It helps companies take the workflows they already rely on, approvals, escalations, exception handling, change control, and run them in a system that is durable, observable, auditable, and safe to evolve.

Teams can start by implementing the workflows they already run today, with no agents required. Kora makes those processes executable, traceable, and easier to improve over time. Once the workflow is formalized, companies can identify which steps should remain human, which can be automated, and where AI agents can add value without giving up control, reliability, or oversight.

Whether a process starts as an internal procedure, an approval flow, or a BPMN-style model, Kora provides a controlled path from manual operations to gradual automation. Instead of replacing operational workflows with brittle AI glue, it turns them into systems of execution, approval, and change.

You can [learn more here](https://raw-labs.com/platform/kora/). Or just ping me at miguel@raw-labs.com for a trial!

Thanks for reading and I hope this was helpful!

## References

- Ryan Lopopolo, [Harness Engineering](https://openai.com/index/harness-engineering/), OpenAI.
- Latent Space, [Extreme Harness Engineering: Ryan Lopopolo, OpenAI](https://www.youtube.com/watch?v=CeOXx-XTYek) (YouTube).
