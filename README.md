# Brandie

A Flutter application featuring an Oriflame-style **Smart Post** experience: a sequential onboarding loader, a full-screen vertical post feed, an in-app caption editor, deep-linking to the store, and multi-platform social sharing.

## Tech Stack

| Area | Choice |
|------|--------|
| Framework | Flutter (stable) 3.38.5 |
| Language | Dart 3.10.4 (SDK `^3.10.4`) |
| State management | [GetX](https://pub.dev/packages/get) (`get`) |
| Navigation | GetX named routes (`getPages` / `initialRoute`) |
| Responsive sizing | [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) |
| Vector assets | [flutter_svg](https://pub.dev/packages/flutter_svg) |
| URL / deep links | [url_launcher](https://pub.dev/packages/url_launcher) |
| Social sharing | [social_sharing_plus](https://pub.dev/packages/social_sharing_plus) |
| File paths | [path_provider](https://pub.dev/packages/path_provider) |
| Localization | GetX `Translations` |

### Dependencies

```yaml
dependencies:
  flutter_screenutil: ^5.9.3
  flutter_svg: ^2.3.0
  get: ^4.7.3
  path_provider: ^2.1.6
  social_sharing_plus: ^1.2.3
  url_launcher: ^6.3.2

dev_dependencies:
  flutter_lints: ^6.0.0
```

## Architecture

The project follows an MVVM-style layering on top of GetX:

```
View (widgets)  ->  Controller (GetxController)  ->  ViewModel  ->  Repository  ->  local JSON
```

- **View** – Stateless widgets rebuilt via `GetBuilder`.
- **Controller** – Presentation state and user intent (`update([id])`).
- **ViewModel** – Bridges controller and repository; no UI logic.
- **Repository** – Loads data (e.g. `assets/data/smart_posts.json`).

### Project structure

```
lib/
  controller/        # Getx controllers + bindings (home, ori_home, smart_post, edit_caption, loaders)
  view_model/        # ViewModels (smart_post)
  repository/        # Data sources (smart_post JSON repository)
  models/            # Data models (smart_post, progress_step)
  views/             # Screens and widgets
  shared/            # Shared widgets (sequential_loader, share_loader) and enums
  utils/             # Navigation, url_launcher, social_share utilities
  core/              # Constants (assets, translations)
  res/               # Dimensions / responsive helpers
  main.dart          # App entry + GetMaterialApp + barrel exports
assets/
  data/              # smart_posts.json
  images/            # Backgrounds, profile, product, share icons
  icons/             # SVG icons
```

## Features

- Sequential onboarding loader before the Smart Post feed appears.
- Full-screen vertical post feed (`PageView`) with a center-right page indicator.
- Optional product card that fades in after a delay; whole post is tappable to open the store link.
- Scrollable caption with expand/collapse and an in-app caption editor (GetX route).
- Multi-platform social sharing (Facebook, WhatsApp, Telegram, Twitter, LinkedIn, Reddit) with a staged share loader that copies the caption to the clipboard before opening the target app.
- Centralized localization via `TranslationUtils` + `TranslationFile`.

## Quick Demo (Prebuilt APK)

A ready-to-install release APK is included for quick testing and demos on any Android device, no build setup required:

```
build/app/outputs/flutter-apk/app-release.apk
```

To install it:

1. Copy `app-release.apk` to your Android device (USB, email, cloud, etc.).
2. On the device, enable **Install unknown apps** for the file manager/browser you use to open it.
3. Tap the APK and follow the prompts to install.

Alternatively, with the device connected via USB and USB debugging enabled:

```bash
adb install build/app/outputs/flutter-apk/app-release.apk
```

> This APK is for testing/demo purposes only. To run on iOS or make code changes, follow the development setup below.

## Getting Started

### Prerequisites

- Flutter SDK **3.38.5** (stable) or compatible, bundling Dart **3.10.4**.
- A configured device/emulator (Android SDK, Xcode for iOS, etc.).

Verify your setup:

```bash
flutter --version
flutter doctor
```

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
# List available devices
flutter devices

# Run on the default connected device
flutter run

# Or target a specific device
flutter run -d <device_id>
```

> After adding or changing native plugins (e.g. `url_launcher`, `social_sharing_plus`), perform a full cold restart (`flutter run`) rather than a hot reload/restart so native code is registered.

### Build release binaries

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS (on macOS)
flutter build ios --release
```

## Platform Configuration

Some functionality requires platform manifests to declare app queries:

- **Android** – `android/app/src/main/AndroidManifest.xml` declares `<queries>` for `url_launcher` (http/https/sms/tel) and social apps (Facebook, WhatsApp, Telegram, Twitter, LinkedIn, Reddit), plus a `FileProvider` (`res/xml/filepaths.xml`) for sharing media.
- **iOS** – `ios/Runner/Info.plist` declares `LSApplicationQueriesSchemes` for the supported URL and social app schemes.

## Useful Commands

```bash
flutter analyze        # Static analysis / lints
flutter test           # Run tests
flutter clean          # Clear build artifacts
```
