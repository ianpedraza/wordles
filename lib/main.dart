import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wordles/data/register.dart';
import 'package:wordles/firebase_options.dart';
import 'package:wordles/router.gr.dart';
import 'package:wordles/styles/themes.dart';
import 'package:wordles/values/strings.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Register.regist();

  setPathUrlStrategy();

  runApp(App(savedThemeMode: savedThemeMode));
}

class App extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  App({
    Key? key,
    this.savedThemeMode,
  }) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: light,
      dark: dark,
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp.router(
        title: appName,
        theme: theme,
        darkTheme: darkTheme,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
