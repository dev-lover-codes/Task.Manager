# Task Management App Research

This document covers best practices and technical considerations for building a minimalist task management app using Flutter and Firebase.

## 1. Email/Password Authentication & State Management

### Best Practices for Auth Flows
- **Repository Pattern**: Abstract Firebase Auth calls into a dedicated `AuthService` or `AuthRepository`. Never call `FirebaseAuth.instance` directly in UI widgets.
- **Reactive Navigation (AuthGate)**: Use a stream-based approach to listen to `authStateChanges()`.
  - Create an `AuthGate` widget as the root of your app.
  - If the user is null, show the `LoginScreen`.
  - If the user is logged in, show the `HomeScreen`.
- **Loading States**: Provide visual feedback during authentication (e.g., `CircularProgressIndicator` on buttons) to prevent double submissions.
- **Error Mapping**: Firebase returns technical error codes (e.g., `user-not-found`). Map these to user-friendly messages like "No account found with this email" before displaying them in a SnackBar or Dialog.

### State Management with Provider
- **StreamProvider**: Ideal for listening to the Auth state.
- **ChangeNotifier**: Use for managing local UI state, such as form validation or loading flags.
- **Dependency Injection**: Use `Provider` to make your `AuthRepository` and `FirestoreService` available throughout the widget tree.

---

## 2. Firestore Security Rules for Task Isolation

To ensure users can only see and manage their own tasks, implement the following security rules pattern:

```javascript
service cloud.firestore {
  match /databases/{database}/documents {
    
    // Helper: Is the user authenticated?
    function isSignedIn() {
      return request.auth != null;
    }

    // Helper: Does the user own the document?
    function isOwner(userId) {
      return request.auth.uid == userId;
    }

    // Task collection rules
    match /tasks/{taskId} {
      // Allow read/write only if the user owns the task
      // This assumes the task document has a field 'userId'
      allow read, update, delete: if isSignedIn() && isOwner(resource.data.userId);
      
      // When creating, ensure the new document's userId matches the sender's UID
      allow create: if isSignedIn() && isOwner(request.resource.data.userId);
    }
  }
}
```

**Crucial Note**: Security rules are **not filters**. Your Flutter code must still use `.where('userId', '==', currentUser.uid)` when querying tasks.

---

## 3. Quotable API Usage & Alternatives

### Status of Quotable API (api.quotable.io)
- **Warning**: The `api.quotable.io` service has experienced significant downtime and SSL certificate issues in late 2024 and early 2025. It is currently **unreliable** for production use.

### Recommended Alternative: ZenQuotes
- **Endpoint**: `https://zenquotes.io/api/random`
- **Why**: High reliability, no API key required for basic usage, and returns a simple JSON structure compatible with `http` package.

### Error Handling for APIs
- **Timeout**: Always set a timeout (e.g., 5-10 seconds) on network requests.
- **Try-Catch**: Wrap requests in try-catch blocks to handle `SocketException` (no internet) or `HttpException`.
- **Fallback Content**: Always have a hardcoded "Quote of the Day" fallback in case the API is unreachable.

---

## 4. Minimalist UI Design Trends (2024-2025)

### Key Trends for Task Apps
- **Typography-First Hierarchy**: Use bold, high-quality fonts (e.g., Inter, Montserrat) and varied weights to create hierarchy instead of heavy borders or lines.
- **Bento Grid Layouts**: Grouping related information into soft-cornered cells (rounded rectangles) to make the UI feel organized and modern.
- **Adaptive Minimalism**: Keeping the interface empty of buttons by using gestures (swipe right to complete, swipe left to delete) and revealing complex options only when a task is tapped.
- **Micro-Interactions**: Subtle animations when checking off a task (e.g., a slight haptic buzz or a delicate strike-through animation) to provide a premium feel.
- **"Magic Plus" Interaction**: A floating action button that can be dragged into specific categories to create a task directly in place.

### Design Principles
1. **White Space**: Don't be afraid of "empty" space; it reduces cognitive load.
2. **Focus**: Only show what the user needs for their *current* task.
3. **Softness**: Use soft shadows and subtle blurs (frosted glass) instead of harsh dividers.
