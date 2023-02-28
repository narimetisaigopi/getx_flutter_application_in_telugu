import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/state_management/controllers/data_controller.dart';
import 'package:flutter_application_1/state_management/controllers/getx_data_controller.dart';
import 'package:flutter_application_1/state_management/controllers/network_data_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class StateManageScreen extends StatefulWidget {
  const StateManageScreen({super.key});

  @override
  State<StateManageScreen> createState() => _StateManageScreenState();
}

class _StateManageScreenState extends State<StateManageScreen> {
  DataController dataController = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Management"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text(
                "Obx Current Count : ${dataController.count}",
                style: Theme.of(context).textTheme.headline4,
              )),
          SizedBox(
            height: 100,
          ),
          GetX(
              init: GetxDataController(),
              builder: (controller) => Column(
                    children: [
                      Text(
                        "Getx Name is ${controller.name}",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: "Enter Name"),
                        onChanged: (str) {
                          controller.name.value = str;
                        },
                      ),
                    ],
                  )),
          Text(
            "Data Count is ${Get.put(NetworkDataController()).dataList.length}",
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dataController.increment();
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
