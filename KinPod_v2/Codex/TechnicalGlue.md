# 🛠️ Technical Glue — Final Canon

## 1️⃣ User DB & Identity
- UUID for each user.
- Roles: Guardian, Child, Admin.
- Consent flags for triple consent unlocks.
- Device keys for multi-device pairing.
- FamilyGroup links all Local Buddies in a Family Pod.

## 2️⃣ Orchestration
- Batch loop: Weekly Family Council → Quest → daily sync for chores.
- Conflict resolution: versioned orchestration state.
- Local Buddy detects stale data → re-syncs.

## 3️⃣ Personal Codex
- Each child’s Journal becomes a local RAG DB.
- Fully local or iCloud.
- Shares high-level summaries for Foresight only with child consent.

## 4️⃣ Family Pod & Related Tags
- Codex nodes can have FamilyPod tags.
- Parents see volunteered context, never raw Journal unless shared.
- Meaning Map stays sealed unless triple consent.

- PairingSpec.md defines how KinPod and ThreadSpace connect with voluntary link, scope, and Ritual Log.

## 5️⃣ Shared Pin Board
- Family Message Board lives in Vault.
- Kids can post “Status Notes”: studying, gaming, visiting friends.
- Parents & siblings can see these without snooping.
- Feels like a “pin board outside bedroom door.”
- Buddy can relay gentle status to Family Guardian.
- Fully voluntary. Kids choose what to post.

## 6️⃣ Security
- Local Codex encrypted.
- Orchestrator metadata encrypted.
- Triple consent uses threshold keys.
- Device linking with family approval.
- All network calls mTLS.

## 7️⃣ Funnel
- Personal Codex exportable into ThreadSpace.
- Families stay a pod. Kids grow into adult Companion.

## Summary
- Sovereign, consent-based, related context flows, clear batch orchestration.
- Families stay in flow without hidden surveillance.
