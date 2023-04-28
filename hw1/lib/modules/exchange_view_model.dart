import 'package:hw1/modules/exchangData.dart';
import 'package:hw1/services/Exchange_mock_services.dart';
import 'package:hw1/services/Exchange_service_interface.dart';
import 'package:hw1/services/Exchange_service.dart';

class ExchangeViewModel {
  ExchangeData _data = ExchangeData();
  ExchangeServiceInterface service = ExchangeService();

  Future<ExchangeData> onService({required String name}) async {
    if (name == "") {
      return ExchangeData(last: 0.0);
    } else {
      _data = await service.getExchangeRateData(name: name.toUpperCase());
      return _data;
    }
  }

  Future<double?> onSetData(
      {required double? price, required double input}) async {
    return price! * input;
  }
}
