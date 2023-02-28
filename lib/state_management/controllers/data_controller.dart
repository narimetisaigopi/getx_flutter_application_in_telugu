import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DataController extends GetxController {
  var count = 0.obs;
  RxString name = "".obs;
  var age = RxInt(18);

  increment() => count++;
}
