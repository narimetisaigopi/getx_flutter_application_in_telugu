import 'dart:convert';

import 'package:flutter_application_1/models/data_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:http/http.dart' as client;

class NetworkDataController extends GetxController {
  List<DataModel> dataList = [];
  bool isLoading = false;

  @override
  void onInit() async {
    super.onInit();
    getData();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  onClose() {
    super.onInit();
  }

  getData() async {
    isLoading = true;
    update();
    client.Response data = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    dataList = (jsonDecode(data.body) as List)
        .map((e) => DataModel.fromJson(e))
        .toList();
    isLoading = false;
    update();
  }
}
