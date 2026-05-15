# Complete Implementation Plan: Flutter Task Manager App

**Project Objective:** Build a clean, secure, and responsive Task Manager using Flutter, Firebase Auth, Cloud Firestore, and a REST API, optimizing for clean code and robust error handling.

## Folder Structure Requirements
All code must strictly adhere to this hierarchy inside the `lib/` directory:
- `lib/main.dart`
- `lib/models/`
- `lib/services/`
- `lib/widgets/`
- `lib/screens/`

---

## Phase 1: Setup & Initialization
- **Firebase Configuration:** Run `flutterfire configure` to generate `firebase_options.dart`. Add `firebase_core`, `firebase_auth`, and `cloud_firestore` to `pubspec.yaml`.
- **Smart Dependencies:** Add `provider` (state management), `http` (REST API), `intl` (date formatting), and `google_fonts` (typography) to `pubspec.yaml`.
- **App Entry Point (lib/main.dart):** Initialize Firebase. Set up the `MultiProvider` for Auth and Task state management. Configure a clean Material 3 theme using `google_fonts`.

## Phase 2: Data Models (lib/models/)
- **task_model.dart:** Create `TaskModel` with fields: `id`, `userId`, `title`, `description`, `date`, `isCompleted`, and `createdAt`. Include `toMap()` and `fromMap()` for Firestore serialization.
- **user_model.dart:** Create `UserModel` with fields: `uid`, `email`, and `createdAt`. Include `toMap()` and `fromMap()`.

## Phase 3: Services Implementation (lib/services/)
- **api_service.dart:** Implement `fetchQuote()` using the `http` package to call `https://api.quotable.io/random`. Handle JSON parsing and throw custom exceptions for network failures.
- **auth_service.dart:** Handle Firebase Auth integration:
    - `signUpWithEmailPassword(email, password)`: Creates Auth user, then creates a matching user document in the `users` Firestore collection.
    - `signInWithEmailPassword(email, password)`
    - `signOut()`
    - Stream getter for `authStateChanges`.
- **firestore_service.dart:** Handle tasks collection CRUD:
    - `addTask(TaskModel task)`
    - `updateTask(TaskModel task)`
    - `deleteTask(String taskId)`
    - **Security & Filtering:** `getTasks(String userId)` must return a `Stream<List<TaskModel>>` explicitly filtered by `.where('userId', isEqualTo: userId)` to ensure users only see their own tasks.

## Phase 4: Reusable Widgets (lib/widgets/)
- **custom_text_field.dart:** A reusable text input component accepting custom controllers and validation logic to keep UI code DRY.
- **task_card.dart:** A styled card to display task details, completion status (checkbox), and trailing action buttons (edit/delete icon buttons).
- **loading_indicator.dart:** A centralized `CircularProgressIndicator` used during API calls and Firebase operations.

## Phase 5: Screens & Routing (lib/screens/)
- **signup_screen.dart & login_screen.dart:** Forms with strict email/password validation. Calls `AuthService` and utilizes the `LoadingIndicator` during async operations.
- **home_screen.dart:**
    - **Top:** Fetches and displays the daily quote via `ApiService` (`FutureBuilder`).
    - **Body:** Listens to `FirestoreService.getTasks()` (`StreamBuilder` or `Consumer`). Displays a list of `TaskCard` widgets.
    - **App Bar:** Includes a Logout button.
    - **FAB:** Navigates to the Add/Edit screen.
- **add_edit_task_screen.dart:** Form to input title, description, and date (using `intl` for formatting). Reused for both adding and editing based on passed arguments.

## Phase 6: Polish, Error Handling & Verification
- **Form Validation:** Verify all forms utilize `GlobalKey<FormState>` to prevent empty or malformed data submissions.
- **Graceful Error Handling:** Implement global `SnackBar` or `AlertDialog` triggers to catch and display readable network/Firebase errors to the user (crucial for the 10 marks in App Performance & Error Handling).
- **UI/UX Polish:** Ensure padding, typography, and responsive behavior meet standard Material Design guidelines across all screens.
