import XCTest
@testable import OpenDoorNFC

final class NFCReaderTests: XCTestCase {

    func testReaderInitialization() {
        let reader = NFCReader()
        XCTAssertNotNil(reader)
    }

    func testNFCErrorDescriptions() {
        let err1 = NFCError.readingNotAvailable
        let err2 = NFCError.noTagFound
        let err3 = NFCError.payloadDecodingFailed

        XCTAssertFalse(err1.errorDescription?.isEmpty ?? true)
        XCTAssertFalse(err2.errorDescription?.isEmpty ?? true)
        XCTAssertFalse(err3.errorDescription?.isEmpty ?? true)
    }
}

final class WalletPassGeneratorTests: XCTestCase {

    func testGeneratorErrorDescriptions() {
        let e1 = WalletPassGenerator.GeneratorError.missingCertificate
        let e2 = WalletPassGenerator.GeneratorError.signingFailed("test")
        let e3 = WalletPassGenerator.GeneratorError.payloadEncodingFailed

        XCTAssertFalse(e1.errorDescription?.isEmpty ?? true)
        XCTAssertFalse(e2.errorDescription?.isEmpty ?? true)
        XCTAssertFalse(e3.errorDescription?.isEmpty ?? true)
    }

    func testGeneratePassReturnsData() throws {
        let pass = WalletPassGenerator.DoorPass(
            identifier: "com.example.test",
            displayName: "Test Door",
            iconName: "icon",
            backgroundColor: "#007AFF",
            nfcPayload: Data("payload".utf8)
        )
        let data = try WalletPassGenerator.generatePass(for: pass)
        XCTAssertFalse(data.isEmpty)
        // Ensure it's valid JSON
        let json = try XCTUnwrap(try JSONSerialization.jsonObject(with: data) as? [String: Any])
        XCTAssertEqual(json["passTypeIdentifier"] as? String, pass.identifier)
    }
}