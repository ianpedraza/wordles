import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../values/colors.dart';

final ThemeData light = ThemeData(
  primarySwatch: primaryColor as MaterialColor,
  scaffoldBackgroundColor: lightColor,
  textTheme: GoogleFonts.latoTextTheme().apply(
    bodyColor: darkColor,
    displayColor: darkColor,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: lightColor,
    titleTextStyle: TextStyle(
      color: darkColor,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    iconTheme: IconThemeData(
      color: darkColor,
    ),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: lightColor,
    scrimColor: Colors.black12,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(wordlesRed),
    trackColor: MaterialStateProperty.all(wordlesRed.withOpacity(0.4)),
  ),
  dialogBackgroundColor: lightColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return keyboardGrey;
        }
        return darkColor;
      }),
    ),
  ),
  dividerTheme: const DividerThemeData(
    thickness: 0.5,
    color: keyboardGrey,
  ),
);

final ThemeData dark = ThemeData(
  primarySwatch: primaryColorDark as MaterialColor,
  scaffoldBackgroundColor: darThemeBackground,
  textTheme: GoogleFonts.latoTextTheme().apply(
    bodyColor: lightColor,
    displayColor: lightColor,
  ),
  appBarTheme: const AppBarTheme(
    shadowColor: lightColor,
    backgroundColor: darThemeBackground,
    titleTextStyle: TextStyle(
      color: lightColor,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    iconTheme: IconThemeData(
      color: lightColor,
    ),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: darThemeBackground,
    scrimColor: Colors.white12,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(wordlesRed),
    trackColor: MaterialStateProperty.all(wordlesRed.withOpacity(0.4)),
  ),
  dialogBackgroundColor: darThemeBackground,
  dividerColor: wordleGrey,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return keyboardGrey;
        }
        return lightColor;
      }),
    ),
  ),
  dividerTheme: const DividerThemeData(
    thickness: 0.5,
    color: keyboardGrey,
  ),
);
