import Foundation
import CoreNFC

/// A simple wrapper around CoreNFC to read ISO‑14443 (NFC‑A/B) tags.
/// This is a **stub** – replace with real implementation when hardware is available.
public final class NFCReader: NSObject, NFCNDEFReaderSessionDelegate {
    public typealias Completion = (Result<NFCNDEFMessage, Error>) -> Void

    private var session: NFCNDEFReaderSession?
    private var completion: Completion?

    public override init() {
        super.init()
    }

    /// Starts a scanning session. Call from the main thread.
    public func startScanning(completion: @escaping Completion) {
        guard NFCNDEFReaderSession.readingAvailable else {
            completion(.failure(NFCError.readingNotAvailable))
            return
        }
        self.completion = completion
        session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        session?.alertMessage = "Hold your iPhone near an NFC door card."
        session?.begin()
    }

    // MARK: - NFCNDEFReaderSessionDelegate

    public func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        guard let message = messages.first else { return }
        completion?(.success(message))
        self.session = nil
    }

    public func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        completion?(.failure(error))
        self.session = nil
    }
}

/// Errors that can be thrown by `NFCReader`.
public enum NFCError: LocalizedError {
    case readingNotAvailable
    case noTagFound
    case payloadDecodingFailed

    public var errorDescription: String? {
        switch self {
        case .readingNotAvailable:
            return "NFC tag reading is not available on this device."
        case .noTagFound:
            return "No compatible NFC tag was found."
        case .payloadDecodingFailed:
            return "Failed to decode the tag's NDEF payload."
        }
    }
}