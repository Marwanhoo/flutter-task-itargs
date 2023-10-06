import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../localization/app_localizations.dart';



AnimatedTextKit wavyTextAnimation = AnimatedTextKit(
  repeatForever: true,
  animatedTexts: [
    WavyAnimatedText(
      'Flutter Task itargs',
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
);

Divider standardDivider = const Divider(
  thickness: 2,
);

Divider indentedDivider = const Divider(
  indent: 50,
  endIndent: 50,
);

Tab buildTabWithIconAndText({
  required String text,
  required IconData icon,
}) {
  return Tab(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon),
        Text(text),
      ],
    ),
  );
}

Text buildBoldText({
  required String text,
}) {
  return Text(
    text,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  );
}

Future<bool?> showToastMessage(String message) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

String translateText({
  required BuildContext context,
  required String textJson,
}) =>
    AppLocalizations.of(context)!.translate(
      textJson,
    );

Future<void> showCustomAlertDialog(context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CircleAvatar(
                  radius: 50,
                  child: SvgPicture.asset(
                    "assets/images/itargs_logo.svg",
                  ),
                ),
              ),
              const Text(
                "ITargs",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const Text("Software Company"),
              indentedDivider,
              const Text("Muhammad Marwan")
            ],
          ),
          actions: [
            TextButton(
              child:  Text(translateText(context: context, textJson: "dialog_ok")),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

String getLikeDislikeMessage(List<bool> likedItems, int index, BuildContext context) {
  final String message = likedItems[index]
      ? translateText(
      context: context, textJson: "toast_dislike")
      : translateText(
      context: context, textJson: "toast_like");
  return message;
}


void showErrorAlertDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Error"),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}


void showCustomSnackBar({required BuildContext context, required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
      ),
    ),
  );
}
