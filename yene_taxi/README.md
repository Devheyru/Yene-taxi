# Yene-Taxi (Early Scaffold)

This is an in-progress multi-role taxi platform (Passenger, Driver, Admin) built with Flutter + Firebase.

## Current Features

- Auth (email & Google) stubbed – requires real Firebase config.
- Role-based routing (`RoleGate`).
- Passenger ride request creates Firestore `rides` document.
- Driver page toggles online status and shows live location (Geolocator).
- Admin dashboard lists and approves pending drivers.
- Repositories: `UserRepository`, `DriverRepository`, `RideRepository`.
- Location streaming via `LocationService`.
- Placeholder map abstraction (`MapContainer`).

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
4. Firestore Security Rules (draft):
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

Run unit tests:

```bash
flutter test
```

## Conventions

- Manual data models (keep simple during bootstrap; introduce code generation later if needed).
- Riverpod for state & dependency injection.
- GoRouter for navigation.

---

This README will evolve as features land.

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
