import 'package:flutter/material.dart';
import 'package:flutter_application_1/form_validation_screen.dart';
import 'package:flutter_application_1/get_utils_screen.dart';
import 'package:flutter_application_1/navigation_screen.dart';
import 'package:flutter_application_1/state_management/my_posts_list_screen.dart';
import 'package:get/get.dart';

import 'state_management/state_manage_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Get Home Screen",
        ),
        actions: [
          IconButton(
              onPressed: () {
                GetUtils.isEmail("s");
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
              icon: Icon(Get.isDarkMode ? Icons.light_mode : Icons.dark_mode))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: Get.width,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const GetUtilsScreen()));
                  },
                  child: const Text("Utils")),
            ),
            SizedBox(
              width: Get.width,
              child: ElevatedButton(
                  onPressed: () {
                    //Navigator.push(context,MaterialPageRoute( builder: (builder) => const Formvalidation()));
                    Get.to(const Formvalidation());
                  },
                  child: const Text("Form Validation")),
            ),
            SizedBox(
              width: Get.width,
              child: ElevatedButton(
                  onPressed: () async {
                    var data = await Get.to(NavigationScreen.routeName,
                        arguments: ["Hello world", 12.3, true, 143]);
                    print(data ?? "No data");
                  },
                  child: const Text("Getx Navigation")),
            ),
            SizedBox(
              width: Get.width,
              child: ElevatedButton(
                  onPressed: () async {
                    Get.to(StateManageScreen());
                  },
                  child:
                      const Text("Getx Reactive State management (ObX/GetX)")),
            ),
            SizedBox(
              width: Get.width,
              child: ElevatedButton(
                  onPressed: () async {
                    Get.to(MyPostsListScreen());
                  },
                  child: const Text("Getx State GetBuilder")),
            )
          ],
        ),
      ),
    );
  }
}
