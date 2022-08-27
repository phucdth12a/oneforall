import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_screen.dart';
import '../saved/saved_screen.dart';

class RootViewModel extends GetxController {
  var selectedIndex = 0.obs;

  final pageController = PageController();
  List<Widget> screens = [
    const HomeScreen(),
    const SavedScreen(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
