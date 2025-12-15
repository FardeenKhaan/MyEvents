# MyEvents – Flutter Event Management App

## 📱 Overview

MyEvents is a **production-grade, cross-platform Flutter application** that allows users to discover, view, register for, and manage events. The app is built as part of a Flutter Developer technical assignment and follows **clean architecture**, robust validation, offline-first principles, and scalable state management.

The application demonstrates real-world Flutter development practices including authentication, REST API integration, caching, error handling, responsive UI, and CI-ready project structure.

---

## ✨ Features

### 🔹 Splash & App Bootstrap

* Animated splash screen
* Auto-login using secure token storage
* Skeleton UI while app initializes

### 🔹 Authentication

* Login & Signup with email/password
* Remember Me (persistent session)
* Secure token storage using `flutter_secure_storage`
* Logout flow
* (Optional) Social login support

### 🔹 Events

* Paginated event list with infinite scroll
* Pull-to-refresh support
* Event cards include:

  * Title
  * Short description
  * Date & time
  * City
  * Thumbnail image
  * Attendee count
  * Favourite (bookmark) toggle

### 🔹 Event Details

* Large cover image
* Full description (HTML supported)
* Organizer info with contact action
* Event location (latitude & longitude)
* Attendee list
* Register for event (POST request)

### 🔹 Create & Edit Events

* Available for authorized users
* Fully validated form
* Multiple image upload (camera/gallery)
* Client-side validation before upload

### 🔹 Offline Support

* Cached event list & event details
* Read-only access while offline
* Offline banner indicator

### 🔹 Loading & Error Handling

* Global and route-level loading indicators
* Skeleton loaders using shimmer
* Graceful error states with retry

---

## 📐 Responsiveness & UI Rules

* No fixed pixel values used
* All dimensions based on `MediaQuery`
* Example sizing:

  ```dart
  final h = MediaQuery.of(context).size.height;
  final w = MediaQuery.of(context).size.width;
  SizedBox(height: h * 0.02);
  ```
* Adaptive layouts for tablets & landscape mode

---

## 🧠 State Management

**Chosen Solution:** (e.g. GetX / Provider / Riverpod)

**Justification:**

> The selected state management approach provides a clean separation between UI and business logic, supports reactive updates, simplifies dependency injection, and scales well for global app state such as authentication, events list, and upload progress.

### Managed States

* Global authentication state
* Events list & pagination state
* Event detail state
* Image upload progress state
* Ephemeral UI state vs persisted app state

---

## 🏗️ Architecture

The project follows **Clean Architecture** principles:

```
lib/
 ├── core/        # constants, utils, error handling
 ├── data/        # API services, DTOs, repositories impl
 ├── domain/      # entities, repositories, use cases
 ├── presentation/# UI, controllers/viewmodels
 └── main.dart
```

* Repository pattern for data access
* Networking abstraction using Dio / http
* Interceptors for logging & error handling

---

## 🌐 API Integration

### Auth (ReqRes)

Base URL: `https://reqres.in/api`

* POST `/login`
* POST `/register`
* GET `/users`

### Events (MockAPI / Mocki)

* GET `/events?page=&limit=`
* GET `/events/{id}`
* POST `/events`
* PUT `/events/{id}`
* DELETE `/events/{id}`
* POST `/events/{id}/register`
* POST `/upload`
* POST `/check-email`

---

## ✅ Validation Rules

* Email: RFC format + async uniqueness check
* Password: Min 8 chars, uppercase, lowercase, number & special char
* Event title: 5–100 chars
* Description: Min 20 chars
* Date/time: Must be future
* Location: Required
* Lat/Long: Valid ranges
* Images: Max 5, JPG/PNG, ≤5MB
* Phone: Valid international format (optional)

---

## 🔐 Security

* Tokens stored securely using `flutter_secure_storage`
* No sensitive data logged
* Environment variables via `.env`

---

## ⚡ Performance

* `ListView.builder` / `SliverList`
* `cached_network_image`
* Pagination & lazy loading
* Memory & network profiling notes included

---

## 📊 Logging & Analytics (Mock)

* Logging abstraction layer
* Mock analytics events:

  * login
  * event_view
  * register_event

---

## 🧪 Testing & CI

* Unit tests for business logic
* Widget tests for critical UI flows
* CI workflow included (GitHub Actions)

Run tests:

```bash
flutter test
```

---

## 🚀 Build & Run

### Prerequisites

* Flutter SDK (stable)
* Dart SDK

### Steps

```bash
git clone <repo-url>
cd myevents
flutter pub get
flutter run
```

### Build APK

```bash
flutter build apk --release
```

---

## 📦 Packages Used

* dio / http
* flutter_secure_storage
* cached_network_image
* shimmer
* connectivity_plus
* image_picker
* intl
* state management package (declared above)

---

## 🤖 AI & Tools Disclosure

AI tools were used **only for guidance, boilerplate suggestions, and documentation assistance**. All business logic, architecture decisions, and implementation were reviewed and validated manually.

---

## ⚠️ Known Limitations

* Social login may be mocked or partially implemented
* Mock APIs have limited persistence

---

## 📹 Demo & Artifacts

* APK: (link provided)
* Demo video: (max 5 minutes)
* Screenshots included

---

## 📝 Notes for Reviewer

* Offline mode can be tested by disabling network
* Cached data is clearly marked when offline
* Mock API credentials (if any) are documented

---

## 📄 License

This project is created for technical evaluation purposes.
