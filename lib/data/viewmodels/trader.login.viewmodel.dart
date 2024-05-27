import 'package:base_setup/data/service/navigation_service.dart';
import 'package:base_setup/data/viewmodels/base_viewmodel.dart';
import 'package:base_setup/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TraderLoginViewModel extends BaseViewModel {
  TraderLoginViewModel();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController serverTextEditingController = TextEditingController();

  final traderTypes = ['MT4', 'MT5'];

  String? selectedTrader = 'MT4';

  ///
  static ChangeNotifierProvider<TraderLoginViewModel> buildWithProvider({
    required Widget Function(BuildContext context, Widget? child)? builder,
    Widget? child,
  }) {
    return ChangeNotifierProvider<TraderLoginViewModel>(
      create: (BuildContext context) => TraderLoginViewModel()..init(context),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  login(BuildContext context) async {
    sharedPreferences.setString('traderType','$selectedTrader');
    if (emailTextEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Please enter your Email',
      )));
      return;
    }
    if (passwordTextEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Please enter password',
      )));
      return;
    }

    if (serverTextEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Please enter server name',
      )));
      return;
    }

    try {
      setBusy(true);

      await Future.delayed(const Duration(seconds: 5));

      sharedPreferences.setString(
          'trader_email', emailTextEditingController.text.toString());
      sharedPreferences.setString(
          'trader_password', passwordTextEditingController.text.toString());
      sharedPreferences.setString(
          'trader_server', serverTextEditingController.text.toString());
      sharedPreferences.setBool('trader_login', true);

      sharedPreferences.setString('trader_selected', selectedTrader.toString());

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'Trader logged in successfully...',
        )));
        NavigationService.navigateToHistory(context);
      }
    } catch (e) {
      debugPrint('$e');
    } finally {
      setBusy(false);
    }
  }

  init(BuildContext context) async {}

  void logout(BuildContext context) async {
    await auth.signOut();
    if (auth.currentUser == null && context.mounted) {
      NavigationService.navigateToLogin(context);
    }
  }

  void updateRadio(String? value) {
    selectedTrader = value;
    sharedPreferences.setString('traderType','$selectedTrader');
    notifyListeners();
  }
}
