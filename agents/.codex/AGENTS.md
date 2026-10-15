I am Steve. We will be working together a lot, so I thought it would be worth introducing myself.

I am a full-stack engineer with almost 2 decades of experience. I have been an early employee at a couple startups, led delivery teams in the software consulting space, and worked in big tech.

I love to build. I focus on building complex things as simply as possible. I love finding ways to reduce complexity when solving problems.

I want to share some of my preferences here so that we can be more aligned as we work together.

## Coding preferences - general

- Keep things simple. Channel "yagni" energy unless told otherwise.
- Type safety is useful; take advantage of it.
- Don't be afraid to propose bold ideas if they can meaningfully benefit our work.
- Be careful with destructive actions that are not explicitly requested by the user.
- Tests are good! Endless smoke tests, "regression tests" for feature deletions, and similar tests are much less useful. Tests should be focused, not slop.
- Comments are a great way to clarify functionality and how code is used. Don't comment every line, but feel free to describe (concisely) how functions are used above function definitions, classes, etc.
- Keep comments up to date! When making changes, it's important to keep things in sync.

## Coding preferences - TypeScript
- `any` is the enemy. Inferred types are our friend. Our systems should adapt to change, instead of requiring changes everywhere.
- If your TS code looks like a Python dev wrote it, it is bad TS code.
- Avoid one-line functions that are just casting wrappers.
- Write TypeScript in ways that Matt Pocock would be proud of.
- If not already specified in a project, I generally like to use the following tech: Convex, Tailwind, React, Vite+, pnpm.
- When building more complex web and React Native apps, I like to pull in Zustand, React Query, Tanstack Start, Clerk (or better-auth if self-hosting), and Zod.

## Questions are read-only
- A question is a request for an answer, not for changes. If the message opens with "how hard would it be", "what are your thoughts", "why does", "should we", "is it possible", "can X do Y", or otherwise asks rather than instructs: answer it, and do not edit files.
- If the answer is obvious and the change is trivial, still answer first and offer the change. Ask before making it.

## Match ceremony to the task

- Do not spawn subagents or a multi-agent panel for work a single agent finishes in one pass. Delegation is for breadth or adversarial review, not for ordinary tasks.
- When several agents work in parallel, state file ownership up front so they do not collide.

## Worktrees

One agent, one worktree. A working directory has exactly one branch checked out, so two agents sharing one will commit each other's half-finished edits and switch the branch out from under each other. This is the structural fix for the collision above: reach for a worktree before spawning the second agent, not after the first conflict.

- Name the base when you branch: `git worktree add ../<repo>-<topic> -b <topic> main`. A branch cut from whatever happened to be checked out inherits that branch's commits, and unpicking that later is a rebase, not a checkout.
- Put worktrees beside the repo as sibling directories. A worktree shares the object database, so commits survive its directory being deleted — uncommitted work does not, which is what makes `/tmp` the wrong home for one.
- Run `git worktree list` before switching branches or assuming a directory is yours. Git refuses to check out a branch that is live in another worktree; that refusal is information, not an obstacle to route around.
- Finish work in the worktree it started in. When it genuinely has to move, verify the files are identical on both sides before discarding either copy.
- Remove a worktree once its branch merges. A stale one keeps that branch checked out and blocks it everywhere else.

## Visual and design work
- Do not edit real components first. For any non-trivial UI, layout, or copy change, build several distinct static mocks, publish them as a shareable page (an Artifact in Claude Code), report the URL, and stop. Wait for me to pick an option before implementing.

## Blast radius
- Never touch production, live databases, or daily-driver build/preview channels unless explicitly told to do so. When a task is adjacent to any of them, name what you are about to touch before touching it.

## Pull requests
- Make sure PR titles follow the repo’s conventions. They should be simple and easy to understand. Use conventional commit style in projects that require it, e.g., `fix(web): new threads no longer spike CPU`.
- PR descriptions should aim for simplicity. Open with a minimal, clear description of the problem. Follow up with how you solved it.
- Open a real PR, not a draft.
- Rebase onto the latest `main` before opening. Stale branches conflict and waste time and CI resources.
- When asked to babysit a PR, poll checks and comments newer than the last pushed commit. Verify each finding against the source before acting on it. Fix real issues and dismiss false positives with a written reason.
