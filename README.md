# OpenDoor‑NFC 🚪📱
> **Clone any ISO‑14443 NFC door card into Apple Wallet** – one iPhone opens every door, no more key‑cards.

[![Swift](https://img.shields.io/badge/Swift-5.9-orange?logo=swift)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS%2015%2B-lightgrey?logo=apple)](https://developer.apple.com/ios/)
[![License](https://img.shields.io/github/license/angus5402/opendoor-nfc)](LICENSE)
[![Release](https://img.shields.io/github/v/release/angus5402/opendoor-nfc)](https://github.com/angus5402/opendoor-nfc/releases)
[![CI](https://github.com/angus5402/opendoor-nfc/actions/workflows/ci.yml/badge.svg)](https://github.com/angus5402/opendoor-nfc/actions)

---

## ✨ Features
- **NFC Tag Emulation** – read a physical door card (ISO‑14443A/B) and write a virtual copy.
- **Apple Wallet Pass Generator** – creates a `.pkpass` with encrypted payload, auto‑updates on rotation.
- **Multi‑Door Management** – store dozens of passes, each with custom icon/colour/label.
- **Secure Enclave Storage** – private keys never leave the device.
- **CI/CD** – SwiftLint, unit tests, TestFlight upload on every tag.

## 📦 Installation
```bash
git clone https://github.com/angus5402/opendoor-nfc.git
cd opendoor-nfc
open OpenDoorNFC.xcodeproj
```
*Requires Xcode 15+, iOS 15+ device (Wallet passes need a real device).*

## 🛠️ Usage
1. **Add a new door** – tap **“Scan Card”**, hold the physical NFC tag to the back of the iPhone.  
2. **Name & colour** – give the pass a recognisable label (e.g. “Office‑Main”, “Home‑Garage”).  
3. **Save to Wallet** – the app writes a signed `.pkpass` and opens the Wallet app for confirmation.  
4. **Open a door** – double‑click the side button (or use the Wallet widget) and hold the phone to the reader.

## 🤝 Contributing
PRs are welcome! Please:
1. Run `swiftlint` & `swift test` locally.  
2. Follow the **Conventional Commits** style.  
3. Add/update unit tests for new NFC parsing logic.

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## 📄 License
MIT © 2024 Angus Chung – see [LICENSE](LICENSE).

## 🙋‍♂️ Maintainer
**Angus Chung** – <angus5402@gmail.com> – [@angus5402](https://github.com/angus5402)  
*Core maintainer, full‑stack iOS developer, open‑source enthusiast.*

---

*Star ⭐ this repo if it saves you a key‑card!*
