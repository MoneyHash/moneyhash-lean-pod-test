# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A CocoaPods distribution repo (`MoneyHashLeanTest`) that packages the MoneyHash + Lean integration as **vendored binary xcframeworks**. There is almost no source code here — the actual SDK code lives elsewhere and is shipped as prebuilt binaries:

- `MoneyHashLean.xcframework/` — the integration layer. Its public API is `DefaultMoneyHashLeanBuilder`, which builds a `MoneyHashCore.MoneyHashBankAccountSDK`. It imports `LeanSDK` and `MoneyHashCore` (provided via the `MoneyHashCoreTest` pod dependency).
- `LeanSDK.xcframework/` — the third-party Lean SDK binary.
- `MoneyHashPayment/Classes/MoneyHashPayment.swift` — an empty placeholder class; not the real surface area.
- `MoneyHashLeanTest.podspec` — the single source of truth for the pod: version, vendored frameworks, `MoneyHashCoreTest` dependency, iOS 14.0 deployment target.

Treat the `*.xcframework/` directories as build artifacts — never edit their contents manually; replace them wholesale when a new binary is dropped in.

## Commands

- `pod lib lint MoneyHashLeanTest.podspec` — validate the podspec locally; run when changing the version or swapping vendored frameworks.
- There is no build script, Example app, or test target in this repo. Manual validation = link the pod via a local `:path =>` entry in a host app's Podfile and run `pod install` there.

## Release workflow

- Commits are release-style (e.g. `1.0.9`). Bump `s.version` in the podspec and the new/updated xcframeworks together in one focused commit.
- The public API surface of the binaries can be inspected via the `.swiftinterface` files under `*.xcframework/ios-arm64/*.framework/Modules/*.swiftmodule/`.
- Keep `s.ios.deployment_target` aligned with what the vendored frameworks support.

## Conventions

- Swift: 4-space indentation, standard Swift API Design Guidelines naming. No formatter/linter configured — keep diffs minimal.
- If tests are ever added: XCTest under a `Tests/` directory, files ending in `Tests.swift`.
