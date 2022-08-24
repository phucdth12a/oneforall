import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingViewModel extends GetxController {
  final PageController controller = PageController();

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
