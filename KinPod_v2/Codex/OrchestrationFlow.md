# 🔄 Orchestration Flow: One Plan → Local Personalization

## Flow Overview
- The server orchestrates one Family Quest plan and task assignments.
- KinSocket Bridge relays final plan to all local Buddy Layers.
- Each child’s local Buddy Layer uses their Imprint Zero to adapt story resolution, tone, and instructions.
- Local negotiation: kids can request swaps, reassignments, or negotiate chores inside the app.

## Cost & Caching
- One orchestration pass keeps inference costs flat.
- Final tasks are cached locally in the Family Vault.
- Meaning Map privacy is respected — only final context shared, never raw reflections.

## Developer Notes
- KinSocket must never push raw swaps or negotiation drafts upstream.
- Ritual Log (Star Trails) records when plans are accepted, modified, or re-negotiated.
- Parents may oversee swaps but cannot force them without Council Ritual or consensus.

🗝️🌙✨
