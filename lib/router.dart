import 'package:auto_route/auto_route.dart';
import 'package:wordles/feature_game/game_page.dart';
import 'package:wordles/feature_help/help_page.dart';
import 'package:wordles/feature_home/home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: GamePage),
    AutoRoute(page: HelpPage),
  ],
)
class $AppRouter {}
