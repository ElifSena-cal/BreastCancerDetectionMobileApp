import 'package:breast_cancer/features/data/service/data_api_service.dart';
import 'package:mobx/mobx.dart';

import '../model/data.dart';

part 'data_view_model.g.dart';

class DataViewModel = _DataViewModelBase with _$DataViewModel;

abstract class _DataViewModelBase with Store {
  final DataApiService apiService =
      DataApiService(baseUrl: 'http://127.0.0.1:5000');

  @observable
  Data? data;

  @action
  Future<String> predict(Map<String, double> data) async {
    try {
      final prediction = await apiService.predict(data);
      print(prediction);
      return prediction;
    } catch (e) {
      return "Hata: $e";
    }
  }
}
