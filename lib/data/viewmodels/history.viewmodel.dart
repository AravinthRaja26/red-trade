import 'package:base_setup/data/models/history.moedl.dart';
import 'package:base_setup/data/viewmodels/base_viewmodel.dart';
import 'package:base_setup/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:localstore/localstore.dart';
import 'package:provider/provider.dart';

class HistoryViewModel extends BaseViewModel {
  HistoryViewModel();

  InAppWebViewController? viewController;

  bool isLoad = false;
  int isLoadProgress = 0;

  List<HistoryModel> historyList = [];

  final GlobalKey webViewKey = GlobalKey();

  String url = '';
  String title = '';
  double progress = 0;

  bool loadScreen = false;

  bool? isSecure;
  InAppWebViewController? webViewController;

  ///
  static ChangeNotifierProvider<HistoryViewModel> buildWithProvider({
    required Widget Function(BuildContext context, Widget? child)? builder,
    Widget? child,
  }) {
    return ChangeNotifierProvider<HistoryViewModel>(
      create: (BuildContext context) => HistoryViewModel()..init(context),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  init(BuildContext context) {
    setBusy(false);
    getHistoryData();
  }

  getHistoryData() async {
    historyList.clear();
    loadScreen = true;
    CollectionRef history = db.collection('quickTraderHistory');
    history.addCondition('traderType','==','${sharedPreferences.getString('trader_selected')}');
    final temp = await history.get();
    temp?.forEach((key, value) {
      historyList.add(HistoryModel.fromJson(value));
    });
    loadScreen = false;
    notifyListeners();
  }

  void updateProgress(int progress) {
    isLoadProgress = progress;
    notifyListeners();
  }

  void updateController(InAppWebViewController controller) {
    webViewController = controller;
    notifyListeners();
  }

  @override
  void dispose() {
    viewController?.dispose();
    super.dispose();
  }
}
