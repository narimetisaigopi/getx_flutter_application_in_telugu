import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetUtilsScreen extends StatefulWidget {
  const GetUtilsScreen({super.key});

  @override
  State<GetUtilsScreen> createState() => _GetUtilsScreenState();
}

class _GetUtilsScreenState extends State<GetUtilsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Utils"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: Get.width,
              child: ElevatedButton(
                  onPressed: () {
                    Get.showSnackbar(const GetSnackBar(
                      title: "Hello",
                      backgroundColor: Colors.red,
                      titleText: Text("Hello 2"),
                      messageText: Text("Hello welcome to Getx World"),
                      duration: Duration(seconds: 1),
                    ));
                  },
                  child: const Text("Show Snakbar")),
            ),
            SizedBox(
              width: Get.width,
              child: ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: "Logout",
                        middleText: "I am middle Text",
                        // content: Text("Do u want to logout"),
                        cancel: const Text("Cancel"),
                        onCancel: () {
                          Get.back();
                          // navigator.pop(context);
                        },
                        confirm: const Text("Confirm"));
                  },
                  child: const Text("Show Dialog")),
            ),
            SizedBox(
              width: Get.width,
              child: ElevatedButton(
                  onPressed: () {
                    Get.bottomSheet(
                        Container(
                          //height: MediaQuery.of(context).size.height * 0.6,
                          height: Get.height * 0.4,
                          color: Colors.white,
                          child: const Text("data"),
                        ),
                        isDismissible: false,
                        enableDrag: false,
                        backgroundColor: Colors.green);
                  },
                  child: const Text("Show Bottom Sheet")),
            ),
          ],
        ),
      ),
    );
  }
}
