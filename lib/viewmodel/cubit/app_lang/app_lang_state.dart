part of 'app_lang_cubit.dart';

@immutable
abstract class AppLanguageStates {}

class AppLangInitialState extends AppLanguageStates {}
class AppChangeLanguageState extends AppLanguageStates{
  final String langCode;

  AppChangeLanguageState({required this.langCode});
}
