import 'package:get/get.dart';

import '../../ui/detail/detail_screen.dart';
import '../../ui/onboarding/onboarding_screen.dart';
import '../../ui/root/root_screen.dart';

class Routes {
  static const String root = '/';
  static const String onboarding = '/onboarding';
  static const String detail = '/detail';

  static List<GetPage<dynamic>> getPages = [
    GetPage(name: root, page: () => const RootScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: detail, page: () => const DetailScreen()),
  ];
}
