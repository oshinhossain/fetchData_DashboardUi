import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../models/getDataModel.dart';

class GetDataController extends GetxController {
  var isLoading = false.obs;
  var getDataModel =
      GetDataModel(message: null, people: null, number: null).obs;

  getDataFromApi() async {
    isLoading.value = true;
    try {
      var response = await Dio().get('http://api.open-notify.org/astros.json');
      getDataModel.value = GetDataModel.fromJson(response.data);
      print(response);
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }
}
