import SwiftUI
import OpenDoorNFC   // assumes the package is linked

struct ContentView: View {
    @State private var status = "Tap “Scan Card” to clone an NFC door card."
    @State private var isScanning = false

    let reader = NFCReader()

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                Image(systemName: "lock.icloud.fill")
                    .font(.system(size: 72))
                    .foregroundColor(.blue)

                Text("OpenDoor‑NFC Demo")
                    .font(.title)
                    .bold()

                Text(status)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)

                Button(action: startScan) {
                    Label(isScanning ? "Scanning…" : "Scan Card", systemImage: "wave.3.right")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .disabled(isScanning)
                .padding(.horizontal)

                Spacer()
            }
            .padding()
            .navigationTitle("Demo")
        }
    }

    private func startScan() {
        isScanning = true
        status = "Hold your iPhone near an NFC door card…"
        reader.startScanning { result in
            DispatchQueue.main.async {
                self.isScanning = false
                switch result {
                case .success(let message):
                    self.status = "✅ Tag read! Payload length: \(message.records.first?.payload.count ?? 0) bytes."
                    // Here you would call WalletPassGenerator.generatePass(...)
                case .failure(let error):
                    self.status = "❌ \(error.localizedDescription)"
                }
            }
        }
    }
}

#Preview {
    ContentView()
}