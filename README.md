# Task Manager - Flutter Application

A modern, highly responsive, and robust Task Manager built with **Flutter**, designed to help you stay organized and manage your daily priorities effectively. The application uses **Firebase** for backend services including Authentication and Cloud Firestore, providing a secure, real-time experience across multiple devices.

## 🚀 Features

*   **Secure Authentication:** Supports seamless Email/Password sign-up and Google Sign-In.
*   **Real-time Database:** Utilizes Cloud Firestore for real-time syncing of your tasks.
*   **Complete CRUD Operations:** Create, Read, Update, and Delete your tasks instantly.
*   **Intuitive UI/UX:** Built with Material 3 design guidelines for a clean, modern aesthetic.
*   **Dark Mode Support:** Perfectly handles system-level Dark and Light mode transitions with adaptive colors.
*   **Daily Inspiration:** Fetches motivational quotes to keep you inspired while managing your tasks.

## 🛠️ Technology Stack

*   **Frontend:** Flutter (Dart)
*   **Backend as a Service (BaaS):** Firebase (Auth, Cloud Firestore)
*   **State Management:** Provider
*   **Architecture:** Feature-first modular approach
*   **Design System:** Material Design 3

## ⚙️ Getting Started

### Prerequisites
*   [Flutter SDK](https://flutter.dev/docs/get-started/install) (v3.19+)
*   [Dart SDK](https://dart.dev/get-dart)
*   An Android or iOS Emulator/Device for testing

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/dev-lover-codes/Task.Manager.git
   cd Task.Manager
   ```

2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Firebase Configuration:**
   The project is already initialized with Firebase via `firebase_options.dart` and `google-services.json`. 
   *(Note: Ensure your local `debug.keystore` SHA-1 is added to the Firebase console if you are rebuilding the app locally for Google Sign-In).*

4. **Run the Application:**
   ```bash
   flutter run
   ```

## 📦 Building for Production

To build a release APK for Android:

```bash
flutter build apk --release
```

The APK will be generated at `build/app/outputs/flutter-apk/app-release.apk`.

## 🔒 Security
*   **Firestore Rules:** Configured to strictly isolate user data, ensuring that you can only read, write, or modify your own tasks.
*   **Secure Sign-In:** Utilizes OAuth 2.0 and Firebase's secure credential management for Google Sign-In.

## 🤝 Contributing
Contributions, issues, and feature requests are welcome! Feel free to check the issues page.
