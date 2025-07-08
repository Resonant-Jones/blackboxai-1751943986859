# 🔄 Shared Inference & Caching

## Principle
- Don't recompute what you don't have to.
- Families benefit from stable orchestration — Buddy should feel familiar and consistent.

## Templates
- Use standard Family Quest templates for common chores and routines.
- Shuffle task orders and rewards for freshness.
- Local Gemma personalizes tone, characters, and story hooks per child’s Personality Layer.

## Cache Logic
- Cache orchestration results in the Family Vault (local/iCloud).
- Use lightweight hashed versions to prevent accidental leakage.
- Only regenerate if:
  - Family config changes (new child, major role shift, new Council Ritual).
  - A parent or grownup explicitly requests a fresh story or reset.
  - Special events that need a custom arc.

## Ritual Boundaries
- Caching must respect Meaning Map privacy — never cache raw reflections.
- Cached stories only store final orchestration output, not ephemeral Companion nudges.
- Ritual Log (Star Trails) records when a cache is created or purged.

## Benefits
- Lower cloud cost and compute burden.
- Faster responses for kids and grownups.
- Families feel a stable, consistent Buddy vibe — the Pod’s story arc stays cohesive.

## Developer Notes
- Always fallback to local inference first.
- KinSocket must confirm cache status before orchestrating new tasks.
- Orchestration Bridge only pushes final stories upstream with consent.

🗝️🌙✨
