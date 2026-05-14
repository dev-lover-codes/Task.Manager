# Architecture

**Analysis Date:** 2025-02-13

## System Overview

```text
┌─────────────────────────────────────────────────────────────┐
│                        UI Layer                             │
│       (Screens & Widgets) `lib/screens`, `lib/widgets`      │
├─────────────────────────────────────────────────────────────┤
│                           │                                 │
│             Calls         ▼         Notifies                │
│                           │                                 │
├─────────────────────────────────────────────────────────────┤
│                      Service Layer                          │
│         (ChangeNotifiers) `lib/services`                    │
├─────────────────────────────────────────────────────────────┤
│                           │                                 │
│            Updates        ▼         Streams                 │
│                           │                                 │
├─────────────────────────────────────────────────────────────┤
│                     External Services                       │
│           (Firebase Auth, Firestore)                        │
└─────────────────────────────────────────────────────────────┘
```

## Component Responsibilities

| Component | Responsibility | File |
|-----------|----------------|------|
| Models | Plain Dart classes representing data entities (User, Task). | `lib/models/` |
| Services | Logic for interacting with Firebase and external APIs. Implemented as `ChangeNotifier`. | `lib/services/` |
| Screens | Top-level UI components (pages) for the application. | `lib/screens/` |
| Widgets | Reusable UI components. | `lib/widgets/` |
| Entry Point | Application initialization and Provider setup. | `lib/main.dart` |

## Pattern Overview

**Overall:** Service-based architecture with Provider for state management.

**Key Characteristics:**
- **Separation of Concerns:** UI is decoupled from business logic via Services.
- **Reactive UI:** Uses `Provider` and `StreamBuilder` to react to data changes.
- **Centralized Data Access:** Firebase interactions are encapsulated within specific service classes.

## Layers

**UI Layer:**
- Purpose: Rendering the user interface and handling user input.
- Location: `lib/screens/`, `lib/widgets/`
- Contains: Flutter Widgets, Stateless and Stateful.
- Depends on: `lib/services/`, `lib/models/`
- Used by: Flutter Framework

**Service Layer:**
- Purpose: Encapsulates business logic and external service integrations.
- Location: `lib/services/`
- Contains: `ChangeNotifier` classes.
- Depends on: `lib/models/`, `package:firebase_auth`, `package:cloud_firestore`
- Used by: UI Layer

**Data Model Layer:**
- Purpose: Defines the data structures used throughout the app.
- Location: `lib/models/`
- Contains: Data classes with serialization logic (`toMap`, `fromMap`).
- Depends on: `package:cloud_firestore` (for `Timestamp`)
- Used by: Service Layer, UI Layer

## Data Flow

### Primary Request Path (Auth/Write)

1. **User Action:** User clicks a button in `lib/screens/home_screen.dart`.
2. **Service Call:** UI calls a method in `lib/services/auth_service.dart` or `lib/services/firestore_service.dart`.
3. **External Update:** Service interacts with Firebase SDK.
4. **Notification:** Service calls `notifyListeners()` (if state changed) or updates a Firestore collection.
5. **UI Rebuild:** `Consumer` or `Provider.of` triggers a rebuild in the UI.

### Real-time Data Path (Read)

1. **Stream Setup:** UI uses a `StreamBuilder` to listen to a stream provided by `lib/services/firestore_service.dart`.
2. **Firestore Update:** External data changes in Firestore.
3. **Stream Emit:** Firebase SDK emits a new snapshot.
4. **Mapping:** Service maps the snapshot to Model objects (`lib/models/task_model.dart`).
5. **UI Update:** `StreamBuilder` rebuilds with the new data.

**State Management:**
- Handled via the `provider` package.
- Services are registered as `ChangeNotifierProvider` in `lib/main.dart` using `MultiProvider`.

## Key Abstractions

**ChangeNotifier Services:**
- Purpose: Provides a way for the UI to interact with backend services while maintaining a reactive state.
- Examples: `lib/services/auth_service.dart`, `lib/services/firestore_service.dart`.
- Pattern: Observer pattern (via `notifyListeners`).

## Entry Points

**main():**
- Location: `lib/main.dart`
- Triggers: App startup.
- Responsibilities: Initializes Firebase, wraps the `MaterialApp` in `MultiProvider`, and sets up the root theme.

## Architectural Constraints

- **Singletons:** Firebase instances (`FirebaseAuth.instance`, `FirebaseFirestore.instance`) are used directly within services.
- **Provider Scope:** Services are provided at the root level, making them globally accessible.

## Error Handling

**Strategy:** Services catch exceptions from Firebase SDKs and throw descriptive errors to the UI.

**Patterns:**
- Try-catch blocks in service methods.
- Mapping SDK-specific errors to user-friendly messages in `lib/services/auth_service.dart`.

---

*Architecture analysis: 2025-02-13*
