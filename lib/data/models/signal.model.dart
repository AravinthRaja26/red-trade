class Signal {
  String? Assetname;
  String? Price;
  String? Signaltype;
  String? Time;
  String? Timeframe;

  Signal(
      {this.Assetname, this.Price, this.Signaltype, this.Time, this.Timeframe});

  factory Signal.fromJson(Map<String, dynamic> json) {
    return Signal(
      Assetname: json['Assetname'],
      Price: json['Price'],
      Signaltype: json['Signaltype'],
      Time: json['Time'],
      Timeframe: json['Timeframe'],
    );
  }
}
