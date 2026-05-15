# Architecture Patterns

**Domain:** Task Management
**Researched:** 2025-01-24

## Recommended Architecture

The project follows a **Layered Architecture** with **Provider** for state management and **Repository Pattern** for data access.

### Component Boundaries

| Component | Responsibility | Communicates With |
|-----------|---------------|-------------------|
| UI (Widgets/Screens) | Presentation and user interaction. | Providers |
| Providers | Business logic and state management. | Services/Repositories |
| Repositories | Data abstraction and API calls. | Firebase SDK, External APIs |
| Models | Data structure definitions. | Everywhere |

### Data Flow

1. **User Action**: User taps "Add Task".
2. **UI Update**: Widget calls `taskProvider.addTask(newTask)`.
3. **Business Logic**: Provider updates local state and calls `taskRepository.createTask(newTask)`.
4. **Data Sync**: Repository sends request to Cloud Firestore.
5. **Reactive Update**: Firestore snapshot triggers a listener in the Provider, which updates the UI automatically.

## Patterns to Follow

### Pattern 1: AuthGate (Reactive Authentication)
**What:** A widget that listens to the `authStateChanges` stream and returns either a `HomeScreen` or `LoginScreen`.
**When:** App initialization and anytime the auth state changes (login/logout/token expiration).
**Example:**
```dart
class AuthGate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) return const HomeScreen();
        return const LoginScreen();
      },
    );
  }
}
```

### Pattern 2: Repository Pattern
**What:** Abstracting Firestore and Auth interactions into Service classes.
**Why:** Improves testability (can mock repositories) and keeps business logic clean.

## Anti-Patterns to Avoid

### Anti-Pattern 1: Direct SDK Calls in Widgets
**What:** Calling `FirebaseFirestore.instance.collection('tasks').add(...)` inside a `build` method or `onPressed` handler.
**Why bad:** Makes code hard to test, duplicates logic, and mixes UI with infrastructure.
**Instead:** Use a `TaskRepository` or `TaskProvider`.

### Anti-Pattern 2: Global State Bloat
**What:** Putting every single variable (like `isTextFieldEnabled`) into a global Provider.
**Why bad:** Causes unnecessary rebuilds of the entire app.
**Instead:** Use local `StatefulWidget` state for pure UI-only toggles.

## Scalability Considerations

| Concern | At 100 users | At 10K users | At 1M users |
|---------|--------------|--------------|-------------|
| Firestore Reads | Direct fetches | Pagination (limit/startAfter) | Advanced Caching & Sharding |
| Image Storage | Direct upload | Image compression | Dedicated CDN |
| Authentication | Email/Password | Social Auth (Google/Apple) | Enterprise SSO |

## Sources
- [Flutter Architectural Patterns](https://docs.flutter.dev/perf/rendering/best-practices)
- [Clean Architecture in Flutter](https://blog.cleancoder.com/)
