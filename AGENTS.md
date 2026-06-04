# Repository Guidelines

## Project Structure & Module Organization
- `MoneyHashPayment/Classes/` holds the Swift source exposed by the pod (currently `MoneyHashPayment.swift`).
- `*.xcframework/` directories contain vendored binaries for MoneyHash, MoneyHashShared, LeanSDK, and moeyhashleantest. Treat these as build artifacts; do not modify contents manually.
- `MoneyHashLeanTest.podspec` defines the CocoaPods configuration (version, vendored frameworks, deployment target).
- `README.md` and `LICENSE` provide usage and licensing details.

## Build, Test, and Development Commands
- `pod lib lint MoneyHashLeanTest.podspec` validates the podspec locally (use when changing versions or vendored frameworks).
- `pod install` is used by consumers in their apps; there is no Example app or local build script in this repo.
- For manual validation, open a host app and link the pod via a local path in its Podfile.

## Coding Style & Naming Conventions
- Swift code follows standard Swift API Design Guidelines.
- Indentation: 4 spaces; no tabs.
- Naming: `PascalCase` for types, `camelCase` for functions and properties, `UPPER_SNAKE_CASE` only for constants when required by Objective-C interop.
- No formatter or linter is configured; keep diffs minimal and consistent.

## Testing Guidelines
- No test targets are included in this repository.
- If tests are added, use `XCTest` and place them under a `Tests/` directory with names like `MoneyHashLeanTestTests` and files ending in `Tests.swift`.

## Commit & Pull Request Guidelines
- Commit history uses a simple release-style format like `Version 4.0.11`.
- Keep commits focused; bump versions and update `MoneyHashLeanTest.podspec` together.
- Pull requests should include a short description, the motivation for the change, and any relevant integration notes (e.g., new framework versions or deployment target changes).

## Security & Configuration Tips
- Verify vendored `*.xcframework` contents and checksums before publishing a release.
- Keep `s.ios.deployment_target` aligned with supported SDK requirements in `MoneyHashLeanTest.podspec`.
