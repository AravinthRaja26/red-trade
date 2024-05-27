// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:base_setup/ui/auth/login_screen.dart' as _i3;
import 'package:base_setup/ui/auth/register_screen.dart' as _i4;
import 'package:base_setup/ui/auth/trader.login_screen.dart' as _i5;
import 'package:base_setup/ui/home/home_screen.dart' as _i2;
import 'package:base_setup/ui/home/history.screen.dart' as _i1;
import 'package:flutter/foundation.dart' as _i7;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HistoryViewScreen.name: (routeData) {
      final args = routeData.argsAs<HistoryViewScreenArgs>(
          orElse: () => const HistoryViewScreenArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.HistoryViewScreen(
          key: args.key,
        ),
      );
    },
    HomeScreen.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    RegisterScreen.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.RegisterScreen(),
      );
    },
    TraderLoginScreen.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.TraderLoginScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.HistoryViewScreen]
class HistoryViewScreen extends _i6.PageRouteInfo<HistoryViewScreenArgs> {
  HistoryViewScreen({
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          HistoryViewScreen.name,
          args: HistoryViewScreenArgs(
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HistoryViewScreen';

  static const _i6.PageInfo<HistoryViewScreenArgs> page =
      _i6.PageInfo<HistoryViewScreenArgs>(name);
}

class HistoryViewScreenArgs {
  const HistoryViewScreenArgs({
    this.key,
  });

  final _i7.Key? key;


  @override
  String toString() {
    return 'HistoryViewScreenArgs{key: $key, news: }';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreen extends _i6.PageRouteInfo<void> {
  const HomeScreen({List<_i6.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreen extends _i6.PageRouteInfo<void> {
  const LoginScreen({List<_i6.PageRouteInfo>? children})
      : super(
          LoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreen';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterScreen extends _i6.PageRouteInfo<void> {
  const RegisterScreen({List<_i6.PageRouteInfo>? children})
      : super(
          RegisterScreen.name,
          initialChildren: children,
        );

  static const String name = 'RegisterScreen';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.TraderLoginScreen]
class TraderLoginScreen extends _i6.PageRouteInfo<void> {
  const TraderLoginScreen({List<_i6.PageRouteInfo>? children})
      : super(
          TraderLoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'TraderLoginScreen';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
