# External Integrations

**Analysis Date:** 2025-03-04

## APIs & External Services

**Firebase:**
- Firebase Core - Main entry point for Firebase services
  - SDK/Client: `firebase_core`
- Firebase Auth - User authentication and identity
  - SDK/Client: `firebase_auth`
- Cloud Firestore - NoSQL document database
  - SDK/Client: `cloud_firestore`

**Typography:**
- Google Fonts - Custom fonts loading
  - SDK/Client: `google_fonts`

## Data Storage

**Databases:**
- Cloud Firestore
  - Connection: Configured via `lib/firebase_options.dart`
  - Client: `FirebaseFirestore.instance` in `lib/services/firestore_service.dart`

**File Storage:**
- Firebase Storage (Note: `storageBucket` is defined in `lib/firebase_options.dart` but SDK is not yet in `pubspec.yaml`)

**Caching:**
- Firestore Offline Persistence (Default behavior of Firebase SDK)

## Authentication & Identity

**Auth Provider:**
- Firebase Authentication
  - Implementation: `AuthService` in `lib/services/auth_service.dart` using `FirebaseAuth.instance`

## Monitoring & Observability

**Error Tracking:**
- Not detected (e.g., Crashlytics not yet integrated)

**Logs:**
- `dart:developer` - Not explicitly used in snippet but available
- `flutter run` console output

## CI/CD & Deployment

**Hosting:**
- Firebase Hosting (Implied by `firebase.json`)

**CI Pipeline:**
- Not detected

## Environment Configuration

**Required env vars:**
- None (Configuration is baked into `lib/firebase_options.dart`)

**Secrets location:**
- `lib/firebase_options.dart` (Contains API keys for Firebase)
- `android/app/google-services.json` (Firebase configuration for Android)

## Webhooks & Callbacks

**Incoming:**
- None

**Outgoing:**
- None

---

*Integration audit: 2025-03-04*
