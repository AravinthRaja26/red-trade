import 'package:auto_route/auto_route.dart';
import 'package:base_setup/data/viewmodels/new.trade.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage(name: 'newTradeScreen')
class NewTradeScreen extends StatelessWidget {
  const NewTradeScreen({super.key, this.isMT5});

  final bool? isMT5;

  @override
  Widget build(BuildContext context) {
    return NewTradeViewModel.buildWithProvider(
      builder: (_, __) {
        return _NewTradeBody();
      },
        isMT5: isMT5
    );
  }
}

class _NewTradeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewTradeViewModel model = Provider.of<NewTradeViewModel>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add New Trade',
            style: TextStyle(
                color: Color(0xff101F5A), fontWeight: FontWeight.bold),
          ),
        ),
        body: model.busy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Please select the options below : ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      DropdownButton<String>(
                        value: model.assetValue,
                        items: model.assetValues.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        isExpanded: true,
                        hint: const Text(
                          'Select asset value',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                        onChanged: (value) {
                          model.updateAssetValue(value);
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        controller: model.inputVolumeController,
                        decoration: const InputDecoration(
                          hintText: 'Input Volume',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff101F5A)),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff101F5A)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff101F5A)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      DropdownButton<String>(
                        value: model.priceValue,
                        items: model.priceValues.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        isExpanded: true,
                        hint: const Text(
                          'Select price',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                        onChanged: (value) {
                          model.updatePriceValue(value);
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        controller: model.slController,
                        decoration: const InputDecoration(
                          hintText: 'SL',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff101F5A)),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff101F5A)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff101F5A)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: model.tpController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          hintText: 'TP',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff101F5A)),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff101F5A)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff101F5A)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                model.storeHomeData('BUY', context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff00AEEF),
                                    borderRadius: BorderRadius.circular(16)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 12),
                                  child: Center(
                                    child: Text(
                                      'BUY',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                model.storeHomeData('SELL', context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xffEF0707),
                                    borderRadius: BorderRadius.circular(16)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 12),
                                  child: Center(
                                    child: Text(
                                      'SELL',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
