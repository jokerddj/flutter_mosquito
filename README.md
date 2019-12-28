# flutter_mosquito

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 修改图标
1. 引入flutter_launcher_icons库，设置图标资源
```
dev_dependencies:
  flutter_launcher_icons: "^0.7.3"

flutter_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/icon/icon.png"
```
2. 运行命令
```
flutter pub get
flutter pub run flutter_launcher_icons:main
```