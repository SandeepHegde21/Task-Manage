# Task Manager_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Packages Used:
To add packages into  your project,go to pubspec.yaml file and  add the package in the dependency sections and run "flutter pub get"  
  ### 1.sqflite:
      SQLite plugin for Flutter. Supports iOS, Android and MacOS.
            Support transactions and batches
            Automatic version managment during open
            Helpers for insert/query/update/delete queries
            DB operation executed in a background thread on iOS and Android
     Other platforms support:
            Linux/Windows/DartVM support using sqflite_common_ffi
            Web is not supported.
     In your Dart code, you can use:
            import 'package:sqflite/sqflite.dart';         
   ### 2.path_provider:
        A Flutter plugin for finding commonly used locations on the filesystem. Supports iOS, Android, Linux and MacOS. Not all methods are supported on all platforms.
        In your Dart code, you can use:
          import 'package:path_provider/path_provider.dart';
   ### 3.intl:
      Provides internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text.The most important library is intl. It defines the Intl class, with the default locale and methods for accessing most of the internationalization mechanisms. This library also defines the DateFormat, NumberFormat, and BidiFormatter classes.
   
  ## To run the project 
          Use the command ,"flutter run"
