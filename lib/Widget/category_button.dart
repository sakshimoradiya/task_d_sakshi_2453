import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/home_controller.dart';
import '../componant/color.dart';

Widget categoryButton({required String title}) {
  return Obx(() => Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    margin: const EdgeInsets.symmetric(horizontal: 2),
    decoration: BoxDecoration(
        // ignore: unrelated_type_equality_checks
        color: (HomeController.homeController.category == title) ? MyColor.grey.withOpacity(0.2) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
    ),
    child: Text(title,
      style: TextStyle(
        fontSize: 16,
        // ignore: unrelated_type_equality_checks
        color: (HomeController.homeController.category == title) ? MyColor.themeColor : MyColor.black.withOpacity(0.6)
      ),
    ),
  ));
}