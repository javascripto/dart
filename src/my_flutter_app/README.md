# my_flutter_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Flutter

https://dartpad.dev/
https://flutter.dev/docs/development/ui/widgets/layout
https://flutter-widget.live/
https://flutter.dev/docs/get-started/flutter-for/web-devs
https://flutter.dev/docs/get-started/flutter-for/react-native-devs
https://flutter.dev/docs/get-started/flutter-for/react-native-devs#react-native-and-flutter-widget-equivalent-components

- `flutter doctor`
- `flutter create my_flutter_app`
- `flutter devices`
- `flutter emulators`
- `flutter emulators —launch Pixel_3a_API_30`
- `flutter run`

## Flutter desktop / web

- `flutter config --enable-windows-desktop`
- `flutter config --enable-macos-desktop`
- `flutter config --enable-linux-desktop`

- `flutter run -d linux`
- `flutter run -d Chrome`


## Hello World

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    Center(
      child: Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
```

## Used Widgets

- MaterialApp base
  - MaterialApp
  - Scaffold
  - AppBar

- Buttons and Inputs
  - ElevatedButton
  - TextField
  - FloatingActionButton

- Text and Layout
  - Text
  - Row
  - Column
  - Padding

- Card and Lists
  - Card
  - ListTile
  - ListView
  - ListView.builder
  - SingleChildScrollView
  
- Other
  - AlertDialog
  - Icon