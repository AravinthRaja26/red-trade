import 'package:auto_route/auto_route.dart';
import 'package:base_setup/data/models/signal.model.dart';
import 'package:base_setup/data/service/navigation_service.dart';
import 'package:base_setup/data/viewmodels/base_viewmodel.dart';
import 'package:base_setup/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewTradeViewModel extends BaseViewModel {
  NewTradeViewModel({this.isMT5});

  /// News section
  List<Signal> signals = <Signal>[];
  String? csrfToken;
  bool newsGlobalLoading = false;
  bool alertsLoader = false;
  bool newsPaginationLoading = false;
  int? dataMore;
  bool? morePages;
  double? balance;
  double? equity;
  double? freeMargin;

  final fireStore = FirebaseFirestore.instance;
  TextEditingController inputVolumeController = TextEditingController();
  TextEditingController slController = TextEditingController();
  TextEditingController tpController = TextEditingController();

  final assetValues = [
    'EURUSD',
    'GBPUSD',
    'USDCHF',
    'USDJPY',
    'USDCNH',
    'USDRUB',
    'AUDUSD',
    'NZDUSD',
    'USDCAD',
    'USDSEK'
  ];
  final priceValues = ['Market price', 'Customer price'];

  bool? isMT5;

  ///
  static ChangeNotifierProvider<NewTradeViewModel> buildWithProvider({
    required Widget Function(BuildContext context, Widget? child)? builder,
    Widget? child,
    bool? isMT5,
  }) {
    return ChangeNotifierProvider<NewTradeViewModel>(
      create: (BuildContext context) => NewTradeViewModel(isMT5: isMT5)
        ..getProtfolioData()
        ..getSignalData(),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  Future<void> getSignalData() async {}

  Future<void> getProtfolioData() async {}

  String? dateFormat(Timestamp? tme) {
    int timestamp = tme?.millisecondsSinceEpoch ?? 0; // Example timestamp

    // Convert timestamp to DateTime
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedDate = DateFormat('dd-MM-yyyy HH:MM').format(dateTime);

    return formattedDate;
  }

  void logout(BuildContext context) async {
    sharedPreferences.clear();
    if (context.mounted) {
      NavigationService.navigateToTraderLogin(context);
    }
  }

  void navigationToHistory(BuildContext context) {
    NavigationService.navigateToHistory(context);
  }

  void navigateToDetailWebView(item, BuildContext context) async {
    if (await canLaunchUrl(Uri.parse(item!.newsUrl!))) {
      await launchUrl(Uri.parse(item!.newsUrl!));
    }
  }

  String? assetValue;

  void updateAssetValue(String? value) {
    assetValue = value;
    notifyListeners();
  }

  String? priceValue;

  void updatePriceValue(String? value) {
    priceValue = value;
    notifyListeners();
  }

  storeHomeData(String? type, BuildContext context) async {
    try {
      setBusy(true);
      if (isMT5 == true) {
        await fireStore.collection('MT5_ACTIVE_TRADES').add({
          'assetValue': '$assetValue',
          'inputVolume': inputVolumeController.text,
          'price': '$priceValue',
          'sl': slController.text,
          'tp': tpController.text,
          'type': type,
        });
      } else if (isMT5 == false) {
        await fireStore.collection('MT4_ACTIVE_TRADES').add({
          'assetValue': '$assetValue',
          'inputVolume': inputVolumeController.text,
          'price': '$priceValue',
          'sl': slController.text,
          'tp': tpController.text,
          'type': type,
        });
      }

      inputVolumeController.clear();
      tpController.clear();
      slController.clear();
      assetValue = null;
      priceValue = null;
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'New trade added successfully...',
        )));

        AutoRouter.of(context).pop(true);
      }
    } catch (e) {
      print(e);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          '$e',
        )));
      }
    } finally {
      setBusy(false);
    }
  }
}
