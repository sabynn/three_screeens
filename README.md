# THREE SCREEENS APP 3️⃣

## About This App

### Flutter
This app is made with Flutter 3.10.5
```
  dart: ">=3.0.5 <4.0.0"
  flutter: ">=3.3.0"
```

### Setup

Clone project
```
git clone 
```

Get All Dependencies/Packages
```
flutter pub get
```

Generate `*.g.dart` and `*.freezed.dart` files
```
flutter pub run build_runner build --delete-conflicting-outputs
```

## Run Project on Device/Emulator

### Debug
```
flutter run
```

### Release
```
flutter run --release
```

### Project structure in lib
    ├── core                    # Core files used generally in the app 
    │   ├── constant            # Const variables used in the app
    │   ├── data                # Models and api call template used in the app
    │   └── design              # Design system of app
    ├── feature                 # Main feature implementation
    ├── services                # Shared preferences and Dependency Injection