# Flutter Note-Taking App
This is a simple note-taking app built with Flutter. It allows users to create, edit, and delete notes.

### Table of contents
- [Features](#features)
- [Screenshots](#screenshots)
- [Application structure](#application-structure)
- [Libraries and tools used](#libraries-and-tools-used)
- [Contributing](#contributing)


## Features

- Create account
- Create new notes
- Edit existing notes
- Delete notes
- View list of all notes

## Screenshots

<img src="/readme/1.png" width="200"/>

## Application structure

Used Clean Architecture with MVVM design pattern.

```
.
├── android                         - Files required to run the application on an Android platform.
├── assets                          - All images and fonts of the application.
├── ios                             - Files required to run the application on an iOS platform.
└── lib
    ├── core
    |   ├── models                  - Models of the application
    │   ├── providers               - Providers of the application
    │   ├── services                - Services of the application
    │   └── constants               - Static constant class file
    ├── presentation                - Presentation layer of the application
    │   ├── screens                 - Screens of the application
    │   ├── shared                  - Shared screens and widgets of the application
    |   |   |-- screens
    |   |   └── widgets
    |   └── viewmodels              - Viewmodels of the application
    |── utils                       - Common files and utilities of the application
    │   ├── app_export.dart
    │   └── app_routes.dart
    ├── theme                       - Theme and decoration classes
    ├── test                        - Test files of the application
    └── main.dart                   - Starting point of the application
```

## Libraries and tools used

- Provider - State management
  https://pub.dev/packages/provider
- SQflite - For storing data in local database
  https://pub.dev/packages/sqflite
- cached_network_image - For storing internet image into cache
  https://pub.dev/packages/cached_network_image


## Getting Started

1. Clone this repository
2. Open the project in Visual Studio Code
3. Run `flutter pub get` to install dependencies
4. Run the app using `flutter run`

## Contributing
If you'd like to contribute to the project, feel free to submit a pull request with your changes. Please make sure to follow the existing code style and include tests for any new features or bug fixes.

If you like my work, support me by giving a ⭐️ for this repository

## License
This project is licensed under the GNU General Public License v3.0 License - see the LICENSE file for details.

