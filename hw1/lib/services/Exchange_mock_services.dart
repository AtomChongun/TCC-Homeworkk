import 'dart:convert';
import 'package:hw1/modules/exchangData.dart';
import 'package:hw1/services/Exchange_service_interface.dart';
import 'package:http/http.dart' as http;

class ExchangeMockService implements ExchangeServiceInterface {
  String str = "https://api.bitkub.com/api/market/ticker?sym=";

  @override
  Future<ExchangeData> getExchangeRateData({required String name}) async {
    name = "THB_$name";
    //String url = str + name;
    //var res = await http.get(Uri.parse(url));
    //var data = utf8.decode(res.bodyBytes);
    //print(jsonDecode(data)[name]);
    //ExchangeData? dataFromAPI =
    //exchangeDataFromJson(jsonEncode(jsonDecode(data)[name]));
    return ExchangeData(last: 100);
  }
}
