import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../components/components.dart';
import '../viewmodel/cubit/app_lang/app_lang_cubit.dart';
import '../viewmodel/provider/theme_provider.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final ThemeAppProvider themeProvider =
        Provider.of<ThemeAppProvider>(context);
    final AppLanguageCubit appLangCubit =
        BlocProvider.of<AppLanguageCubit>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: height / 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildBoldText(
              text: translateText(context: context, textJson: "settings")),
          standardDivider,
          SwitchListTile(
            title: themeProvider.currentTheme == ThemeModeType.dark
                ? Text(translateText(context: context, textJson: "light_mode"))
                : Text(translateText(context: context, textJson: "dark_mode")),
            secondary: Icon(
              themeProvider.currentTheme == ThemeModeType.dark
                  ? Icons.sunny
                  : Icons.brightness_2,
            ),
            value: themeProvider.currentTheme == ThemeModeType.dark,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),
          indentedDivider,
          SwitchListTile(
            title: Text(
              translateText(context: context, textJson: "lang"),
            ),
            secondary: const Icon(Icons.language),
            onChanged: (bool value) {
              (value)
                  ? appLangCubit.changeLanguage(LanguageEvent.switchToArabic)
                  : appLangCubit.changeLanguage(LanguageEvent.switchToEnglish);
            },
            value: appLangCubit.state is AppChangeLanguageState &&
                (appLangCubit.state as AppChangeLanguageState).langCode == "ar",
          ),
        ],
      ),
    );
  }
}
