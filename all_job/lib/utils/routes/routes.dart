import 'package:get/get.dart';

import '../../ui/onboarding/onboarding_screen.dart';
import '../../ui/root/root_screen.dart';

class Routes {
  static const String root = '/';
  static const String onboarding = '/onboarding';

  static List<GetPage<dynamic>> getPages = [
    GetPage(name: root, page: () => const RootScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen())
  ];
}
