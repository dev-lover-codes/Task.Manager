# Project Blueprint - Task Management App

## Overview
A comprehensive Task Management application built with Flutter and Firebase, featuring real-time synchronization, secure authentication, and a modern Material 3 design.

## Features Implemented
- **Design System:** Material 3 with `ColorScheme.fromSeed` (Deep Purple).
- **Typography:** Google Fonts (Oswald, Roboto, Open Sans).
- **Authentication:**
    - Email/Password Sign Up & Login.
    - **Google Sign-In:** Integrated using the latest `google_sign_in` (v7+) API with modern OAuth flow.
    - Firestore-backed user profiles with automatic creation for new users.
- **Visual Identity:**
    - **App Logo:** A modern, stylized checkmark icon with "TaskFlow" branding.
    - **Splash Screen:** A dedicated loading screen that appears during initial app startup and authentication checks.
- **Task Management:**
    - Create, Read, Update, Delete (CRUD) tasks.
    - Task Status (Pending/Completed).
    - Task Priority and Categories.
- **State Management:** Provider package.
- **Persistence:** Cloud Firestore.

## Goal: Add Google Sign-In (Completed)
Successfully integrated Google Sign-In using `google_sign_in` version 7.2.0.

### Actions Taken
1.  **Dependency Added:** `google_sign_in: ^7.2.0` added to `pubspec.yaml`.
2.  **Plugin Initialization:** `GoogleSignIn.instance.initialize()` added to `main.dart`.
3.  **Auth Service Update:**
    - Switched to the new singleton pattern (`GoogleSignIn.instance`).
    - Implemented `authenticate()` and `authorizeScopes()` for identity and authorization separation.
    - Handled Firestore user document checks/creation.
4.  **UI Implementation:**
    - Added a modern Google Sign-in button with "OR" divider to `LoginScreen`.
    - Implemented single-scroll view and loading indicators for better UX.
5.  **Verification:** Passed `flutter analyze` with no issues.
