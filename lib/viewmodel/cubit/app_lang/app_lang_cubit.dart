import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main/main.dart';



part 'app_lang_state.dart';

enum LanguageEvent {
  initial,
  switchToArabic,
  switchToEnglish,
}
class AppLanguageCubit extends Cubit<AppLanguageStates> {
  AppLanguageCubit() : super(AppLangInitialState());



  void changeLanguage(LanguageEvent eventEnums){
    switch(eventEnums){
      case LanguageEvent.initial:
        if (sharedPreferences!.getString("lang") != null) {
          if (sharedPreferences!.getString("lang") == "ar") {
            emit(AppChangeLanguageState(langCode: "ar"));
          }  else{
            emit(AppChangeLanguageState(langCode: "en"));
          }
        }
        break;
      case LanguageEvent.switchToArabic:
        sharedPreferences!.setString("lang", "ar");
        emit(AppChangeLanguageState(langCode: "ar"));
        break;
      case LanguageEvent.switchToEnglish:
        sharedPreferences!.setString("lang", "en");
        emit(AppChangeLanguageState(langCode: "en"));
        break;

    }
  }
}
