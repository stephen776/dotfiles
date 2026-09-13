I am Steve. We will be working together a lot, so I thought it would be worth introducing myself.

I am a full-stack engineer with almost 2 decades of experience. I have been an early employee at a couple startups, led delivery teams in the software consulting space, and worked in big tech.

I love to build. I focus on building complex things as simple as possible. I love finding ways to reduce complexity when solving problems.

I want to share some of my preferences here so that we can be more aligned as we work together.

## Coding preferences - general

- Keep things simple. Channel "yagni" energy unless told otherwise.
- Typesafety is useful, take advantage of it.
- Don't be afraid to propose bold ideas if they can meaningfully benefit out work.
- Be careful with destructive actions that are not explicitly requested by the user
- Tests are good! Endless smoke tests, "regression tests" for feature deletions, etc, much less good. Tests should be focused, not slop.
- Comments are a great way to clarify functionality and how code is used. Don't comment every line, but feel free to describe (concisely) how functions are used above function definitions, classes, etc.
- Keep comments up to date! When making changes, it's important to keep things in sync.

## Coding preferences - Typescript
- `any` is the enemy. Inferred types are our friend. Our systems should adapt to change, instead of requiring changes everywhere.
- if your TS code looks like a Python dev wrote it, it is bad TS code.
- avoid one-line functions that are just casting  wrappers.
- Write Typescript in ways that Matt Pocock would be proud of. 
- If not already specified in a project, I generally like to use the following tech: Convex, Tailwind, React, Vite+, pnpm.
- When building more complex web and react-native apps, I like to pull in Zustand, React Query, Tanstack Start, Clerk ( or better-auth if self hosting), and Zod.

## Questions are read-only
- A question is a request for an answer, not for changes. If the message opens with "how hard would it be", "what are your thoughts", "why does", "should we", "is it possible", "can X do Y", or otherwise asks rather than instructs: answer it, and do not edit files.
- If the answer is obvious and the change is trivial, still answer first and offer the change. Ask before making it.

## Match ceremony to the task

- Do not spawn subagents or a multi-agent panel for work a single agent finishes in one pass. Delegation is for breadth or adversarial review, not for ordinary tasks.
- When Several agents do work in parallel, state file ownership up front so they do not collide.

## Visual and design work
- Do not edit real components first. For any non-trivial UI, layout, or copy change, build several distinct static mocks, publish them via the `html-communication` skill, report the URL, and stop. Wait for me to pick an option before implementing.
- Branding constraints: dark mode, true black (`#000`) background, white primary text. Information-dense, no decorative card/pill chrome, no light-gray subtitle lines above sections. Minimal copy, No em dashes.

## Blast radius
- never touch production, live databases, or daily-driver build/preview channels unless explicitly told to do so. When a task is adjacent to any them, name what you are about to touch before touching it.

## Pull requested
- Make sure titles follow conventions from the repo. They should be simple and easy to understand. Conventional commit styles in projects that use them, i.e. "fix(web): new threads no longer spike CPU"
- PR descriptions should aim for simplicity. Open with a minimal, clear description of the problem. Follow up with how you solved it.
- Open a real PR - Not a draft.
- rebase onto latest `main` before opening. Stale branches conflict and waste time and CI resources.
- When asked to babysit a PR: poll checks and comments newer than the last pushed commit; verify each finding against the source before acting on it; fix real ones and dismiss false positives with a written reason; 


