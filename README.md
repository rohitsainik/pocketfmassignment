
### Directory Overview

- **core/**: Contains essential application components:
    - `models/`: Data models with generated code
    - `routes/`: App navigation configuration
    - `services/`: Core business logic services
    - `utils/`: Shared utilities and constants

- **data/**: Implements data layer:
    - `repositories/`: Data access and manipulation

- **src/**: Feature modules, each containing:
    - `binding.dart`: Dependency injection
    - `controller.dart`: Business logic and state management
    - `view.dart`: UI components
    - `widgets/`: Reusable UI components

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- Android Studio / VS Code with Flutter plugins

### Installation

1. Clone the repository:
```bash
git clone [repository-url]
```

2. Navigate to project directory:
```bash
cd pocketfmassignment
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## State Management

The app uses GetX for state management, featuring:

- **Controllers**: Handle business logic and state
- **Bindings**: Manage dependency injection
- **Reactive State**: Utilize `Rx` variables and `Obx` widgets
- **Navigation**: GetX routing system for seamless navigation

## Features

- Product listing with category filtering
- Detailed product view
- Shopping cart management
- Order completion flow
- Responsive design

## Development

To maintain code quality and consistency:

1. Follow the established architecture pattern
2. Keep features modular and independent
3. Use GetX for state management consistently
4. Maintain widget separation in the widgets folder
5. Update translations in app_string.dart   