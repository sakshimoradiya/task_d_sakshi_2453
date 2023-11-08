import 'package:flutter/material.dart';

import '../componant/color.dart';

snackBar(context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: MyColor.themeColor,
  ));
}