# DOOMSCRLL Audience Mobile App

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-3.13+-02569B.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2.svg)](https://dart.dev/)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-brightgreen.svg)](https://flutter.dev/multi-platform)

This repository contains the cross-platform Flutter mobile application for the **DOOMSCRLL** ecosystem. Built with clean MVVM architecture, custom painters, and GPU layer isolation for smooth 60fps performance on Android and iOS devices.

---

## 🌐 DOOMSCRLL Open Source Ecosystem

* **Audience Mobile App** (`doomscrll_app_audience`) — *You are here*
* **Backend API** (`doomscrll-backend`) — Fastify 5 REST API & PostgreSQL schema
* **Landing Website** (`doomscrll-landing-website`) — Astro public portal
* **Audience Webapp** (`doomscrll-webapp-audience`) — SvelteKit 2 showcase & discovery feed
* **Creator Webapp** (`doomscrll-webapp-doomlit`) — SvelteKit 2 slot reservation & creator dashboard

---

## 1. Architecture & Design Patterns

The mobile application follows a strict **MVVM (Model-View-ViewModel)** architectural pattern:

```text
lib/
├── l10n/                # ARB reactive localization files (EN / TR)
├── models/              # Immutable domain entities (Project, Profile, Category, Tag)
├── repositories/        # Data abstraction layer for remote API & cache
├── services/            # Low-level HTTP client, CDN resolver, & URL launchers
├── theme/               # Design system typography (Playfair, Space Mono) & ticket painters
├── utils/               # Date formatters, color generators, & layout math
├── viewmodels/          # ValueNotifier / ChangeNotifier state handlers
└── views/               # Reactive UI screens & custom widgets
    ├── feed/            # Discovery feed with ticket mask animator
    ├── detail/          # Sticky cover appbar & screenshot zoom hero
    └── common/          # Modals, YouTube player facade, & platform anchors
```

---

## 2. Key Features

- **MVVM State Management**: Decoupled UI and business logic using `ChangeNotifier` and reactive viewmodels (`FeedViewModel`, `ProjectDetailViewModel`, `LanguageViewModel`).
- **Custom Ticket Mask Feed Animator**: Distinct ticket-frame aesthetic implemented with custom Flutter canvas painters and smooth scroll animations.
- **Sticky Cover Appbar with GPU Isolation**: Fluid header collapse with layer isolation to maintain steady 60fps rendering during fast scrolls.
- **Privacy-Enhanced YouTube Player Facade**: Embedded video playback using `youtube_player_iframe` with privacy flags enabled.
- **Full-Screen Hero Screenshot Zoom**: Interactive full-screen image viewer with smooth hero transitions and pinch-to-zoom capabilities.
- **Dual CDN Pipeline**: Flexible asset handling fetching project media from `cdn.doomscrll.com` and brand vector graphics from `assets.doomscrll.com` with bundled SVG fallbacks.
- **Platform Action Anchors**: Dynamic action buttons (`TextButton.icon`) directing users to external platforms (Steam, Web, App Store, Google Play, GitHub).
- **Reactive Internationalization (i18n)**: Instant runtime language switching between English (EN) and Turkish (TR) powered by Flutter ARB localizations.

---

## 3. Local Development & Setup

### Prerequisites
- **Flutter SDK**: `v3.13.0` or higher ([Installation Guide](https://docs.flutter.dev/get-started/install))
- **Dart SDK**: `v3.0.0` or higher
- **Android Studio** / **Xcode** (for mobile emulator / simulator support)

### Setup Commands

1. **Clone the repository**:
   ```bash
   git clone https://github.com/DOOMSCRLL/doomscrll_app_audience.git
   cd doomscrll_app_audience
   ```

2. **Get Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Generate Localizations**:
   ```bash
   flutter gen-l10n
   ```

4. **Run Application (Emulator or Connected Device)**:
   ```bash
   flutter run
   ```

5. **Run Static Analysis & Tests**:
   ```bash
   flutter analyze
   flutter test
   ```

6. **Build Release Artifacts**:
   - **Android APK**:
     ```bash
     flutter build apk --release
     ```
   - **Android App Bundle**:
     ```bash
     flutter build appbundle --release
     ```
   - **iOS App**:
     ```bash
     flutter build ipa --release
     ```

---

## 📄 License & Trademark Notice

- **Code License**: Source code is licensed under the [Apache License, Version 2.0](LICENSE).
- **Trademark Policy**: The **DOOMSCRLL** name, logos, brand identity, and custom design assets are reserved trademarks. See [TRADEMARK.md](TRADEMARK.md) for usage policy and rebranding guidelines for forks.