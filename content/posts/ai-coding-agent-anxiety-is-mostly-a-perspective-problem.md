---
date: '2026-07-21'
title: "AI Coding Agent Anxiety Is Mostly a Perspective Problem"
draft: false
description: "The anxiety around AI coding agents comes from comparing yourself to the process that produced the code, instead of treating the artifact like any other mature codebase."
---

I've noticed that many developers (myself included) experience a certain anxiety when using AI coding agents.

The model writes tens of thousands of lines, now with a coherent architecture, consistent naming, decent design, and increasingly resembles what you'd expect from a mature codebase. It uses practices you weren't always aware of. The natural reaction is to compare it to yourself and think: "I could never have written this."

Perhaps that's the wrong comparison.

As developers, we already operate in several different modes.

Sometimes we're the builder. We write the code ourselves. We know every line because we typed every line.

Sometimes we're the reviewer. A colleague sends us a pull request. We don't feel ownership over every line. We review the changes, look for mistakes, suggest improvements, perhaps discuss a different approach. The code arrives at human speed, so we can comfortably keep it in our heads.

Sometimes we're acting as architects. Most of the time we're not writing much code ourselves. Instead, we're looking at someone else's implementation and saying "don't solve it this way; we'll eventually need to cover this hole over here instead." Again, we don't own the typing. We own the direction.

None of this feels unusual.

There's another mode we rarely think about.

## Learning from an existing codebase

I still remember reading parts of the Doom 3 source code when it was released. It never crossed my mind that I should understand the whole thing. It was a large engine, built over many years and attempts, and I expected to slowly become familiar with the parts that interested me. I wasn't trying to "finish" understanding Doom 3. I was simply exploring it.

Importantly, there was no pressure.

Nobody expected me to compete with John Carmack. Nobody even expected that repository to represent a single implementation. It was the result of years of experiments, discarded ideas, prototypes, previous engines, and countless iterations. It was simply a mature codebase.

I think AI coding agents should increasingly be viewed in exactly the same way.

We instinctively anthropomorphize them. Our brain creates a story of another programmer sitting beside us, typing impossibly quickly, and naturally concludes that we can't compete.

But that's probably not the right mental model. They are not the work of a single programmer sitting beside you. In a very real sense, they are built by and on _all of us_. It's much closer to opening an existing repository.

When I clone LLVM, PostgreSQL or Doom 3, I don't expect to read every line before making a change. I build a mental model. I understand the architecture. I inspect the parts I'm modifying. Over time I become familiar with more and more of the system.

The fact that an AI generated that repository in twenty minutes instead of twenty years doesn't fundamentally change how we should approach it.

Perhaps this is where some of the anxiety comes from. **We're comparing ourselves to the process that produced the code, instead of interacting with the artifact that now exists.**

Once the repository exists, it doesn't really matter whether it took twenty minutes or twenty years to produce. The job is the same as it has always been: understand it well enough to make the next good decision.

Perhaps that's the more useful perspective.