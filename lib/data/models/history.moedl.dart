

class HistoryModel {
  String? assetValue;
  String? inputVolume;
  String? price;
  String? sl;
  String? tp;
  String? traderType;
  String? type;

  HistoryModel(
      {this.assetValue, this.inputVolume, this.price, this.sl, this.tp,this.type,this.traderType});

  factory HistoryModel.fromJson(Map<String, dynamic> json) {



    return HistoryModel(
      assetValue: json['assetValue'],
      inputVolume: json['inputVolume'],
      price: json['price'] == 'Customer price' ? 'CP':'MP',
      sl: json['sl'],
      tp: json['tp'],
      type: json['type'],
      traderType: json['traderType'],
    );
  }
}
