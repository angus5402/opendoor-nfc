import Foundation
import PassKit

/// Helper to create an Apple Wallet (`.pkpass`) for a cloned NFC door card.
/// This is a **stub** – a real implementation would sign the pass with a
/// Pass Type ID certificate and embed the encrypted NFC payload.
public struct WalletPassGenerator {

    public struct DoorPass {
        public let identifier: String   // e.g. "com.example.opendoor.office-main"
        public let displayName: String  // e.g. "Office – Main Entrance"
        public let iconName: String     // asset name in the pass bundle
        public let backgroundColor: String // hex, e.g. "#007AFF"
        public let nfcPayload: Data     // encrypted payload the reader expects
    }

    public enum GeneratorError: Error, LocalizedError {
        case missingCertificate
        case signingFailed(String)
        case payloadEncodingFailed

        public var errorDescription: String? {
            switch self {
            case .missingCertificate:
                return "Pass Type ID certificate not found in the app bundle."
            case .signingFailed(let msg):
                return "Pass signing failed: \(msg)"
            case .payloadEncodingFailed:
                return "Failed to encode NFC payload into the pass."
            }
        }
    }

    /// Creates a signed `.pkpass` data blob ready to be added to Wallet.
    /// - Parameter pass: The door pass description.
    /// - Returns: Raw `.pkpass` data.
    public static func generatePass(for pass: DoorPass) throws -> Data {
        // 1. Build the pass.json dictionary
        var passDict: [String: Any] = [
            "formatVersion": 1,
            "passTypeIdentifier": pass.identifier,
            "serialNumber": UUID().uuidString,
            "teamIdentifier": "YOUR_TEAM_ID",          // <-- replace with your Team ID
            "organizationName": "OpenDoor NFC",
            "description": "Cloned NFC door card for \(pass.displayName)",
            "logoText": pass.displayName,
            "foregroundColor": "rgb(255,255,255)",
            "backgroundColor": pass.backgroundColor,
            "labelColor": "rgb(255,255,255)",
            "nfc": [
                "message": pass.nfcPayload.base64EncodedString(),
                "encryptionPublicKey": "YOUR_PUBLIC_KEY_BASE64" // <-- replace
            ],
            "barcode": [
                "message": "",
                "format": "PKBarcodeFormatQR",
                "messageEncoding": "iso-8859-1"
            ],
            "relevantDate": ISO8601DateFormatter().string(from: Date())
        ]

        // 2. Serialize to JSON
        guard let jsonData = try? JSONSerialization.data(withJSONObject: passDict, options: [.prettyPrinted]) else {
            throw GeneratorError.payloadEncodingFailed
        }

        // 3. In a real app you would:
        //    - Create a temporary directory with pass.json, icon assets, manifest.json, signature
        //    - Sign manifest with your Pass Type ID private key (via `openssl` or `Security` framework)
        //    - Zip the directory into a `.pkpass` file.
        // Here we simply return the JSON as a placeholder.
        return jsonData
    }
}