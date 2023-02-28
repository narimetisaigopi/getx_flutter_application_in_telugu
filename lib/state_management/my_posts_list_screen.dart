import 'package:flutter/material.dart';
import 'package:flutter_application_1/state_management/controllers/network_data_controller.dart';
import 'package:get/get.dart';

class MyPostsListScreen extends StatefulWidget {
  const MyPostsListScreen({super.key});

  @override
  State<MyPostsListScreen> createState() => _MyPostsListScreenState();
}

class _MyPostsListScreenState extends State<MyPostsListScreen> {
  NetworkDataController networkDataController =
      Get.put(NetworkDataController());

  @override
  void initState() {
    networkDataController.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data List Screen"),
      ),
      body: GetBuilder<NetworkDataController>(builder: (controller) {
        return controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : networkDataController.dataList.isEmpty
                ? Center(child: Text("No Data"))
                : ListView.builder(
                    itemCount: networkDataController.dataList.length,
                    itemBuilder: (ctx, index) {
                      return Text(
                          "${networkDataController.dataList[index].title ?? ""}");
                    });
      }),
    );
  }
}
