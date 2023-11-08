import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_d_sakshi_2453/Controller/home_controller.dart';
import 'bottom_navigation_bar.dart';
import 'homePage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
            init: HomeController(),
            builder: (HomeController controller) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: IndexedStack(
                  index: controller.index.value,
                  children: const [
                    HomePage(),
                  ],
                ),
              );
            },),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
