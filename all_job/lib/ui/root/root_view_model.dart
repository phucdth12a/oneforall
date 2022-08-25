import 'package:get/get.dart';

import '../home/home_screen.dart';

class RootViewModel extends GetxController {
  var selectedIndex = 0.obs;
  final homeScreen = const HomeScreen();

  @override
  void onInit() {
    super.onInit();
  }
}
