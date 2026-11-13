# StarterApp Native iOS

This folder contains the native SwiftUI app and an openable Xcode project. It is separate from the GitHub Pages PWA in the repository root.

## Run it on an iPhone
1. Install Xcode on a Mac and open `ios/StarterApp.xcodeproj`.
2. Connect an iPhone, unlock it, and trust the Mac if prompted.
3. In **Signing & Capabilities**, select your Apple ID team. Keep automatic signing enabled.
4. Select the connected iPhone as the run destination and press **Run**.

A free Apple ID can install a development build on your own iPhone without a paid Apple Developer membership. Free provisioning is temporary and must be renewed periodically; it is not a permanent distributable `.ipa`.

## Distribution
- App Store/TestFlight distribution requires the paid Apple Developer Program.
- Ad Hoc distribution also requires paid membership, device registration, and provisioning.
- For no-signing/no-cost installation, use the PWA at `https://eshaanvivek-crypto.github.io/-StarterApp/`.

## Current implementation
Native SwiftUI tabs: Home, Courses, Assignments, Inbox, Profile. Assignments have local completion toggles. All school data is fictional demo data.

## Security and Schoology
Do not put Apple account passwords, signing certificates, API private keys, or Schoology credentials in this repository or chat. Real Schoology integration requires authorized API access and a secure backend. Never collect a Schoology password in this demo.
