import 'package:hw1/modules/exchangData.dart';

abstract class ExchangeServiceInterface {
  Future<ExchangeData> getExchangeRateData({required String name});
}
