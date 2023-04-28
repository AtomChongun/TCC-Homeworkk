// ignore: file_names
import 'dart:convert';

ExchangeData exchangeDataFromJson(String str) =>
    ExchangeData.fromJson(json.decode(str));

String exchangeDataToJson(ExchangeData data) => json.encode(data.toJson());

class ExchangeData {
  ExchangeData({this.id, this.last, n});

  int? id;
  double? last;
  factory ExchangeData.fromJson(Map<String, dynamic> json) => ExchangeData(
        id: json["id"],
        last: json["last"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "last": last,
      };
}
