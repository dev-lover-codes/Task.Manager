# Coding Conventions

**Analysis Date:** 2025-02-12

## Naming Patterns

**Files:**
- `snake_case.dart` for all Dart files (e.g., `task_model.dart`, `home_screen.dart`).

**Functions:**
- `lowerCamelCase` for all functions and methods (e.g., `signUpWithEmailPassword`, `fetchQuote`).

**Variables:**
- `lowerCamelCase` for local variables and properties (e.g., `currentUser`, `authStateChanges`).
- Private variables are prefixed with an underscore: `_baseUrl`, `_auth`.

**Types:**
- `UpperCamelCase` for classes and mixins (e.g., `TaskModel`, `AuthService`, `ApiException`).

## Code Style

**Formatting:**
- Dart standard formatter (`dart format`).
- Trailing commas are used in multi-line parameter lists and widget trees to guide formatting.

**Linting:**
- `package:flutter_lints/flutter.yaml` is used as the base configuration.
- Configured in `analysis_options.yaml`.

## Import Organization

**Order:**
1. Core Flutter/Dart imports (e.g., `package:flutter/material.dart`).
2. Third-party package imports (e.g., `package:firebase_auth/firebase_auth.dart`).
3. Project-relative imports (e.g., `../models/user_model.dart`).

**Path Aliases:**
- None detected; standard relative paths are used.

## Error Handling

**Patterns:**
- `try-catch` blocks are used in services to catch exceptions.
- Custom exceptions (e.g., `ApiException`) are defined and thrown for specific failure cases.
- `on FirebaseAuthException` is used to catch and handle specific Firebase authentication errors with helper methods like `_handleAuthException`.

## Logging

**Framework:** `console` via `print` or `debugPrint` (though `print` should generally be avoided in favor of `debugPrint` or dedicated loggers per `flutter_lints`).

**Patterns:**
- Errors are often caught and rethrown as `Exception` with descriptive messages.

## Comments

**When to Comment:**
- Section headers (e.g., `// Sign Up`, `// Sign In`).
- Explanatory comments for complex logic (e.g., `// Create matching user document in Firestore`).

**JSDoc/TSDoc:**
- Triple-slash `///` documentation comments are not widely used in the explored files but are the Dart standard.

## Function Design

**Size:**
- Generally small and focused on a single responsibility.

**Parameters:**
- Uses a mix of positional (for required, simple values) and named parameters (especially for models and widget constructors).

**Return Values:**
- `Future<T>` for asynchronous operations.
- `Stream<T>` for real-time updates.

## Module Design

**Exports:**
- Standard Dart imports.

**Barrel Files:**
- Not detected in the current structure.

---

*Convention analysis: 2025-02-12*
