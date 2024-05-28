// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:base_setup/ui/auth/login_screen.dart' as _i3;
import 'package:base_setup/ui/auth/register_screen.dart' as _i5;
import 'package:base_setup/ui/auth/trader.login_screen.dart' as _i6;
import 'package:base_setup/ui/home/history.screen.dart' as _i1;
import 'package:base_setup/ui/home/home_screen.dart' as _i2;
import 'package:base_setup/ui/home/new.trade.screen.dart' as _i4;
import 'package:flutter/material.dart' as _i8;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HistoryViewScreen.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HistoryViewScreen(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    NewTradeScreen.name: (routeData) {
      final args = routeData.argsAs<NewTradeScreenArgs>(
          orElse: () => const NewTradeScreenArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.NewTradeScreen(
          key: args.key,
          isMT5: args.isMT5,
        ),
      );
    },
    RegisterScreen.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RegisterScreen(),
      );
    },
    TraderLoginScreen.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.TraderLoginScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.HistoryViewScreen]
class HistoryViewScreen extends _i7.PageRouteInfo<void> {
  const HistoryViewScreen({List<_i7.PageRouteInfo>? children})
      : super(
          HistoryViewScreen.name,
          initialChildren: children,
        );

  static const String name = 'HistoryViewScreen';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreen extends _i7.PageRouteInfo<void> {
  const HomeScreen({List<_i7.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreen extends _i7.PageRouteInfo<void> {
  const LoginScreen({List<_i7.PageRouteInfo>? children})
      : super(
          LoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreen';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.NewTradeScreen]
class NewTradeScreen extends _i7.PageRouteInfo<NewTradeScreenArgs> {
  NewTradeScreen({
    _i8.Key? key,
    bool? isMT5,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          NewTradeScreen.name,
          args: NewTradeScreenArgs(
            key: key,
            isMT5: isMT5,
          ),
          initialChildren: children,
        );

  static const String name = 'NewTradeScreen';

  static const _i7.PageInfo<NewTradeScreenArgs> page =
      _i7.PageInfo<NewTradeScreenArgs>(name);
}

class NewTradeScreenArgs {
  const NewTradeScreenArgs({
    this.key,
    this.isMT5,
  });

  final _i8.Key? key;

  final bool? isMT5;

  @override
  String toString() {
    return 'NewTradeScreenArgs{key: $key, isMT5: $isMT5}';
  }
}

/// generated route for
/// [_i5.RegisterScreen]
class RegisterScreen extends _i7.PageRouteInfo<void> {
  const RegisterScreen({List<_i7.PageRouteInfo>? children})
      : super(
          RegisterScreen.name,
          initialChildren: children,
        );

  static const String name = 'RegisterScreen';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.TraderLoginScreen]
class TraderLoginScreen extends _i7.PageRouteInfo<void> {
  const TraderLoginScreen({List<_i7.PageRouteInfo>? children})
      : super(
          TraderLoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'TraderLoginScreen';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
