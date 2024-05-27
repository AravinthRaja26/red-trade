import 'package:auto_route/auto_route.dart';
import 'package:base_setup/application/auto_router/auto_router.gr.dart';
import 'package:base_setup/main.dart';

///
/// [AuthGuard]
///
class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (auth.currentUser != null) {
      if (sharedPreferences.getBool('trader_login') == true) {
        router.pushAndPopUntil( HistoryViewScreen(), predicate: (_) => false);
      } else {
        router.pushAndPopUntil(const TraderLoginScreen(),
            predicate: (_) => false);
      }
    } else {
      resolver.next();
    }
  }
}
