import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.showSnackbar(GetSnackBar(
                  title: "Hello",
                  backgroundColor: Colors.red,
                  titleText: Text("Hello 2"),
                  messageText: Text("Hello welcome to Getx World"),
                  duration: Duration(seconds: 1),
                ));
              },
              child: Text("Show Snakbar")),
          ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                    title: "Logout",
                    middleText: "I am middle Text",
                    // content: Text("Do u want to logout"),
                    cancel: Text("Cancel"),
                    onCancel: () {
                      Get.back();
                      // navigator.pop(context);
                    },
                    confirm: Text("Confirm"));
              },
              child: Text("Show Dialog")),
          ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                    Container(
                      //height: MediaQuery.of(context).size.height * 0.6,
                      height: Get.height * 0.4,
                      child: Text("data"),
                      color: Colors.white,
                    ),
                    isDismissible: false,
                    enableDrag: false,
                    backgroundColor: Colors.green);
              },
              child: Text("Show Bottom Sheet")),
        ],
      ),
    );
  }
}
