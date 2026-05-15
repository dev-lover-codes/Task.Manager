# Roadmap

## Phases

- [ ] **Phase 1: Foundation & Models** - Project setup, Firebase configuration, and core data structures.
- [ ] **Phase 2: Services & Auth** - Authentication logic and user session management.
- [ ] **Phase 3: Firestore & Tasks** - Real-time task CRUD with user-specific data isolation.
- [ ] **Phase 4: API & UI/UX Polish** - External quote integration and final aesthetic refinements.

## Phase Details

### Phase 1: Foundation & Models
**Goal**: Initialize the technical foundation and define the data schema.
**Depends on**: Nothing
**Requirements**: SETUP-01, SETUP-02, SETUP-03, UI-01
**Success Criteria** (what must be TRUE):
  1. Flutter app builds successfully with Firebase initialization.
  2. The `lib/` directory follows the strict subfolder structure (`models`, `screens`, `services`, `widgets`).
  3. `TaskModel` and `UserModel` classes are implemented with JSON serialization.
**Plans**: TBD
**UI hint**: yes

### Phase 2: Services & Auth
**Goal**: Secure the application with user authentication.
**Depends on**: Phase 1
**Requirements**: AUTH-01, AUTH-02, AUTH-03, AUTH-04, AUTH-05
**Success Criteria** (what must be TRUE):
  1. User can successfully sign up and log in using Email/Password.
  2. The application automatically navigates to the Home screen if a user is already logged in.
  3. Input validation prevents submission of invalid emails or weak passwords.
**Plans**: TBD
**UI hint**: yes

### Phase 3: Firestore & Tasks
**Goal**: Implement the core task management functionality.
**Depends on**: Phase 2
**Requirements**: TASK-01, TASK-02, TASK-03, TASK-04, TASK-05, TASK-06
**Success Criteria** (what must be TRUE):
  1. User can add a task and see it appear in their list immediately.
  2. Editing or deleting a task updates the UI in real-time without manual refresh.
  3. Logged-in users cannot see or modify tasks belonging to other users.
**Plans**: TBD
**UI hint**: yes

### Phase 4: API & UI/UX Polish
**Goal**: Enhance the user experience with external data and modern styling.
**Depends on**: Phase 3
**Requirements**: QUOTE-01, QUOTE-02, QUOTE-03, UI-02, UI-03, UI-04
**Success Criteria** (what must be TRUE):
  1. A random motivational quote is displayed on the dashboard upon loading.
  2. The app handles Quotable API failures by falling back to ZenQuotes gracefully.
  3. The UI is responsive across mobile and web with a consistent Material 3 minimalist look.
**Plans**: TBD
**UI hint**: yes

## Progress Table

| Phase | Plans Complete | Status | Completed |
|-------|----------------|--------|-----------|
| 1. Foundation & Models | 0/1 | Not started | - |
| 2. Services & Auth | 0/1 | Not started | - |
| 3. Firestore & Tasks | 0/1 | Not started | - |
| 4. API & UI/UX Polish | 0/1 | Not started | - |
