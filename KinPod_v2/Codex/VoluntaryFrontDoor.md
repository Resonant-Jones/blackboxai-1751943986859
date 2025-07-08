# 🗝️ Voluntary Front Door — Journal Sharing

## What it is
- Children can generate a secure, time-limited share link for selected Reflection Leaves.
- Parents can view only the selected content.
- Parents never see how much is hidden.
- Shared entry can be Public (Family Vault) or Private (one-time).
- Kids may choose to invite parents back in at any time, but never forced.

## iCloud Orchestration
- Snapshots live in child’s personal iCloud container, encrypted at rest.
- Family Vault stores lightweight pointer metadata: UUIDs, expiry, permission flags.
- Parents access via secure link that maps to that pointer.
- Local Buddy handles encryption/decryption — no cloud LLM needed.
- Revocation: child deletes snapshot or pointer; access is gone.
- All events logged in Family Ritual Log (Star Trails).
- Optional fallback: ThreadSpace Cloud for non-iCloud families.

## Ritual Boundaries
- Parents must be invited; no forced backdoor.
- Triple consent if sharing crosses sealed Meaning Map.
- Guardian Coach never explains what remains hidden.

## Why
- No hidden backdoor: only voluntary sharing.
- Kids feel sovereign; parents get context without spying.
- No forced cloud costs: storage is routed through family’s existing iCloud.

## Developer Notes
- Use UUID-based links with auto-expiry.
- No raw Journal content in shared metadata.
- Ritual Log must show when links are generated, used, or revoked.

## Acceptance Criteria
✅ Secure UUID-based links.
✅ Never shows hidden counts.
✅ No LLM inference needed.
✅ Works with iCloud or fallback.
✅ Fully consent-based.
✅ Ritual Log records all flow.

🗝️🌙✨
