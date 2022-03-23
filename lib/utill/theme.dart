import 'package:flutter/material.dart';

class IDPTheme {
  static ThemeData getThemeData(BuildContext context) {
    final ThemeData appTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: const MaterialColor(
        0xff3282B8,
        <int, Color>{
          50: Color(0x1a30475E),
          100: Color(0xa130475E),
          200: Color(0xaa30475E),
          300: Color(0xaf30475E),
          400: Color(0xff30475E),
          500: Color(0xff99DDFF),
          600: Color(0xff99DDFF),
          700: Color(0xaf3282B8),
          800: Color(0xfa3282B8),
          900: Color(0xff3282B8)
        },
      ),
      //   "colorScheme": {
      // "background": "0xfff7f7f7",
      // "brightness": "light",
      // "error": "0xffba1b1b",
      // "errorContainer": "0xffffdad4",
      // "inversePrimary": "0xff9ccaff",
      // "inverseSurface": "0xff2f3033",
      // "onBackground": "0xff373a40",
      // "onError": "0xffffffff",
      // "onErrorContainer": "0xff410001",
      // "onInverseSurface": "0xfff1f0f4",
      // "onPrimary": "0xffffffff",
      // "onPrimaryContainer": "0xff1e4e6e",
      // "onSecondary": "0xffffffff",
      // "onSecondaryContainer": "0xff1d2b38",
      // "onSurface": "0xff212326",
      // "onSurfaceVariant": "0xff42474e",
      // "onTertiary": "0xffffffff",
      // "onTertiaryContainer": "0xff251432",
      // "outline": "0xff73777f",
      // "primary": "0xff3282b8",
      // "primaryContainer": "0xff8ebad8",
      // "secondary": "0xff30475e",
      // "secondaryContainer": "0xff8d9aa6",
      // "shadow": "0xff000000",
      // "surface": "0xfff7f7f7",
      // "tertiary": "0xff6b5778",
      // "tertiaryContainer": "0xfff3daff"
      // },
      colorScheme: const ColorScheme(
          primary: Color(0xff3282B8),
          primaryVariant: Color(0xff8ebad8),
          secondary: Color(0xff30475e),
          secondaryVariant: Color(0xff8d9aa6),
          surface: Color(0xfff7f7f7),
          background: Color(0xfff7f7f7),
          error: Color(0xffba1b1b),
          onPrimary: Color(0xff1e4e6e),
          onSecondary: Color(0xff1d2b38),
          onSurface: Color(0xff212326),
          onBackground: Color(0xff373a40),
          onError: Color(0xffffdad4),
          brightness: Brightness.light),
      // backgroundColor: const Color(0xffF7F7F7),
      // indicatorColor: const Color(0xff3282B8),
      // primaryColor: const Color(0xff3282B8),
      // primaryColorBrightness: Brightness.light,
      // primaryColorLight: const Color(0x1a30475E),
      // primaryColorDark: const Color(0xff3282B8),
      // canvasColor: const Color(0xffdedede),
      // accentColor: const Color(0xff30475E),
      // accentColorBrightness: Brightness.light,
      // scaffoldBackgroundColor: const Color(0xffF7F7F7),
      // bottomAppBarColor: const Color(0xff3282B8),
      // splashColor: const Color(0xff3282B8),
      // cardColor: Colors.white,
      // dividerColor: const Color(0xff3282B8),
      // focusColor: const Color(0x1a30475E),
      // indicatorColor:,
      // primaryIconTheme: const IconThemeData(color: Color(0xff3282B8)),
      switchTheme: SwitchThemeData(),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xff3282B8),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        enableFeedback: true,
      ),
      // bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff30475e)),
      // tooltipTheme: TooltipThemeData(triggerMode: TooltipTriggerMode.tap),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(color: Colors.white),
          selectedLabelStyle: TextStyle(color: Colors.white),

          backgroundColor: Color(0xff30475e)),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff30475e),
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Color(0xffffffff),
              fontSize: 24,
              fontWeight: FontWeight.normal,
              letterSpacing: 0),
          iconTheme: IconThemeData(color: Color(0xffffffff)),
          actionsIconTheme: IconThemeData(color: Color(0xffffffff))),
      iconTheme: const IconThemeData(color: Color(0xff3282B8)),
// Define the default font family.
      fontFamily: 'Raleway',
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              onPrimary: const Color(0xff30475E),
              primary: const Color(0xff3282B8),
              onSurface: const Color(0xff30475E),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
// Define the default TextTheme. Use this to specify the default
// text styling for headlines, titles, bodies of text, and more.
      dialogTheme: const DialogTheme(
        backgroundColor: Colors.white,
        elevation: 4,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
            color: Color(0xff3282B8),
            fontSize: 98.0,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5),
        headline2: TextStyle(
            color: Color(0xff3282B8),
            fontSize: 61.0,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5),
        headline3: TextStyle(
          color: Color(0xff3282B8),
          fontSize: 49.0,
          fontWeight: FontWeight.normal,
          letterSpacing: 0,
        ),
        headline4: TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.25),
        headline5: TextStyle(
            color: Color(0xff3282B8),
            fontSize: 24,
            fontWeight: FontWeight.normal,
            letterSpacing: 0),
        headline6: TextStyle(
            color: Color(0xff3282B8),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.15),
        subtitle1: TextStyle(
            fontSize: 16, fontWeight: FontWeight.normal, letterSpacing: 0.15),
        subtitle2: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.1),
        bodyText1: TextStyle(
            color: Color(0xff000000),
            fontSize: 16,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.5),
        bodyText2: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.25),
        caption: TextStyle(
          color: Color(0xff3282B8),
          fontSize: 12,
          letterSpacing: 0.4,
          fontWeight: FontWeight.normal,
        ),
        button: TextStyle(
            color: Colors.black,
            fontSize: 14,
            letterSpacing: 1.25,
            fontWeight: FontWeight.w700),
        overline: TextStyle(
            color: Colors.black,
            fontSize: 10,
            letterSpacing: 1.5,
            fontWeight: FontWeight.normal),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentTextStyle: const TextStyle(fontFamily: 'Raleway', fontSize: 15),
      ),
      errorColor: Colors.red,
    );
    return appTheme;
  }
}
