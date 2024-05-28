class HistoryModel {
  String? assetValue;
  String? inputVolume;
  String? price;
  String? sl;
  String? tp;
  String? traderType;
  String? type;
  String? docId;

  HistoryModel(
      {this.assetValue,
      this.inputVolume,
      this.price,
      this.sl,
      this.tp,
      this.type,
      this.docId,
      this.traderType});

  factory HistoryModel.fromJson(Map<String, dynamic> json, String id) {
    return HistoryModel(
      assetValue: json['assetValue'],
      inputVolume: json['inputVolume'],
      price: json['price'] == 'Customer price' ? 'CP' : 'MP',
      sl: json['sl'],
      tp: json['tp'],
      type: json['type'],
      traderType: json['traderType'],
      docId: id,
    );
  }
}
