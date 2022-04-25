// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import 'feature_game/game_page.dart' as _i2;
import 'feature_help/help_page.dart' as _i3;
import 'feature_home/home_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    GameRoute.name: (routeData) {
      final args = routeData.argsAs<GameRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.GamePage(key: args.key, word: args.word, name: args.name));
    },
    HelpRoute.name: (routeData) {
      final args =
          routeData.argsAs<HelpRouteArgs>(orElse: () => const HelpRouteArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.HelpPage(key: args.key));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(HomeRoute.name, path: '/'),
        _i4.RouteConfig(GameRoute.name, path: '/game-page'),
        _i4.RouteConfig(HelpRoute.name, path: '/help-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.GamePage]
class GameRoute extends _i4.PageRouteInfo<GameRouteArgs> {
  GameRoute({_i5.Key? key, required String word, String? name})
      : super(GameRoute.name,
            path: '/game-page',
            args: GameRouteArgs(key: key, word: word, name: name));

  static const String name = 'GameRoute';
}

class GameRouteArgs {
  const GameRouteArgs({this.key, required this.word, this.name});

  final _i5.Key? key;

  final String word;

  final String? name;

  @override
  String toString() {
    return 'GameRouteArgs{key: $key, word: $word, name: $name}';
  }
}

/// generated route for
/// [_i3.HelpPage]
class HelpRoute extends _i4.PageRouteInfo<HelpRouteArgs> {
  HelpRoute({_i5.Key? key})
      : super(HelpRoute.name,
            path: '/help-page', args: HelpRouteArgs(key: key));

  static const String name = 'HelpRoute';
}

class HelpRouteArgs {
  const HelpRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'HelpRouteArgs{key: $key}';
  }
}
