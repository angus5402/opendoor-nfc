import XCTest
@testable import OpenDoorNFC

final class NFCReaderTests: XCTestCase {

    func testReaderInitialization() {
        let reader = NFCReader()
        XCTAssertNotNil(reader)
    }

    // Because NFCNDEFReaderSession requires a real device,
    // we only test that the API compiles and the error types exist.
    func testNFCErrorDescriptions() {
        let err1 = NFCError.readingNotAvailable
        let err2 = NFCError.noTagFound
        let err3 = NFCError.payloadDecodingFailed

        XCTAssertFalse(err1.errorDescription?.isEmpty ?? true)
        XCTAssertFalse(err2.errorDescription?.isEmpty ?? true)
        XCTAssertFalse(err3.errorDescription?.isEmpty ?? true)
    }
}