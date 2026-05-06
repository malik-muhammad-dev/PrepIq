# PrepIQ - AI Interview Coach

<p align="center">
  <img src="screenshot/logo.png" width="100" />
</p>

<p align="center">
  <strong>Ace every interview with AI</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" />
  <img src="https://img.shields.io/badge/Groq_AI-FF6B6B?style=for-the-badge" />
</p>

---

## About

PrepIQ is an AI powered mock interview app built with Flutter. 
It generates real technical interview questions based on your 
selected job role and industry, evaluates your answers using 
Groq AI, and provides detailed feedback with a strict score.

---

## Features

- AI generated questions based on role and industry
- Strict AI scoring and detailed feedback
- Interview history saved to Firebase
- Real user authentication
- 8 industries and 70+ job roles
- Beautiful dark UI with smooth animations
- Clean architecture with GetX state management

---

## Tech Stack

| Technology | Purpose |
|---|---|
| Flutter | Cross platform mobile development |
| Dart | Programming language |
| GetX | State management and navigation |
| Groq AI | Question generation and answer analysis |
| Firebase Auth | User authentication |
| Cloud Firestore | Interview history storage |
| Clean Architecture | Feature based modular structure |

---

## Screenshots

| Splash | Home | Interview |
|---|---|---|
| ![Splash](screenshot/splash.png) | ![Home](screenshot/home.png) | ![Interview](screenshot/interview.png) |

| Results | History | Profile |
|---|---|---|
| ![Results](screenshot/results.png) | ![History](screenshot/history.png) | ![Profile](screenshot/profile.png) |

---

## Project Structure
lib/
├── app/                    # App initialization and routing
├── core/                   # Constants, theme, services
│   ├── constants/          # Colors, strings, dimensions
│   ├── services/           # AI service (Groq)
│   └── theme/              # App theme
├── features/               # Feature modules
│   ├── splash/
│   ├── onboarding/
│   ├── auth/
│   ├── home/
│   ├── interview/
│   ├── results/
│   ├── history/
│   └── profile/
└── shared/                 # Shared widgets and models

---

## Getting Started

### Prerequisites

- Flutter SDK 3.0+
- Dart SDK
- Firebase account
- Groq API key (free at console.groq.com)

### Installation

```bash
# Clone the repository
git clone https://github.com/malik-muhammad-dev/PrepIQ.git
cd PrepIQ

# Install dependencies
flutter pub get

# Create app_contants.dart in lib/core/constants/
# Add your API keys (see app_contants.example.dart)

# Run the app
flutter run
```

---

## API Keys Setup

Create `lib/core/constants/app_contants.dart`:

```dart
class AppConstants {
  static const String groqApiKey = 'YOUR_GROQ_KEY';
  static const String groqModel = 'llama-3.3-70b-versatile';
  static const String groqApiUrl =
      'https://api.groq.com/openai/v1/chat/completions';
  static const int totalQuestions = 5;
  static const int maxTokens = 1000;
}
```

---

## Developer

**Malik Muhammad** — Flutter Developer

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/malik-muhammad-b66178350/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/malik-muhammad-dev)

---

Built with ❤️ using Flutter and Groq AI