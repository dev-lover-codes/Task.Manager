<!-- generated-by: gsd-doc-writer -->
# Task Manager App (Internship Project)

## Vision
A clean, modern, and high-performance task management application for Android and iOS using Flutter and Firebase. It features user authentication, real-time Firestore synchronization, and integration with a REST API for daily motivation.

## Tech Stack
- **Framework:** [Flutter](https://flutter.dev/)
- **Language:** [Dart](https://dart.dev/)
- **Authentication:** [Firebase Auth](https://firebase.google.com/docs/auth) (Email/Password)
- **Database:** [Cloud Firestore](https://firebase.google.com/docs/firestore)
- **API Communication:** [http](https://pub.dev/packages/http) package for REST API integration

## Visual Aesthetic
- **Modern/Minimalist:** Clean lines, ample whitespace, and a focused user experience.
- **Material 3:** Leveraging Flutter's Material 3 support for modern UI components.

## Folder Structure
Strict adherence to the following organization:
- `lib/models/`: Data models (e.g., `task_model.dart`, `user_model.dart`).
- `lib/screens/`: Main UI screens (e.g., `home_screen.dart`, `login_screen.dart`, `signup_screen.dart`, `add_edit_task_screen.dart`).
- `lib/services/`: Business logic and external service integrations (`auth_service.dart`, `firestore_service.dart`, `api_service.dart`).
- `lib/widgets/`: Reusable UI components (`custom_text_field.dart`, `loading_indicator.dart`, `task_card.dart`).

## Evaluation Criteria
- **UI/Navigation:** Smooth transitions and intuitive interface.
- **Firebase Auth:** Secure login and signup flows using Email/Password.
- **Firestore CRUD:** Efficient Create, Read, Update, and Delete operations for task management.
- **REST API:** Successful integration of the Quotable API for daily motivation.
- **Clean Code:** Maintainable, well-documented, and properly structured codebase following Flutter best practices.
- **Performance/Error Handling:** Robust error management (e.g., network failures, auth errors) and responsive UI performance.
