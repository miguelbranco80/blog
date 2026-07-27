---
date: '2026-07-27'
title: "Software Is Splitting"
draft: true
description: "As agents make customization cheap, software products may become smaller: a reliable core supplied by a vendor, surrounded by company-specific software built by the customer."
---

For most of the history of enterprise software, customization has been a sign that something went wrong.

The ideal product was the same product for everyone. A vendor built a broad application, added configuration screens, exposed an API, maintained a plugin system, and gradually accumulated enough features to satisfy a market. Customers adjusted their processes to fit the software, or paid consultants to close the remaining gaps.

That model made sense because software was expensive to write and even more expensive to maintain.

But if a product manager can now describe a missing workflow to a coding agent and have a working version that afternoon, the economics change. The obvious question is no longer, "Will the vendor add this feature?" It is, "Why are we waiting for the vendor at all?"

This does not mean every company becomes a software company and rebuilds everything it buys. That would be a fairly exhausting future. It means the boundary between what a vendor supplies and what a customer builds is moving.

## The return of custom software

Custom enterprise software never disappeared. It was simply pushed into awkward places: spreadsheets, internal tools, low-code applications, integration projects, consultancy work, and endless collections of configuration options.

The demand was always there because companies are not actually identical. Their approval chains, risk policies, data models, exceptions, and operating habits are specific to them. In many cases, those differences are the company.

We nevertheless tried to serve them with increasingly large horizontal products. The vendor would implement the common case, add switches for the less common cases, provide extensions for the strange cases, and eventually end up with a product nobody fully understood.

Agents make another approach possible. Instead of asking a software vendor to anticipate every variation, a company can generate the last mile itself. The software surrounding a procurement process, a laboratory procedure, or an internal approval policy can be written for that exact organization.

This is hyper-specialization: not one application for an industry, but software shaped around a particular company, team, and sometimes even process.

The paradox is that hyper-specialized software may depend on more shared software, not less.

## Nobody wants to rebuild the boring, difficult parts

Cheap code does not make every part of software cheap.

It is easy to generate a dashboard. It is much harder to build a database that will not lose data. It is easy to generate an approval form. It is much harder to guarantee durable execution, permissions, audit trails, upgrades, rollback, and years of compatibility.

The distinction that matters is not simply generic versus custom. It is between the parts where specificity creates value and the parts where reliability creates value.

Companies will want to own and change the first category. They will generally prefer someone else to be responsible for the second.

This has been the direction of infrastructure for years. AWS and Azure made physical infrastructure someone else's problem. Vercel moved the boundary further up the stack. Replit moved it closer to the application. Coding agents now make the application itself cheap to create and modify.

Each step does not eliminate the layer below it. It turns that layer into something dependable enough that we can spend our time one level higher.

The same thing is now happening inside applications.

## The product becomes the invariant

The traditional software company tries to own the whole application. In the model emerging now, it may own a much smaller core.

That core should contain the part that is difficult, repeatable, and worth trusting to a specialist. Everything around it should be easy for a customer, or the customer's agents, to inspect, compose, and change.

For a payments company, the core might be money movement, reconciliation, and regulatory correctness. For an identity company, it might be authentication, authorization, and secure credential handling. For a workflow system, it might be durable execution, release control, permissions, observability, and evidence.

The screens, rules, integrations, and process-specific behavior around those cores do not necessarily belong in the vendor's main product anymore. They can be built where the relevant context exists: inside the customer's organization.

This suggests a very different product discipline. Software providers need to decide what is genuinely theirs.

What can they make substantially safer or more reliable than a generated implementation? Which guarantees require accumulated operational knowledge? Which part should remain stable while everything around it changes?

That is the product.

The rest may be examples, templates, agent instructions, APIs, schemas, and skills.

## Open and closed are no longer enough

We usually describe software as open or closed, self-hosted or SaaS, build or buy. Those distinctions are becoming less useful on their own.

A service can be closed source but highly adaptable. An open-source application can still be extremely difficult to change. A SaaS product can expose every useful capability to an agent, while a self-hosted product can trap its users behind a rigid interface.

The more useful questions are practical ones:

- Where does the runtime execute?
- Who owns the data and the resulting artifacts?
- Can the organization change the behavior without asking the vendor?
- Can agents understand and operate the product safely?
- Which guarantees remain the vendor's responsibility?

This is less about access to source code than access to agency.

Customers will increasingly expect to shape software without joining the vendor's roadmap, waiting for an extension, or searching a plugin marketplace. They may still buy the underlying product. In fact, they may depend on it more heavily than before. But they will buy a stable capability, not a complete opinion about how their company should operate.

## Software delivered as a capability

Skills for Claude and Codex point toward this model in a small but interesting way.

A skill is not a conventional application. It gives an agent a reliable way to perform a particular kind of work: the context it needs, the tools it can call, the constraints it should respect, and the procedure it should follow. The agent incorporates that capability into a larger task.

Software starts to look similar. Rather than making a user enter one large application and adapt to its worldview, a product can expose a focused capability that an agent uses inside a company-specific system.

This may produce smaller software companies with narrower products. It may also produce much larger enterprise stacks, assembled from databases, model providers, identity systems, durable runtimes, internal services, and generated applications.

That sounds like more fragmentation, and it probably is. But the fragmentation will be concentrated in the part that was always fragmented anyway: the actual way a company works.

The stable cores underneath it can become more specialized and more dependable.

## What this means for Kora

This is also how I increasingly think about [Kora](https://kora.raw-labs.com).

Kora should not know the ideal procurement process, quality procedure, approval chain, or exception policy for every organization. Those are precisely the things an organization should own and adapt.

The reliable core is different. A workflow needs to execute durably under a released version. People, systems, and agents need scoped permissions. Every run needs to be observable, replayable, and able to leave evidence of what happened. Changes need release control and rollback. In many organizations, the runtime and its data need to remain on their own infrastructure.

Those guarantees are difficult to improvise every time an agent generates a new internal application. They are the part worth providing once and making dependable.

The workflow itself is hyper-specialized. A product manager can describe it, connect it to the organization's systems, change it as the business changes, and release a new version without asking Kora to add a feature to its universal workflow designer.

Kora provides the governed execution core. The organization provides the process.

## A smaller product, used more deeply

The temptation for software companies has always been to expand: another module, another vertical, another set of configuration options. A larger product appeared to address a larger market.

Agents reverse that logic. When customers can cheaply build the specific layer themselves, the most useful vendor may be the one that does less, draws a hard boundary around its responsibility, and makes that core exceptionally trustworthy.

So I do not think the future is simply SaaS versus custom software. Nor do I think product managers will replace every vendor with a pile of generated code.

The more plausible outcome is an enterprise stack made of reliable, specialized cores surrounded by software generated for one organization and nobody else.

Software providers will have to decide which side of that boundary they belong on. And customers will have to decide which parts of their operation are important enough to own.
