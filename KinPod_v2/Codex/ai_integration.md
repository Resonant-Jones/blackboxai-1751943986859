# 🗝️ AI Integration

This file outlines how KinPod uses local AI to orchestrate tasks, gentle mischief, and semantic nudges for the Family Pod.

## ✨ Core Principles
- Mischief logic must be gentle, not manipulative or coercive.
- All AI actions must respect the Trust Manifest.
- The Companion (Gemma) only uses local inference for routine nudges.
- Cloud inference is opt-in for deeper conversations or stylization.

## ✅ What needs to be wired up

### 1️⃣ Buddy Companion (Gemma)
- Handles local semantic translation.
- Shapes user messages with Meaning Map.
- Reinforces healthy communication patterns.

### 2️⃣ Mischief Nudging
- Example: Buddy notices “always” language → suggests softer wording.
- Nudges never explain “why” — just gently redirect.
- Nudges should be logged as ephemeral only — no raw Meaning Map exposed.

### 3️⃣ Orchestration Layer
- Buddy connects with Task Engine to assign, shuffle, or swap chores.
- Story integration: Buddy wraps tasks in story arcs appropriate to each child’s personality layer.

### 4️⃣ Privacy & Consent
- Local-only by default.
- Triple consent required for any raw Meaning Map unlock.
- All ephemeral guidance is off-record after the session ends.

## 📌 Developer Notes
- Log all nudges to Ritual Log (Star Trails) at a high level: *“Buddy suggested softer language for Malachi on June 29.”*
- Do not store or replay raw semantic corrections.
- Ensure orchestration bridge (KinSocket) never leaks raw personal context upstream.

## 🔮 Future Ritual
This AI layer will grow as the Family Pod evolves. Ideas, examples, and expansions belong here — extend with care.

🗝️🌙✨
