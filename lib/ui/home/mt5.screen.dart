import 'package:base_setup/data/viewmodels/mt5.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MT5Screen extends StatefulWidget {
  const MT5Screen({super.key});

  @override
  State<MT5Screen> createState() => _MT5Screen();
}

class _MT5Screen extends State<MT5Screen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MT5ViewModel.buildWithProvider(
        builder: (_, __) {
          return _Body();
        },
        tabController: _tabController);
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MT5ViewModel model = Provider.of<MT5ViewModel>(context);

    return Scaffold(
      floatingActionButton: Visibility(
        visible: model.tabController.index == 1,
        child: ElevatedButton(
            onPressed: () {
              model.openNewTrade(context);
            },
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xff00AEEF))),
            child: const Text(
              'New trade',
              style: TextStyle(color: Colors.white),
            )),
      ),
      body: Column(
        children: [
          TabBar(
            controller: model.tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            tabAlignment: TabAlignment.fill,
            isScrollable: false,
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            labelColor: const Color(0xff00AEEF),
            indicatorColor: const Color(0xff00AEEF),
            unselectedLabelColor: const Color(0x8000aeef),
            onTap: (onTap) {
              print(onTap);
            },
            tabs: const [
              Tab(
                child: Text(
                  'Portfolio',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Active Trades',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: model.tabController,
              children: [
                model.portFolioLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            model.getPortFolioData(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Table(
                                  border: const TableBorder(
                                      top: BorderSide(color: Colors.black),
                                      right: BorderSide(color: Colors.black),
                                      left: BorderSide(color: Colors.black),
                                      verticalInside:
                                          BorderSide(color: Colors.black)),
                                  children: const [
                                    TableRow(children: [
                                      Center(
                                          child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 6),
                                        child: Text(
                                          'Balance',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                      Center(
                                          child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 6),
                                        child: Text(
                                          'Equity',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                      Center(
                                          child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 6),
                                        child: Text(
                                          'Free Margin',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                    ])
                                  ],
                                ),
                                Table(
                                  border: TableBorder.all(color: Colors.black),
                                  children: [
                                    TableRow(children: [
                                      Center(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6),
                                        child: Text('${model.balance}'),
                                      )),
                                      Center(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6),
                                        child: Text('${model.equity}'),
                                      )),
                                      Center(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6),
                                        child: Text('${model.freeMargin}'),
                                      )),
                                    ])
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                RefreshIndicator(
                  onRefresh: () async {
                    model.getActiveTrades(context);
                  },
                  child: model.activeTradeLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: model.historyList.isEmpty
                              ? const Center(
                                  child: Text('No active trades'),
                                )
                              : ListView.separated(
                                  shrinkWrap: false,
                                  itemBuilder: (context, index) {
                                    return Card.outlined(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                        text: '',
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                        children: [
                                                          const TextSpan(
                                                            text: 'Asset',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          const TextSpan(
                                                              text: ' : '),
                                                          TextSpan(
                                                              text:
                                                                  '${model.historyList[index].assetValue}'),
                                                        ]),
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                        text: '',
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                        children: [
                                                          const TextSpan(
                                                            text: 'IV',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          const TextSpan(
                                                              text: ' : '),
                                                          TextSpan(
                                                              text:
                                                                  '${model.historyList[index].inputVolume}'),
                                                        ]),
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                        text: '',
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                        children: [
                                                          const TextSpan(
                                                            text: 'Price',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          const TextSpan(
                                                              text: ' : '),
                                                          TextSpan(
                                                              text:
                                                                  '${model.historyList[index].price}'),
                                                        ]),
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                        text: '',
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                        children: [
                                                          const TextSpan(
                                                            text: 'SL',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          const TextSpan(
                                                              text: ' : '),
                                                          TextSpan(
                                                              text:
                                                                  '${model.historyList[index].sl}'),
                                                        ]),
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                        text: '',
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                        children: [
                                                          const TextSpan(
                                                            text: 'TP',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          const TextSpan(
                                                              text: ' : '),
                                                          TextSpan(
                                                              text:
                                                                  '${model.historyList[index].tp}'),
                                                        ]),
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                        text: '',
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                        children: [
                                                          const TextSpan(
                                                            text: 'Type',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          const TextSpan(
                                                              text: ' : '),
                                                          TextSpan(
                                                              text:
                                                                  '${model.historyList[index].type}'),
                                                        ]),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  model.deleteTrade(
                                                      model.historyList[index],
                                                      context);
                                                },
                                                icon: const Icon(
                                                    Icons.delete_outline))
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 16,
                                      ),
                                  itemCount: model.historyList.length),
                        ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
