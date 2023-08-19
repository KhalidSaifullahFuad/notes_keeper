# Flutter Note-Taking App
This is a simple note-taking app built with Flutter. It allows users to create, edit, and delete notes.

### Table of contents
- [System requirements](#system-requirements)
- [Figma design guidelines for better UI accuracy](#figma-design-guideline-for-better-accuracy)
- [Check the UI of the entire app](#app-navigations)
- [Application structure](#project-structure)
- [How to format the code?](#how-you-can-do-code-formatting)
- [How you can improve code readability?](#how-you-can-improve-the-readability-of-code)
- [Libraries and tools used](#libraries-and-tools-used)
- [Support](#support)


## Features

- Create account 
- Create new notes
- Edit existing notes
- Delete notes
- View list of all notes

## Screenshots


### Application structure

After successful build, the application structure should look like this:

```
.
├── android                         - Files required to run the application on an Android platform.
├── assets                          - All images and fonts of the application.
├── ios                             - Files required to run the application on an iOS platform.
└── lib                             - Most important folder in the application, used to write most of the Dart code..
    ├── main.dart                   - Starting point of the application
    ├── core
    │   ├── app_export.dart         - Commonly used file imports
    │   ├── constants               - Static constant class file
    │   └── utils                   - Common files and utilities of the application
    ├── data                        - Data of the application
    │   ├── database                - Database of the application
    │   └── network                 - API calls of the application
    ├── domain                      - Domain logic of the application
    │   ├── models                  - Models of the application
    │   ├── repositories            - Repositories of the application
    │   └── usecases                - Usecases of the application
    ├── presentation                - Presentation layer of the application
    │   ├── screens                 - Screens of the application
    │   ├── shared                  - Shared widgets of the application
    |   ├── viewmodels              - Viewmodels of the application
    │   └── widgets                 - Widgets of the application
    ├── routes                      - Routes of the application
    ├── test                        - Test files of the application
    └── theme                       - Theme and decoration classes
```

### Libraries and tools used

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