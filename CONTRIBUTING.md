# Contributing to OpenDoor‑NFC

Thank you for considering a contribution! 🎉  
We welcome bug reports, feature requests, documentation improvements, and code changes.

---

## How to Contribute

1. **Fork** the repository and create a new branch from `main`.
2. **Run the test suite** locally to ensure a clean baseline:
   ```bash
   swift test
   ```
3. **Make your changes** – follow the coding style (see *Style Guide* below).
4. **Add / update tests** for any new behaviour.
5. **Run SwiftLint** (if available) and ensure the build passes:
   ```bash
   swift build && swift test
   ```
6. **Commit** using *Conventional Commits* (e.g. `feat: add multi‑door support`).
7. **Push** to your fork and open a **Pull Request** against `main`.

---

## Style Guide

- **Swift**: 4‑space indentation, trailing commas, `swiftformat` configuration in `.swiftformat` (if present).
- **Documentation**: Public APIs must have DocC comments (`///`).
- **Testing**: Prefer XCTest; aim for >80 % coverage on new code.
- **Commits**: Follow [Conventional Commits](https://www.conventionalcommits.org/).

---

## Code of Conduct

This project follows the [Contributor Covenant](https://www.contributor-covenant.org/version/2/1/code_of_conduct/).  
By participating you agree to uphold this code.

---

## Reporting Issues

- Use the **Issues** tab.
- Provide a clear title, steps to reproduce, expected vs. actual behaviour, and device/OS version.

---

## License

By contributing you agree that your contributions will be licensed under the **MIT License** (see `LICENSE`).