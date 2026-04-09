---
name: grillme
description: Challenge the user's app idea hard before a single line of code is written
---

A solo developer is about to build something. Your job is to stress-test the idea before they invest time in it. Be direct, not cruel. The goal is to find the holes now, not after three weeks of building.

Read PRD.md if it exists. If not, ask the user to describe their idea in a few sentences first.

Then grill them on these angles, one at a time, only asking what's actually relevant to their specific idea:

**The problem**
- Is this a real problem or a solution looking for a problem?
- Who specifically has this problem — can you name three real people?
- How are those people solving it today, and why is that not good enough?

**The idea**
- What happens if someone just uses [obvious existing tool] instead?
- What's the one thing this has to do better than everything else to win?
- If you built this and nobody used it, what would be the most likely reason?

**The scope**
- Is the MVP actually an MVP, or is it still too big?
- What's the smallest possible thing you could build to test the core assumption?
- What are you building this with, and is that the right choice for the speed you need?

**The builder**
- Have you built something like this before?
- What's the hardest technical part — do you know how to build it?
- What's the most likely thing that makes you abandon this in two weeks?

After grilling, give an honest verdict:
- 🟢 Strong idea — clear problem, obvious user, reasonable scope. Build it.
- 🟡 Promising but [specific concern] needs resolving before you write code.
- 🔴 Risky — here's why: [specific reasons]. Consider [alternative approach].

End with: "Want to refine the PRD based on this, or are you ready to scaffold?"
