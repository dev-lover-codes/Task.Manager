# Codebase Concerns

**Analysis Date:** 2025-02-12

## Tech Debt

**Manual JSON Serialization:**
- Issue: `TaskModel` and `UserModel` use manual `toMap` and `fromMap` methods, which is error-prone and adds boilerplate.
- Files: `lib/models/task_model.dart`, `lib/models/user_model.dart`
- Impact: Increased maintenance effort and higher risk of bugs when models evolve.
- Fix approach: Implement `json_serializable` or `freezed` for automated serialization.

**Service Coupling:**
- Issue: `AuthService` directly interacts with `FirebaseFirestore` to create user documents during sign-up.
- Files: `lib/services/auth_service.dart`
- Impact: Violates separation of concerns; difficult to test in isolation.
- Fix approach: Move user document creation to a dedicated `UserRepository` or `FirestoreService`.

**Placeholder UI:**
- Issue: `HomeScreen` is largely a placeholder with unimplemented buttons and static text.
- Files: `lib/screens/home_screen.dart`
- Impact: Application lacks core functionality for end-users.
- Fix approach: Implement task listing, creation, and profile management UI.

## Known Bugs

**Unresponsive UI Elements:**
- Symptoms: Logout button and Floating Action Button (FAB) on the Home Screen do nothing when pressed.
- Files: `lib/screens/home_screen.dart`
- Trigger: Pressing the logout icon or the add task button.
- Workaround: None.

## Security Considerations

**Missing Authentication Guard:**
- Risk: `HomeScreen` is set as the initial route without checking if a user is authenticated.
- Files: `lib/main.dart`, `lib/screens/home_screen.dart`
- Current mitigation: None in the UI layer.
- Recommendations: Implement an `AuthWrapper` or use `GoRouter` redirects to handle authentication state changes and protect routes.

**Input Validation:**
- Risk: `AuthService` methods take raw strings without client-side validation for email format or password strength.
- Files: `lib/services/auth_service.dart`
- Current mitigation: Relying on Firebase Auth exceptions.
- Recommendations: Add client-side validation before calling Firebase services.

## Performance Bottlenecks

**Lack of Pagination:**
- Problem: `getTasks` fetches all tasks for a user in a single stream.
- Files: `lib/services/firestore_service.dart`
- Cause: Simple `snapshots()` call without limits or startAfter.
- Improvement path: Implement pagination or infinite scrolling for task lists.

**Network Resilience:**
- Problem: `ApiService` lacks timeouts and retry logic for external API calls.
- Files: `lib/services/api_service.dart`
- Cause: Basic `http.get` usage.
- Improvement path: Wrap network calls with timeouts and implement a retry mechanism (e.g., using the `retry` package).

## Missing Critical Features

**Authentication UI:**
- Problem: There are no screens for users to sign in or sign up, despite the service layer existing.
- Blocks: New users cannot join and existing users cannot log in.

**Task Management UI:**
- Problem: No UI for adding, editing, or deleting tasks.
- Blocks: Primary app functionality (Task Management) is inaccessible.

## Test Coverage Gaps

**Untested Logic:**
- What's not tested: Business logic in services and data integrity in models.
- Files: `lib/services/auth_service.dart`, `lib/services/firestore_service.dart`, `lib/services/api_service.dart`, `lib/models/task_model.dart`
- Risk: Regressions in core functionality can go unnoticed.
- Priority: High

---

*Concerns audit: 2025-02-12*
