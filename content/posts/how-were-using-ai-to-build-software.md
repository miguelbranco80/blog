---
date: '2025-06-15'
title: "How We're Using AI to Build Software (And Everything Else)"
draft: false
description: "A practical look at how AI is changing software development, from tools to workflows to the uncomfortable questions about what comes next."
---

To me, the real inflection point came at the end of May 2025.

That's when Anthropic—the company founded by ex-OpenAI researchers—released Claude 4, a new family of large language models. For software development, it is said that the previous models produced errors in 30-40% of generated code. Claude 4 is rumoured to have dropped that to 6-10%. It certainly matches my own observations...

This drop is not yet another incremental improvement. To me, it's a phase change. When your error rate drops by that much, it fundamentally changes what's possible.

Let me walk you through how we're actually using these tools, what works, what doesn't, and some uncomfortable truths about where this may be heading.

## Understanding the Context Problem

The biggest misconception about AI coding assistants is treating them like search engines or autocomplete on steroids. They're not. They're more like hiring a brilliant engineer who knows everything about programming—every language, every framework, every pattern—but knows absolutely nothing about your company, your codebase, or what you did yesterday.

And here's the kicker: Every morning, that engineer wakes up with complete amnesia. They forget everything about your project, your discussions, your decisions. You're starting from scratch every single day.

Once you truly understand this constraint, you can start working around it effectively. These models excel when you give them:

- **New codebases**: No legacy to understand, no historical decisions to unpack
- **Well-organized, modular code**: Clear boundaries, obvious responsibilities
- **Clear, detailed specifications**: The more context upfront, the better the output

They struggle desperately with:

- **Large, messy, undocumented codebases**: The kind most of us actually work with...
- **Domain-specific business logic**: The weird rules that only make sense in your industry
- **Remembering context across sessions**: That brilliant solution from yesterday? Gone.

However, in the right scenarios, it *does work*, and remarkably well. This understanding led us to a radical experimentation: try and rebuilt a 10-year-old software stack from scratch. And we did it, in under 3 weeks, using mostly Claude 4. Not a refactor. Not a cleanup, but a complete rebuild. And it worked because starting fresh is now often faster than trying to get an AI to understand a decade of accumulated complexity.

## Our Actual Development Workflow

Let me break down the exact process we use, step by step.

### Phase 1: Initial Design with GPT-4o

We start with OpenAI's GPT-4o for the initial exploration phase. Why? Because it's great at creative exploration and can access the web in real-time. We begin with rough ideas, maybe just a paragraph describing what we want to build.

The key is iteration. We go back and forth, refining the idea until we have a solid 1-2 page summary of an intended architecture. This might be an overall system design or a specific component. During this phase, we're explicitly asking it to challenge our assumptions. One prompt we use often: "Be critical. Give me the best solution regardless of my abilities or current tech stack."

GPT-4o is particularly good at exploring alternative architectures we found. It can pull in recent developments, check what similar systems are doing, and suggest approaches you might not have considered. But we don't just accept its first answer—we push back, ask for alternatives, demand justification.

### Phase 2: Validation with o3 and o3-pro

Once we have a design we like, we switch to OpenAI's o-models. These are better at logical reasoning and system-level thinking. We use them to:

- Test the logical consistency of our design
- Identify components we might have missed
- Challenge our fundamental assumptions
- Find potential failure modes

This phase often reveals gaps. Maybe we forgot about some aspects of integratign and configuring authentication. Maybe our data flow doesn't actually make sense. Maybe we don't have an architecture that gives itself to easy backup, or requires complex monitoring. Or maybe we're solving the wrong problem entirely, or using an "old software stack". Better to find out now than after we've written 10,000 lines of code.

### Phase 3: Deep Research

Before we commit to the design, we use ChatGPT's Deep Research plugin for background checks. This isn't casual Googling—it's systematic validation:

- **Competitor analysis**: Who else has solved this problem? How?
- **Technology validation**: Are our chosen tools still the best option?
- **Pattern recognition**: Are we unknowingly recreating something that already exists?

This phase has saved us from several mistakes. Once, we were about to build a complex data transformation pipeline when Deep Research revealed that our target format already had a well-maintained open-source library (which we heard about, but didn't quite pay attention to). Another time, it showed us that our chosen database would hit scaling limits.

### Phase 4: The Spec File

Everything we've learned gets distilled into a single file at first: `SPEC.md`. This isn't a casual document, but a the contract between us and the AI. We structure it carefully:

```markdown
# Project Name

## Overview
[1-2 paragraphs of what we're building and why]

## Architecture
[Clear description of major components and how they interact]

## Phase 0: Foundation
[What needs to exist before we can start]

## Phase 1: Core Functionality
[The minimum viable implementation]

## Phase 2: Enhancement
[What makes it actually useful]

[... and so on]
```

The phases are crucial. They give the AI a roadmap, a sequence of smaller problems to solve rather than one overwhelming task.

### Phase 5: Implementation in Cursor

Now comes the actual coding. We use Cursor, an IDE with native LLM integration. We experimented a bunch but settled in Cursor, at least for the time being. Cursor is not "just" a wrapper around LLMs, but an entire environment built around AI assistance. This is a fast-moving area, but we're happy with Cursor at this point.

We start fresh. New project, clean directory. We paste our spec and let Claude guide the implementation, step-by-step. For anything non-trivial, we always enable MAX mode—it costs more but gives access to larger context windows and longer reasoning chains.

The process is highly interactive. Claude suggests code, we review it, ask for changes, push for better solutions. It's not passive—it's a conversation. And unlike human pair programming, Claude never gets tired, never gets annoyed when you ask it to refactor something for the fifth time.

## Tool Selection: What We Use and Why

Let me be specific about our tool choices, because the details matter.

### For Thinking and Planning:

**GPT-4o**: Our go-to for creative exploration and initial design. It's fast, has web access, and excels at generating alternatives. When we need to explore "what if" scenarios or understand a new domain quickly, this is our starting point. In the future, o3 will probably just be enough, but we found the speed and exploration of 4o helpful.

**o3 and o3-pro**: These models "think" before they speak. They're slower but much better at logical consistency. We use them to validate architectures, find edge cases, and ensure our designs actually make sense. Think of them as the senior architect who reviews your plans.

**Deep Research Plugin**: Not glamorous, but invaluable. It prevents us from reinventing wheels or choosing deprecated technologies. One search here can save days of wasted effort, or find libraries or frameworks that are just what we need; we cannot possibly follow up everything out there.

### For Coding:

**Claude 4 Sonnet**: The workhorse. Fast, cost-effective, and good enough for 80% of tasks. When we're iterating quickly or building straightforward features, Sonnet is our default.

**Claude 4 Opus**: The heavy hitter. More expensive, requires MAX mode in Cursor, but capable of complex refactors and deep reasoning. When we're doing architectural changes or need to understand intricate dependencies, Opus is worth every penny.

**Cursor IDE**: This isn't optional for us anymore: the native integration means the AI sees your entire project context, understands your file structure, and can make changes across multiple files coherently.

A crucial point: Always force model selection in Cursor; our default is Claude 4 Sonnet. Don't let the system pick for you. Different models have different strengths, and the default isn't always optimal for your specific task.

## The Language Pragmatism Shift

Here's something that would have been heretical a year ago: We've largely stopped caring about programming languages.

We used to be a deeply polyglot team. Our codebase included Scala for the backend, Java for legacy services, Python for data processing, C/C++ for performance-critical components, and even Go for some plugins. We had strong opinions about when to use each language.

Now? We often let the AI choose. And 90% of the time, it picks Python or JavaScript.

Why? Simple math. These models have been trained on billions of lines of Python code. They've probably seen every Python pattern, every common bug, every idiom a thousand times. For Scala? Maybe they've seen millions of lines. That's a massive difference in training data.

The practical result: The Python code Claude generates is consistently better in our view than the Scala code. More direct code. Fewer bugs, less confusion, better idioms, more maintainable. So we adapt ourselves instead.

This isn't about language wars but about leverage. If the AI writes better Python, and the AI is doing most of the writing, then we write Python. The productivity gain swamps any theoretical advantage of a "better" language.

## The Legacy Code Dilemma

Legacy code is where the AI dream meets reality. And reality is messy.

Remember that brilliant engineer with amnesia? Now ask them to modify a 10-year-old codebase with:
- No documentation
- Inconsistent patterns
- Business logic scattered across 50 files
- Dependencies on deprecated libraries
- That one critical function everyone's afraid to touch

The AI will struggle. It'll make changes that break subtle invariants. It'll miss critical side effects. It'll confidently refactor something that looks redundant but is actually load-bearing, covering a less-known edge case.

But here's the radical concept to consider: Rebuilding is now perhaps cheaper than refactoring?

When you can generate a clean, modern implementation in days instead of months, the entire "refactor vs rebuild" calculation changes. Those careful incremental improvements or gradual modernization? Often slower than just starting over with a clear spec and an AI assistant.

This challenges fundamental assumptions about software development:

- **Code reuse**: Maybe less valuable when generation is cheap
- **Platform investments**: Do they pay off if you can build targeted solutions quickly?
- **Technical debt**: Still real, but the payment options have changed

We're not saying abandon all existing code; of course not. But we are saying the tradeoffs have shifted dramatically and hence, the calculus has to change.

## The Cost Revolution

Two costs have collapsed so dramatically that they're changing how we think about software development.

### The Cost of Experimentation

We can now try 10 different architectural approaches in the time it used to take to carefully plan one; everything from a backend, Docker, Helm Charts, load generators, etc. Failed experiments are "cheap" — sometimes just a days of work. This changes everything about how we approach problems.

Before, we'd spend weeks in design discussions, carefully considering options, because implementation was expensive. Now? We just build prototypes. "I wonder if a event-sourced architecture would work better here?" Let's find out. Shortly after, we have a first working prototype to evaluate.

This means:
- More radical ideas actually get tested (not just discussed)
- Less attachment to first solutions (because trying another approach is cheap)
- Faster pivots when something isn't working
- Real data from working prototypes instead of theoretical discussions

### The Cost of Platform Development

We used to love platforms. The economics were compelling: Build once, sell many times, add features over time, create network effects and lock-in. Platforms were how you built defensible software businesses.

But when you can build targeted solutions in days instead of months, the platform advantage shrinks. We're increasingly thinking of:

- **Narrow, focused tools**: Do one thing, do it well (Unix-way...)
- **Purpose-built solutions**: Exactly what this customer needs, nothing more. Spin a custom dashboard and UI, and that's ok
- **Less feature creep**: Why add features that complicate the codebase?
- **More "good enough" implementations**: Perfect is the enemy of shipped

This doesn't mean platforms are dead. But it does mean the bar for "this should be a platform" is much higher. The economics have shifted from "build general solutions" to "build specific solutions quickly."

## Beyond Code: AI in Everything

Naturally, the same workflow that changed our coding also works for other parts of the business.

Marketing content, business strategy, website design, documentation, competitor analysis - these can all follow the same pattern:
1. Explore with GPT-4o
2. Validate with o3
3. Research with Deep Research
4. Create structured specs
5. Execute with appropriate tools

Take this blog post. It started as rough notes in GPT-4o. We validated the structure with o3 then refined the prose with Claude. The final markdown goes straight to GitHub, which triggered Hugo, the static site builder. No WordPress, no CMS, just markdown files and git.

At RAW Labs, we're redesigning our entire information flow to be AI-friendly:
- Documents are in markdown (easy for AI to parse and generate)
- Processes are documented as specs (clear instructions for AI to follow)
- Data is structured and accessible (via APIs or simple file formats)

The more AI-friendly your systems, the more we can delegate; and delegation is the key to leverage.

## The Human Question

Let's address what everyone's thinking but few want to discuss directly: What happens to jobs?

The role of a software engineer is fundamentally changing. You're becoming a manager of AI agents rather than a direct producer of code. The job now involves:

- **Problem structuring**: Breaking down complex problems into AI-solvable chunks
- **Quality validation**: Knowing what good looks like and ensuring the AI delivers it
- **Iteration guidance**: Directing the AI toward better solutions
- **Judgment calls**: Making decisions the AI can't or shouldn't make

But let's be honest. If someone's primary mode of work is waiting for a ticket, implementing exactly what's specified, and moving on to the next ticket—yes, an AI can eventually do that job. And probably will, soon.

This isn't comfortable to say. People will lose jobs as entire categories of work are becoming automatable. Pretending otherwise doesn't help anyone prepare for what's coming. I am well aware of Jeavons' Paradox: "When a resource becomes cheaper or more efficient to use, overall consumption of that resource often increases — not decreases." This is often said to mean there will be more need for s/w developers than ever. I'm not sure I take that view; I do think the amount of software will dramatically increase (thanks in part to specialization and automation), but I don't think that necessarily means *more* developers. In fact, like Dario Amodei, I do think there will be significant changes in the job market.

The question is: What work can't be automated? What requires human judgment, creativity, taste, or responsibility? That's where people need to move.

### The Person Driving Matters

At first, I thought these tools would level the playing field. After all, we now have access to “deep research”—the kind of architectural insight and pattern recognition that used to require years at places like Facebook, Google, or Microsoft. Suddenly, any developer could evaluate systems at that level. The knowledge gap seemed to shrink overnight.

But the reality is more nuanced. Today, the effectiveness of these tools still heavily depends on who is driving the process. A developer with high agency—someone who can juggle complexity, go deep when needed, and solve unfamiliar problems independently—can become 10x, 50x, or even 100x more productive. (Fake numbers, but you get the idea.) Meanwhile, someone who mostly “does the job,” sticks to one familiar stack, and waits to be trained or directed might see a much smaller boost—maybe 2x.

That variance isn’t just theoretical—it’s real, and it shows up quickly in team velocity.

Strangely, this doesn’t make me pessimistic about younger or less experienced developers. Quite the opposite. A motivated newcomer today can build more projects and run more experiments in one year than some people could in a decade. They just have to care. If they show real interest, the learning curve is no longer steep—it’s a rocket.

## Multi-Agent Future

We're already seeing the next phase: multi-agent systems.

A recent example: Someone used Claude's API to create 6 specialized agents:
- **Project Manager**: Maintains task lists, coordinates other agents
- **Product Requirements**: Translates user needs into specifications
- **UI Developer**: Builds interfaces
- **Backend Developer**: Implements server logic
- **Test Engineer**: Writes and runs tests
- **QA Analyst**: Validates the entire system

The PM agent coordinated the others, maintaining a TODO list and driving progress. Each agent had a specific role and communicated through structured interfaces.

Is it flaky? Yes. Does it work for very simple projects today? Also yes. 

Remember: A lot of software work is simple and repetitive. Basic CRUD apps, simple integrations, standard features—these are what get automated first. And "flaky" is a temporary state. These systems improve exponentially, not linearly.

## The Real Question

We're living through a step change in how software gets built. Not an improvement, not an evolution, but what may be a complete phase transition.

The old world had high costs for experimentation, strong advantages for platforms, and clear roles for human developers. The new world has cheap experiments, advantages for targeted solutions, and humans as orchestrators rather than implementors.

We can adopt early and help shape how this transformation plays out. We can influence how AI gets integrated, what practices emerge, and how the benefits get distributed. Or you can wait and adapt to a world shaped by others' decisions.

Either way, the old world isn't coming back. The question isn't whether to adapt, but how quickly and thoughtfully we can do so.
