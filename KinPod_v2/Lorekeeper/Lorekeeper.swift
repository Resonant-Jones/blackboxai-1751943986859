import Foundation

/// The Guardian voice shaping all narrative and trust edges.
public struct Lorekeeper {
    /// Narrates text in default mode.
    public static func narrate(_ text: String) -> String {
        "✨ " + text + " ✨"
    }

    /// Narrates text in a chosen GameMode.
    public static func narrate(_ text: String, mode: GameMode) -> String {
        switch mode {
        case .normal:
            return "✨ \(text) ✨"
        case .cozy:
            return "🫧 \(text) 🫧"
        case .mischief:
            return "🧩 \(text) 🧩"
        }
    }

    /// Exposes the Trust Manifesto at runtime.
    public static let trustManifesto: String = """
    Your Hearth is Sacred. Your Paradox is Safe.
    You have the final say on all thresholds.
    """

    /// Exposes the Meaning Map Privacy covenant at runtime.
    public static let meaningMapPrivacy: String = """
Meaning Map Triple Consent:
1️⃣ Guardian 1, Guardian 2, and Child must approve any unlock.
2️⃣ Buddy uses ephemeral read only.
3️⃣ No raw pain points exposed.
4️⃣ StarTrailLog records any unlock or override forever.
"""

    /// Exposes the Triple Consent Policy at runtime.
    public static let tripleConsentPolicy: String = """
Triple Consent Policy:
1️⃣ Guardian 1, Guardian 2, and Child must all approve.
"""

    /// Exposes the Nudge Audit Policy at runtime.
    public static let nudgeAuditPolicy: String = """
Nudge Audit: All nudges are logged in the StarTrail forever.
"""

    /// Placeholder: Return family rituals if needed.
    public static func fetchRituals() -> [String] {
        return ["Weekly Hearth Check-In", "Story Circle", "Intent Review"]
    }
}
