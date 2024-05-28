import 'package:auto_route/auto_route.dart';
import 'package:base_setup/data/viewmodels/home.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage(name: 'homeScreen')
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeViewModel.buildWithProvider(
      builder: (_, __) {
        return _NewsBody();
      },
    );
  }
}

class _NewsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeViewModel model = Provider.of<HomeViewModel>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Home',
            style: TextStyle(
                color: Color(0xff101F5A), fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  model.logout(context);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 8,
          currentIndex: model.selectedIndex,
          selectedFontSize: 18,
          showSelectedLabels: true,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedItemColor: const Color(0xff00AEEF),
          items: List<BottomNavigationBarItem>.generate(2, (index) {
            if (index == 0) {
              return const BottomNavigationBarItem(
                  icon: Icon(Icons.multiline_chart), label: 'MT4');
            } else {
              return const BottomNavigationBarItem(
                  icon: Icon(Icons.multiline_chart), label: 'MT5');
            }
          }, growable: false),
          onTap: (value) => model.updateIndex(value),
        ),

        body: model.widgetOptions[model.selectedIndex],

        // appBar: AppBar(
        //   title: const Text(
        //     'Home',
        //     style: TextStyle(
        //         color: Color(0xff101F5A), fontWeight: FontWeight.bold),
        //   ),
        //   automaticallyImplyLeading: false,
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           model.navigationToHistory(context);
        //         },
        //         icon: const Icon(Icons.history)),
        //     IconButton(
        //         onPressed: () {
        //           model.logout(context);
        //         },
        //         icon: const Icon(Icons.logout))
        //   ],
        // ),
        // body: TabBarView(
        //   children: [
        //     model.newsGlobalLoading
        //         ? const Center(child: CircularProgressIndicator())
        //         : SingleChildScrollView(
        //             child: RefreshIndicator(
        //               onRefresh: () async {
        //                 model.getProtfolioData();
        //               },
        //               child: Padding(
        //                 padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
        //                 child: Column(
        //                   mainAxisSize: MainAxisSize.min,
        //                   children: [
        //                     model.newsPaginationLoading
        //                         ? const Center(child: CircularProgressIndicator())
        //                         : Table(
        //                             border: const TableBorder(
        //                                 top: BorderSide(color: Colors.black),
        //                                 right: BorderSide(color: Colors.black),
        //                                 left: BorderSide(color: Colors.black),
        //                                 verticalInside:
        //                                     BorderSide(color: Colors.black)),
        //                             children: const [
        //                               TableRow(children: [
        //                                 Center(
        //                                     child: Padding(
        //                                   padding:
        //                                       EdgeInsets.symmetric(vertical: 6),
        //                                   child: Text(
        //                                     'Balance',
        //                                     style: TextStyle(
        //                                         fontSize: 16,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 )),
        //                                 Center(
        //                                     child: Padding(
        //                                   padding:
        //                                       EdgeInsets.symmetric(vertical: 6),
        //                                   child: Text(
        //                                     'Equity',
        //                                     style: TextStyle(
        //                                         fontSize: 16,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 )),
        //                                 Center(
        //                                     child: Padding(
        //                                   padding:
        //                                       EdgeInsets.symmetric(vertical: 6),
        //                                   child: Text(
        //                                     'Free Margin',
        //                                     style: TextStyle(
        //                                         fontSize: 16,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 )),
        //                               ])
        //                             ],
        //                           ),
        //                     Table(
        //                       border: TableBorder.all(color: Colors.black),
        //                       children: [
        //                         TableRow(children: [
        //                           Center(
        //                               child: Padding(
        //                             padding:
        //                                 const EdgeInsets.symmetric(vertical: 6),
        //                             child: Text('${model.balance}'),
        //                           )),
        //                           Center(
        //                               child: Padding(
        //                             padding:
        //                                 const EdgeInsets.symmetric(vertical: 6),
        //                             child: Text('${model.equity}'),
        //                           )),
        //                           Center(
        //                               child: Padding(
        //                             padding:
        //                                 const EdgeInsets.symmetric(vertical: 6),
        //                             child: Text('${model.freeMargin}'),
        //                           )),
        //                         ])
        //                       ],
        //                     ),
        //                     const SizedBox(
        //                       height: 16,
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),
        //     SingleChildScrollView(
        //       child: RefreshIndicator(
        //         onRefresh: () async {
        //           model.getSignalData();
        //         },
        //         child: model.alertsLoader
        //             ? const Center(child: CircularProgressIndicator())
        //             : Container(
        //                 color: Colors.white,
        //                 padding: const EdgeInsets.symmetric(
        //                     vertical: 16.0, horizontal: 16.0),
        //                 child: Column(
        //                   children: [
        //                     Table(
        //                       border: const TableBorder(
        //                           top: BorderSide(color: Colors.black),
        //                           right: BorderSide(color: Colors.black),
        //                           left: BorderSide(color: Colors.black),
        //                           verticalInside:
        //                               BorderSide(color: Colors.black)),
        //                       children: const [
        //                         TableRow(children: [
        //                           Center(
        //                               child: Padding(
        //                             padding: EdgeInsets.symmetric(vertical: 6),
        //                             child: Text(
        //                               'T.Frame',
        //                               style: TextStyle(
        //                                   fontSize: 16,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           )),
        //                           Center(
        //                               child: Padding(
        //                             padding: EdgeInsets.symmetric(vertical: 6),
        //                             child: Text(
        //                               'Asset',
        //                               style: TextStyle(
        //                                   fontSize: 16,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           )),
        //                           Center(
        //                               child: Padding(
        //                             padding: EdgeInsets.symmetric(vertical: 6),
        //                             child: Text(
        //                               'Price',
        //                               style: TextStyle(
        //                                   fontSize: 16,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           )),
        //                           Center(
        //                               child: Padding(
        //                             padding: EdgeInsets.symmetric(vertical: 6),
        //                             child: Text(
        //                               'Signal',
        //                               style: TextStyle(
        //                                   fontSize: 16,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           )),
        //                         ])
        //                       ],
        //                     ),
        //                     Table(
        //                       border: TableBorder.all(color: Colors.black),
        //                       children: List.generate(
        //                           model.signals.length,
        //                           (index) => TableRow(children: [
        //                                 Center(
        //                                     child: Padding(
        //                                   padding: const EdgeInsets.symmetric(
        //                                       vertical: 6),
        //                                   child: Text(
        //                                       '${model.signals[index].Timeframe}'),
        //                                 )),
        //                                 Center(
        //                                     child: Padding(
        //                                   padding: const EdgeInsets.symmetric(
        //                                       vertical: 6),
        //                                   child: Text(
        //                                       '${model.signals[index].Assetname}'),
        //                                 )),
        //                                 Center(
        //                                     child: Padding(
        //                                   padding: const EdgeInsets.symmetric(
        //                                       vertical: 6),
        //                                   child: Text(
        //                                       '${model.signals[index].Price}'),
        //                                 )),
        //                                 Center(
        //                                     child: Padding(
        //                                   padding: const EdgeInsets.symmetric(
        //                                       vertical: 6),
        //                                   child: Text(
        //                                       '${model.signals[index].Signaltype}'),
        //                                 )),
        //                               ])),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //       ),
        //     )
        //   ],
        // ),

        // body: SingleChildScrollView(
        //   child: Padding(
        //     padding: const EdgeInsets.all(16.0),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         const Text(
        //           'Please select the options below : ',
        //           style: TextStyle(
        //               color: Colors.black,
        //               fontSize: 16,
        //               fontWeight: FontWeight.bold),
        //         ),
        //         const SizedBox(
        //           height: 12,
        //         ),
        //         DropdownButton<String>(
        //           value: model.assetValue,
        //           items: model.assetValues.map((String value) {
        //             return DropdownMenuItem<String>(
        //               value: value,
        //               child: Text(value),
        //             );
        //           }).toList(),
        //           isExpanded: true,
        //           hint: const Text(
        //             'Select asset value',
        //             style: TextStyle(color: Colors.grey, fontSize: 16),
        //           ),
        //           style: const TextStyle(color: Colors.black, fontSize: 16),
        //           onChanged: (value) {
        //             model.updateAssetValue(value);
        //           },
        //         ),
        //         const SizedBox(
        //           height: 12,
        //         ),
        //         TextFormField(
        //           keyboardType: TextInputType.number,
        //           textInputAction: TextInputAction.next,
        //           controller: model.inputVolumeController,
        //           decoration: const InputDecoration(
        //             hintText: 'Input Volume',
        //             hintStyle: TextStyle(color: Colors.grey),
        //             border: UnderlineInputBorder(
        //               borderSide: BorderSide(color: Color(0xff101F5A)),
        //             ),
        //             enabledBorder: UnderlineInputBorder(
        //               borderSide: BorderSide(color: Color(0xff101F5A)),
        //             ),
        //             focusedBorder: UnderlineInputBorder(
        //               borderSide: BorderSide(color: Color(0xff101F5A)),
        //             ),
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 12,
        //         ),
        //         DropdownButton<String>(
        //           value: model.priceValue,
        //           items: model.priceValues.map((String value) {
        //             return DropdownMenuItem<String>(
        //               value: value,
        //               child: Text(value),
        //             );
        //           }).toList(),
        //           isExpanded: true,
        //           hint: const Text(
        //             'Select price',
        //             style: TextStyle(color: Colors.grey, fontSize: 16),
        //           ),
        //           style: const TextStyle(color: Colors.black, fontSize: 16),
        //           onChanged: (value) {
        //             model.updatePriceValue(value);
        //           },
        //         ),
        //         const SizedBox(
        //           height: 12,
        //         ),
        //         TextFormField(
        //           keyboardType: TextInputType.number,
        //           textInputAction: TextInputAction.next,
        //           controller: model.slController,
        //           decoration: const InputDecoration(
        //             hintText: 'SL',
        //             hintStyle: TextStyle(color: Colors.grey),
        //             border: UnderlineInputBorder(
        //               borderSide: BorderSide(color: Color(0xff101F5A)),
        //             ),
        //             enabledBorder: UnderlineInputBorder(
        //               borderSide: BorderSide(color: Color(0xff101F5A)),
        //             ),
        //             focusedBorder: UnderlineInputBorder(
        //               borderSide: BorderSide(color: Color(0xff101F5A)),
        //             ),
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 12,
        //         ),
        //         TextFormField(
        //           controller: model.tpController,
        //           keyboardType: TextInputType.number,
        //           textInputAction: TextInputAction.done,
        //           decoration: const InputDecoration(
        //             hintText: 'TP',
        //             hintStyle: TextStyle(color: Colors.grey),
        //             border: UnderlineInputBorder(
        //               borderSide: BorderSide(color: Color(0xff101F5A)),
        //             ),
        //             enabledBorder: UnderlineInputBorder(
        //               borderSide: BorderSide(color: Color(0xff101F5A)),
        //             ),
        //             focusedBorder: UnderlineInputBorder(
        //               borderSide: BorderSide(color: Color(0xff101F5A)),
        //             ),
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 32,
        //         ),
        //         Row(
        //           children: [
        //             Expanded(
        //               child: InkWell(
        //                 onTap: () {
        //                   model.storeHomeData('BUY', context);
        //                 },
        //                 child: Container(
        //                   decoration: BoxDecoration(
        //                       color: const Color(0xff00AEEF),
        //                       borderRadius: BorderRadius.circular(16)),
        //                   child: const Padding(
        //                     padding: EdgeInsets.symmetric(
        //                         vertical: 12.0, horizontal: 12),
        //                     child: Center(
        //                       child: Text(
        //                         'BUY',
        //                         style: TextStyle(
        //                             fontSize: 16,
        //                             fontWeight: FontWeight.w700,
        //                             color: Colors.white),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //             const SizedBox(
        //               width: 16,
        //             ),
        //             Expanded(
        //               child: InkWell(
        //                 onTap: () {
        //                   model.storeHomeData('SELL', context);
        //                 },
        //                 child: Container(
        //                   decoration: BoxDecoration(
        //                       color: const Color(0xffEF0707),
        //                       borderRadius: BorderRadius.circular(16)),
        //                   child: const Padding(
        //                     padding: EdgeInsets.symmetric(
        //                         vertical: 12.0, horizontal: 12),
        //                     child: Center(
        //                       child: Text(
        //                         'SELL',
        //                         style: TextStyle(
        //                             fontSize: 16,
        //                             fontWeight: FontWeight.w700,
        //                             color: Colors.white),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
