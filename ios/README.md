# StarterApp Native iOS

This folder contains the native SwiftUI implementation of StarterApp. It is separate from the GitHub Pages PWA in the repository root.

## Create the Xcode project
1. Open Xcode on a Mac.
2. Choose **File → New → Project → iOS → App**.
3. Product Name: `StarterApp`; Interface: **SwiftUI**; Language: **Swift**.
4. Replace the generated app entry point with `StarterAppApp.swift` and add `ContentView.swift` from this folder to the app target.
5. Set a unique Bundle Identifier, such as `com.yourcompany.starterapp`.
6. Under **Signing & Capabilities**, enable automatic signing and select your Apple Developer team.

## Distribution
- Use Xcode to run the app on your own connected iPhone.
- Use **Product → Archive** and App Store Connect to upload a signed build for TestFlight.
- TestFlight is the recommended way to share with friends. Friends install Apple's TestFlight app and accept your invitation.
- Ad Hoc distribution is possible but requires registering each device UDID and provisioning a new build.

## Current implementation
Native SwiftUI tabs: Home, Courses, Assignments, Inbox, Profile. Assignments have local completion toggles. All school data is fictional demo data.

## Security and Schoology
Do not put Apple account passwords, signing certificates, API private keys, or Schoology credentials in this repository or chat. Real Schoology integration requires authorized API access and a secure backend. Never collect a Schoology password in this demo.
