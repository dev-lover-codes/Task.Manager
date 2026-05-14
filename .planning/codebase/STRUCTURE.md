# Codebase Structure

**Analysis Date:** 2025-02-13

## Directory Layout

```
[project-root]/
├── android/            # Android-specific configuration and code
├── build/              # Generated build artifacts (ignored by git)
├── lib/                # Main Flutter source code
│   ├── models/         # Data entities and serialization logic
│   ├── screens/        # UI Page widgets
│   ├── services/       # Business logic and external service integrations
│   ├── widgets/        # Reusable UI components
│   ├── main.dart       # Application entry point
│   └── firebase_options.dart # Firebase configuration for different platforms
├── test/               # Unit and widget tests
├── web/                # Web-specific assets and configuration
├── pubspec.yaml        # Project dependencies and configuration
└── analysis_options.yaml # Linting and static analysis rules
```

## Directory Purposes

**lib/models/:**
- Purpose: Contains plain Dart classes that represent the data models used in the application.
- Contains: Classes with `fromMap` and `toMap` methods for serialization.
- Key files: `task_model.dart`, `user_model.dart`

**lib/screens/:**
- Purpose: Contains full-screen widgets that represent different pages of the application.
- Contains: Flutter Widgets that often listen to providers.
- Key files: `home_screen.dart`

**lib/services/:**
- Purpose: Contains service classes that handle business logic, authentication, and database interactions.
- Contains: `ChangeNotifier` classes that interface with Firebase.
- Key files: `auth_service.dart`, `firestore_service.dart`, `api_service.dart`

**lib/widgets/:**
- Purpose: Contains reusable UI components that are used across multiple screens.
- Contains: Stateless or Stateful widgets.
- Key files: (Currently empty)

**test/:**
- Purpose: Contains automated tests for the application.
- Contains: Widget tests and unit tests.
- Key files: `widget_test.dart`

## Key File Locations

**Entry Points:**
- `lib/main.dart`: Initializes Firebase and sets up the root `MultiProvider` and `MaterialApp`.

**Configuration:**
- `pubspec.yaml`: Manages Flutter dependencies, assets, and versioning.
- `lib/firebase_options.dart`: Auto-generated configuration for Firebase services.
- `firebase.json`: Configuration for Firebase CLI/Hosting.

**Core Logic:**
- `lib/services/auth_service.dart`: Handles all authentication-related logic.
- `lib/services/firestore_service.dart`: Handles Firestore CRUD operations for tasks.

## Naming Conventions

**Files:**
- Lowercase with underscores (snake_case): `home_screen.dart`, `task_model.dart`.

**Directories:**
- Lowercase with underscores (snake_case): `models`, `services`.

## Where to Add New Code

**New Feature:**
- Primary code: Add a new screen in `lib/screens/` and any necessary logic in a new or existing service in `lib/services/`.
- Tests: Add a corresponding test file in `test/`.

**New Component/Module:**
- Implementation: Add to `lib/widgets/` if it's a reusable UI piece, or `lib/models/` if it's a new data entity.

**Utilities:**
- Shared helpers: Create a `lib/utils/` directory for pure functions or helper classes.

## Special Directories

**android/ / web/:**
- Purpose: Platform-specific project files and assets.
- Generated: Initialized by Flutter, but manually modified for platform-specific settings.
- Committed: Yes.

**.dart_tool/:**
- Purpose: Tooling-specific files.
- Generated: Yes.
- Committed: No.

---

*Structure analysis: 2025-02-13*
