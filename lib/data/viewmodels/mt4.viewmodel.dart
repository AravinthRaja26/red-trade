import 'package:base_setup/data/models/history.moedl.dart';
import 'package:base_setup/data/service/navigation_service.dart';
import 'package:base_setup/data/viewmodels/base_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MT4ViewModel extends BaseViewModel {
  MT4ViewModel({required this.tabController});

  double? balance;
  double? equity;
  double? freeMargin;

  bool portFolioLoading = false;
  bool activeTradeLoading = false;

  final fireStore = FirebaseFirestore.instance;

  late TabController tabController;

  ///
  static ChangeNotifierProvider<MT4ViewModel> buildWithProvider({
    required Widget Function(BuildContext context, Widget? child)? builder,
    Widget? child,
    required TabController tabController,
  }) {
    return ChangeNotifierProvider<MT4ViewModel>(
      create: (BuildContext context) =>
          MT4ViewModel(tabController: tabController)
            ..initTabListener(context)
            ..getPortFolioData(context)
            ..getActiveTrades(context),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  List<HistoryModel> historyList = [];

  Future<void> getActiveTrades(BuildContext context) async {
    try {
      final response = await fireStore.collection('MT4_ACTIVE_TRADES').get();

      historyList.clear();

      for (var element in response.docChanges) {
        final data = element.doc;
        if (data.data() != null) {
          historyList.add(HistoryModel.fromJson(data.data()!, data.id));
        }
      }
    } catch (e) {
      print(e);
    } finally {
      if (context.mounted) setBusy(false);
    }
  }

  Future<void> getPortFolioData(BuildContext context) async {
    portFolioLoading = true;
    setBusy(true);

    try {
      final document =
          await fireStore.collection('MT4DATA').doc('Account_info').get();
      List<dynamic> data = document.data()?['Data'];
      for (var element in data) {
        if (element is Map<String, dynamic>) {
          if (element.containsKey('Balance')) {
            balance = element['Balance'];
          }
          if (element.containsKey('Equity')) {
            equity = element['Equity'];
          }
          if (element.containsKey('Free Margin')) {
            freeMargin = element['Free Margin'];
          }
        }
      }
    } catch (e) {
      print(e);
    } finally {
      portFolioLoading = false;
      if (context.mounted) setBusy(false);
    }
  }

  void openNewTrade(BuildContext context) async {
    dynamic value = await NavigationService.navigateToNewTrade(context, false);
    if (value is bool && value && context.mounted) {
      getActiveTrades(context);
    }
  }

  initTabListener(BuildContext context) {
    tabController.addListener(
      () {
        notifyListeners();
      },
    );
  }

  void deleteTrade(HistoryModel historyList, BuildContext context) async {
    try {
      await fireStore
          .collection('MT4_ACTIVE_TRADES')
          .doc(historyList.docId)
          .delete();

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'Deleted successfully...',
        )));

        getActiveTrades(context);
      }
    } catch (e) {
      print(e);
    } finally {
      setBusy(false);
    }
  }
}
