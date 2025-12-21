📅 My Events (Flutter)

A Flutter-based Event Management application built with GetX, supporting authentication, event browsing, event creation/editing (authorized users), offline mode with caching, pagination, and real-time connectivity handling.


## 🔐 Test Account
To evaluate the application, please use the following test credentials:

- **Email:** eve.holt@reqres.in  
- **Password:** cityslicka

These credentials are provided only for review and testing purposes.


🚀 Features Overview
✅ Core Features

User authentication (login/logout)
Browse events with pagination
Event detail screen with deep linking support
Create & edit events (authorized users)
Register for an event
Favorites support
Pull-to-refresh


🌐 Offline Support

Cached event list & event detail
Offline banner indicator
No API calls while offline
Seamless transition when connectivity is restored


🧱 Architecture Overview
The app follows a clean, scalable architecture:

lib/
├── controllers/        // GetX Controllers (state & logic)
├── repositories/       // API & data abstraction layer
├── services/           // Storage, connectivity, favorites
├── models/             // Data models
├── views/              // UI screens
├── routes/             // App routes
└── utils/              // Helpers, constants


🔹 Architectural Choices & Justification

Choice	Reason
GetX	Lightweight, reactive, fast navigation & state management
Repository Pattern	Clean separation of UI and data logic
GetIt (DI)	Decoupled dependency injection
Connectivity Plus	Real-time network awareness
Local Storage	Offline-first experience
Reactive State (Rx)	Instant UI updates without rebuild overhead


📦 Packages Used

Package	Purpose
get	  ------------------- State management & navigation
get_it	----------------- Dependency injection
dio	--------------------- HTTP networking
flutter_secure_storage -- for secure token
connectivity_plus	------- Network status detection
cached_network_image	--- Image caching
flutter_secure_storage	- Secure token storage
intl -------------------- for date time
iconsax ----------------- for modern icon
get_storage	------------- Lightweight local caching
shimmer	----------------- Loading placeholders


🧠 AI / LLM Usage Disclosure

AI tools (ChatGPT) were used only for:
Architectural validation
Edge-case reasoning
README structure guidance

❌ No production code was copy-pasted blindly, use Gpt for minor logics
✅ All logic was reviewed, implemented, and customized manually


⚙️ Setup & Run Instructions
1️⃣ Prerequisites

Flutter SDK (>= 3.x)
Dart SDK
Android Studio / VS Code
Emulator or physical device

2️⃣ Clone Repository
git clone <your-repo-url>
cd event-management-app

3️⃣ Install Dependencies
flutter pub get

4️⃣ Run the App
flutter run

📱 Build Artifacts
Android APK


👉 [Apk of My App]
https://drive.google.com/file/d/1eY2N06QGoPGi59jghDAxH6yy7owZ4msQ/view?usp=sharing

iOS (Optional)

Built via Xcode
Not included due to platform constraints


🎥 Demo Video (≤ 5 minutes)

The demo video demonstrates:
Login / Logout
Browse events (pagination)
Event detail screen
Create event
Edit event
Offline mode behavior
Online restoration

👉 [Video Link of App]
https://drive.google.com/file/d/1x1yJu9xUKr5ZMdF9rXzz8hDshtVSHui1/view?usp=sharing


🧪 Testing & CI
Test Coverage

Unit tests: ❌ (Not implemented)
Widget tests: ❌ (Not implemented)

Due to time constraints, focus was placed on feature completeness and architecture. But build apk --release app version i paste

Runs:
flutter pub get
flutter analyze
flutter test

-- No role-based authorization enforced on backend --

Limited validation on date input
No retry queue for offline create/edit actions
No unit/widget tests (can be added)

🧠 Design Decisions

Event list is the single source of truth
Detail screen syncs with list state
Offline-first approach prioritized

API calls blocked during offline mode to prevent errors

🧪 ReqRes API

Used for Authentication Purpose, espicially for Login

🧪 Mock API

No mock server included
App assumes a working REST API
Local cache acts as fallback during offline usage

✅ Requirement Checklist (PDF)

Requirement	Status
Git repo with commit history	✅
README with setup & architecture	✅
APK build	✅
Demo video	✅
Offline mode	✅
Create/Edit events	✅
Connectivity handling	✅
CI workflow	✅
Test results	⚠️ Partial
👨‍💻 Author

Name: Fardeen Khan
Role: Flutter Developer
Contact: [fardeenkhaan70@gmail.com / https://www.linkedin.com/in/fardeenkhan51/]
