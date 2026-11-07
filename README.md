# fest_outdoor

Fest outdoor - sport festival

### To generate locales without restart

```bash
flutter gen-l10n
```

### To generate riverpod & freezed classes

```
flutter packages pub run build_runner build
```

### Prepare the next production release for Google Play

- Prepare Flutter and the Android toolchain: run `flutter doctor`, resolve Android setup issues, and accept SDK licenses with `flutter doctor --android-licenses`. Use JDK 17 and install the Android SDK and NDK required by `android\app\build.gradle`.
- Update the festival dates, content, assets, and Czech/Polish translations where needed. Check the app label in `android\app\src\main\AndroidManifest.xml`.
- Update `version` in `pubspec.yaml` using `versionName+versionCode` (for example, `1.6.0+6`). The number after `+` must be greater than every version code already uploaded to Google Play; check Play Console rather than relying on the previous local version.
- Configure release signing in the local, Git-ignored `android\key.properties` file using `storeFile`, `storePassword`, `keyAlias`, and `keyPassword`. Use the existing upload keystore for this app, keep it outside the repository, and back it up securely. Do not commit signing credentials or generate a replacement key for each release.
- Restore dependencies and regenerate code from the repository root: `flutter pub get`, `flutter gen-l10n`, and `dart run build_runner build`. Review the resulting changes.
- Run `flutter analyze` and `flutter test`; resolve release-blocking failures before building.
- Build the signed Android App Bundle with `flutter build appbundle --release`. The upload artifact is `build\app\outputs\bundle\release\app-release.aab`. Keep the application ID `cz.pzkogrodek.fest_outdoor` unchanged.
- In Google Play Console, upload the bundle to an internal testing release first. Review target API, native-library/16 KB page-size compatibility, and other current Play requirements; resolve any blocking warnings.
- Install the release through Google Play on real Android devices. Check both languages, program dates, favorites, links, feedback, organizer login, camera permissions, QR scanning, manual ticket entry, and ticket confirmation. Also test updating from the currently published version.
- Prepare localized release notes and update store screenshots, privacy policy, Data safety, and App content declarations if this release changes them. Provide reviewer access/instructions for organizer-only features where required.
- Promote the tested bundle to Production, review the release details, and submit it for review. Use a staged rollout when available, then monitor crashes, ANRs, and user feedback before expanding the rollout.
