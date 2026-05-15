# Technology Stack

**Project:** Task Management App
**Researched:** 2025-01-24

## Recommended Stack

### Core Framework
| Technology | Version | Purpose | Why |
|------------|---------|---------|-----|
| Flutter | ^3.9.0 | Cross-platform UI | High performance, excellent Material 3 support, and fast iteration. |

### Database & Auth
| Technology | Version | Purpose | Why |
|------------|---------|---------|-----|
| Firebase Auth | ^6.5.1 | User Authentication | Seamless integration with Flutter, handles session persistence automatically. |
| Cloud Firestore | ^6.4.1 | NoSQL Database | Real-time sync, offline support, and flexible document structure for tasks. |

### State Management
| Technology | Version | Purpose | Why |
|------------|---------|---------|-----|
| Provider | ^6.1.5 | State Management | Simple, widely used, and already integrated into the project. |

### External APIs
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| http | ^1.6.0 | Networking | Fetching random quotes from external REST APIs. |
| ZenQuotes API | N/A | Quotes Source | Recommended replacement for the unreliable Quotable API. |

### Supporting Libraries
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| google_fonts | ^8.1.0 | Typography | implementing minimalist design with premium fonts like Inter or Roboto. |
| intl | ^0.20.2 | Formatting | Date formatting for task deadlines. |
| uuid | ^4.5.3 | ID Generation | Generating unique local IDs if needed before Firestore sync. |

## Alternatives Considered

| Category | Recommended | Alternative | Why Not |
|----------|-------------|-------------|---------|
| Quotes API | ZenQuotes | Quotable | Quotable currently suffers from persistent SSL/DNS issues. |
| State Management | Provider | Riverpod | Provider is already in the project; switching adds unnecessary migration overhead for this scale. |

## Installation

```bash
# Core Dependencies
flutter pub add firebase_core firebase_auth cloud_firestore provider http google_fonts intl uuid
```

## Sources
- [Firebase Documentation](https://firebase.google.com/docs/flutter/setup)
- [ZenQuotes API Documentation](https://zenquotes.io/api/)
- [Flutter Package Repository (pub.dev)](https://pub.dev)
