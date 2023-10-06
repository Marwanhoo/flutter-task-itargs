import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../localization/app_localization_config.dart';
import '../theme/dark_theme.dart';
import '../theme/light_theme.dart';
import '../viewmodel/cubit/app_lang/app_lang_cubit.dart';
import '../viewmodel/cubit/general_cubit/app_cubit.dart';
import '../viewmodel/observer/my_bloc_observer.dart';
import '../viewmodel/provider/theme_provider.dart';
import '../layout/layout_view.dart';

SharedPreferences? sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => ThemeAppProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeAppProvider themeProvider = Provider.of<ThemeAppProvider>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              AppLanguageCubit()..changeLanguage(LanguageEvent.initial),
        ),
        BlocProvider(create: (BuildContext context) => AppCubit()),
      ],
      child: BlocBuilder<AppLanguageCubit, AppLanguageStates>(
        builder: (BuildContext context, AppLanguageStates state) {
          final Locale locale = state is AppChangeLanguageState
              ? Locale(state.langCode)
              : const Locale('en', 'US');
          return MaterialApp(
            locale: locale,
            supportedLocales: AppLocalizationsConfig.supportedLocales,
            localizationsDelegates:
                AppLocalizationsConfig.localizationsDelegates(),
            localeResolutionCallback:
                AppLocalizationsConfig.localeResolutionCallback,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeProvider.currentTheme == ThemeModeType.dark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const LayoutScreen(),
          );
        },
      ),
    );
  }
}
