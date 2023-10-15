# Flutter Task Itargs

In this challenge you are requested to do an application where it shows two pages and can
navigate between them through Tab bar.


# Description

### Home Tab bar

It is divided into two sections ( TopLikes - Listen Audios ).

- Display 3 items of dummy information
- You can like separately while showing the like message
- You can listen to audio based on the data from Api
- The application downloads audios for later listening when the app is offline
- You can admire the audios separately
- Show loading indicators when the Audio is loading
  
### More Tab bar

It has one section ( Settings ) and it contains Change the theme , change the language.

While keeping the last position inside shared preferences


- functionality to change the language
- functionality  change the theme to dark mode
- Once the language changed the dummy information in Tabbar should be responsive for this change



### Architecture and State Management

- MVVM architecture
- Provider to change the app theme
- BLoc(cubit) to change Language and interaction with the application in general Like button, Download audios, Icon changed

# Folders tree
```
flutter task itargs
├── assets
│   ├── images
│   │   └── itargs_logo.svg
│   └── lang
│       ├── ar.json
│       └── en.json
└── lib
    ├── components
    │   └── components.dart
    ├── layout
    │   └── layout_view.dart
    ├── localization
    │   ├── app_localization_config.dart
    │   ├── app_localization.dart
    │   └── lang_enum.dart
    ├── main
    │   └── main.dart
    ├── models
    │   ├── api
    │   │   └── api_services.dart
    │   ├── quran_model
    │   │   └── quran_model.dart
    │   └── repository
    │       └── audio_repo.dart
    ├── theme
    │   ├── dark_theme.dart
    │   └── light_theme.dart
    ├── viewmodel
    │   ├── cubit
    │   │   ├── app_lang
    │   │   │   ├── app_lang_cubit.dart
    │   │   │   └── app_lang_state.dart
    │   │   └── general_cubit
    │   │       ├── app_cubit.dart
    │   │       └── app_state.dart
    │   ├── observer
    │   │   └── my_bloc_observer
    │   └── provider
    │       └── theme_provider.dart
    └── views
        ├── home_view.dart
        └── more_view.dart
```


# Demo Video



https://github.com/Marwanhoo/flutter-task-itargs/assets/125823028/c2cc4dd9-a2be-41b8-a89c-b0974d1739b5



# Photos
![Screenshot_20231006_074733_com example itargs flutter_task](https://github.com/Marwanhoo/flutter-task-itargs/assets/125823028/6101b347-cc36-4a58-9f95-8ca451f8a788)
![Screenshot_20231006_074739_com example itargs flutter_task](https://github.com/Marwanhoo/flutter-task-itargs/assets/125823028/7416892a-3ff1-4dcf-bd53-ff9bb6c2b47e)
![Screenshot_20231006_074745_com example itargs flutter_task](https://github.com/Marwanhoo/flutter-task-itargs/assets/125823028/274adadb-8960-4377-9aeb-f2561b84a1e3)
![Screenshot_20231006_074752_com example itargs flutter_task](https://github.com/Marwanhoo/flutter-task-itargs/assets/125823028/d7147b52-0e1e-4fb1-a7d9-d8b07396f609)
![Screenshot_20231006_074806_com example itargs flutter_task](https://github.com/Marwanhoo/flutter-task-itargs/assets/125823028/7f0d51ed-2d51-4686-b784-491501f743a2)
![Screenshot_20231006_074826_com example itargs flutter_task](https://github.com/Marwanhoo/flutter-task-itargs/assets/125823028/d99ad36d-3fbd-408f-b248-bd649c96239f)
![Screenshot_20231006_074833_com example itargs flutter_task](https://github.com/Marwanhoo/flutter-task-itargs/assets/125823028/aa8cbb07-6329-4c57-bcb2-34235d78c351)
![Screenshot_20231006_074839_com example itargs flutter_task](https://github.com/Marwanhoo/flutter-task-itargs/assets/125823028/0abbd249-ac53-46e6-8fa8-03554dce0296)
