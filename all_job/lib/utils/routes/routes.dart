import 'package:get/get.dart';

import '../../ui/onboarding/onboarding_screen.dart';

class Routes {
  static const String home = '/';
  static const String onboarding = '/onboarding';

  static List<GetPage<dynamic>> getPages = [
    GetPage(name: onboarding, page: () => const OnboardingScreen())
  ];
}
