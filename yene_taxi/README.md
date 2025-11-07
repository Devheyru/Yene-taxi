# Yene-Taxi

Multi-role taxi platform (Passenger, Driver, Admin) built with Flutter, Firebase, Riverpod, and GoRouter.

## Current Features

- Auth: Email/Password & Google Sign-In (fingerprints added for Android).
- Automatic admin role assignment for `heyru638@gmail.com` on first sign-in.
- Sign-Up shown first (with navigation to Sign-In) for smoother onboarding.
- Role-based routing via `RoleGate` (redirects to passenger / driver / admin dashboards).
- Global error handling (Flutter framework, platform dispatcher, zone) with Firestore `errorLogs` write (requires dev rule below).
- Passenger: Simple ride request (creates Firestore `rides` doc) + last ride ID display.
- Driver: Online toggle, throttled location sync (every ~15s or distance threshold), open rides list with Accept, assigned rides list.
- Admin: Pending driver approval list with approve action.
- Data layer: `AuthRepository`, `DriverRepository`, `RideRepository` and streaming providers.
- Location streaming via `LocationService` (Geolocator) feeding driver updates.
- Theming: Material 3, seeded blue color scheme, polished inputs/buttons/cards + page transitions.
- Placeholder map abstraction (`MapContainer`) to be replaced with `google_maps_flutter` integration.

## Recently Added / Improved

- SHA-1 / SHA-256 Android signing report integrated (fixes INVALID_CERT_HASH for Google Sign-In).
- Firestore error logging scaffolding (uncaught errors) with dev security rule guidance.
- UI polish for Passenger, Driver, Admin pages; disabled debug banner.
- Serialization-ready manual models (`AppUser`, `DriverProfile`, `Ride`).
- Basic model unit tests (add more scenarios over time).

## Setup Steps

1. Install Flutter (>= 3.29.x) and Dart.
2. Enable Firebase for the project:
   ```bash
   flutter pub get
   dart pub global activate flutterfire_cli
   flutterfire configure --project <your-firebase-project-id>
   ```
   This will overwrite `lib/firebase_options.dart` with real config.
3. Add Android/iOS/Web platform configs as prompted.
4. (Android) Add SHA-1 & SHA-256 fingerprints to Firebase Console > Project Settings > Your Apps > Android. Regenerate `google-services.json` and re-run `flutter pub get`.
   - To retrieve fingerprints (already done):
     ```bash
     ./gradlew signingReport
     ```
5. Copy `.env.example` to `.env` and paste your Google Maps API key:

```env
GOOGLE_MAPS_API_KEY=YOUR_REAL_KEY
```

The app will load this at startup; if missing you’ll see a placeholder message where the map should be. 6. Firestore Security Rules (draft/dev example including error logging):

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{uid} {
      allow read, write: if request.auth != null && request.auth.uid == uid;
    }
    match /drivers/{driverId} {
      allow read: if true; // public driver info
      allow write: if request.auth != null && request.auth.uid == driverId;
    }
    match /rides/{rideId} {
      allow create: if request.auth != null; // passenger creates
      allow read: if request.auth != null; // refine later
      allow update: if request.auth != null; // refine with ride ownership
    }
    match /errorLogs/{logId} {
      // Dev rule: allow authenticated create only. Do NOT enable read in prod.
      allow create: if request.auth != null;
      allow read: if false;
    }
  }
}
```

Harden these later (limit ride updates to passenger/assigned driver, admin privileges, etc.).

## Running

```bash
flutter run
```

## Next Planned Work

- Real map integration (google_maps_flutter) + user location selection.
- Driver matching function (Cloud Functions) to assign searching rides.
- Push notifications (FCM) for ride assignment updates.
- Enhanced ride lifecycle (onTrip, completed, cancellation).
- Earnings & analytics dashboards.

## Testing

Model tests live in `test/models/*`. Run:

Run unit tests:

```bash
flutter test
```

## Conventions

- Manual data models (keep simple during bootstrap; introduce code generation later if needed).
- Riverpod for state & dependency injection.
- GoRouter for navigation.

---

This README will evolve as features land. See "Next Planned Work" for roadmap additions.

# yene_taxi

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
