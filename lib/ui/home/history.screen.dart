import 'package:auto_route/auto_route.dart';
import 'package:base_setup/data/viewmodels/history.viewmodel.dart';
import 'package:base_setup/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

@RoutePage(name: 'historyViewScreen')
class HistoryViewScreen extends StatelessWidget {
  const HistoryViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HistoryViewModel.buildWithProvider(
      builder: (_, __) {
        return const HistoryView();
      },
    );
  }
}

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    HistoryViewModel model = Provider.of<HistoryViewModel>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabAlignment: TabAlignment.fill,
            isScrollable: false,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            labelColor: onSurface,
            indicatorColor: onSurface,
            unselectedLabelColor: onSurfaceVariant,
            onTap: (onTap) {
              print(onTap);
              // model.getAlertsData(onTap);
            },
            tabs: const [
              Tab(
                child: Text(
                  'MT 4',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'MT 5',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          title: const Text(
            'Home',
            style: TextStyle(color: onSurface, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  // model.logout(context);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: RefreshIndicator(
                onRefresh: () async {
                  // model.getAlertsData(0);
                },
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Table(
                        border: const TableBorder(
                            top: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            verticalInside: BorderSide(color: Colors.black)),
                        children: const [
                          TableRow(children: [
                            Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'Asset',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            )),
                            Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'I.V',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            )),
                            Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'T.Type',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            )),
                            Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'SL',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            )),
                            Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'TP',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            )),
                            Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'Order',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            )),
                          ])
                        ],
                      ),
                      Table(
                        border: TableBorder.all(color: Colors.black),
                        children: List.generate(
                            6,
                            (index) => TableRow(children: [
                                  Center(
                                      child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Text(
                                        r'${model.alertList[index].timeFrame}'),
                                  )),
                                  Center(
                                      child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Text(
                                        r'${model.alertList[index].assetname}'),
                                  )),
                                  Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 4.0),
                                    child:
                                        Text(r'${model.alertList[index].time}'),
                                  )),
                                  Center(
                                      child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Text(
                                        r'${model.alertList[index].signalType}'),
                                  )),
                                  Center(
                                      child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Text(
                                        r'${model.alertList[index].signalType}'),
                                  )),
                                  Center(
                                      child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Text(
                                        r'${model.alertList[index].signalType}'),
                                  )),
                                ])),
                      ),
                    ],
                  ),
                ),
                /*Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: ListView.builder(
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              itemBuilder: (context, index) {
                                final item = model.newsList[index];
                                debugPrint('title $index  : ${item.title}');
                                return NewsItem(
                                  item: item,
                                );
                              },
                              itemCount: model.newsList.length,
                            ),
                          ),
                          model.newsPaginationLoading
                              ? const Center(child: CircularProgressIndicator())
                              : Visibility(
                                  visible: model.morePages == true,
                                  child: Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        model.initLoadMore(context);
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) =>
                                                      const Color(0xff101F5A))),
                                      child: const Text(
                                        'Load More',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),*/
              ),
            ),
            SingleChildScrollView(
              child: RefreshIndicator(
                onRefresh: () async {
                  // model.getAlertsData(1);
                },
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Table(
                        border: const TableBorder(
                            top: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            verticalInside: BorderSide(color: Colors.black)),
                        children: const [
                          TableRow(children: [
                            Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'T.Frame',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            )),
                            Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'Asset',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            )),
                            Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'Time',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            )),
                            Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'Signal',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            )),
                          ])
                        ],
                      ),
                      StreamBuilder(
                        stream: db.collection('MT5DATA').doc('account_info').get().asStream(),
                        builder: (context, snapshot) => Table(
                          border: TableBorder.all(color: Colors.black),
                          children: List.generate(
                              4,
                              (index) => TableRow(children: [
                                    Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Text(
                                          '${snapshot.data?['']}'),
                                    )),
                                    Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Text(
                                          '${snapshot.data?['']}'),
                                    )),
                                    Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 4.0),
                                      child: Text(
                                          '${snapshot.data?['']}'),
                                    )),
                                    Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Text(
                                          '${snapshot.data?['']}'),
                                    )),
                                  ])),
                        ),
                      ),
                      Table(
                        border: TableBorder.all(color: Colors.black),
                        children: List.generate(
                            4,
                            (index) => TableRow(children: [
                                  Center(
                                      child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Text(
                                        r'${model.alertList[index].timeFrame}'),
                                  )),
                                  Center(
                                      child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Text(
                                        r'${model.alertList[index].assetname}'),
                                  )),
                                  Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 4.0),
                                    child:
                                        Text(r'${model.alertList[index].time}'),
                                  )),
                                  Center(
                                      child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Text(
                                        r'${model.alertList[index].signalType}'),
                                  )),
                                ])),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
