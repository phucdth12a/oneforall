import 'package:all_job/ui/onboarding/onboarding_screen.dart';
import 'package:all_job/utils/routes/routes.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'root_view_model.dart';

class RoootScreen extends GetView<RootViewModel> {
  const RoootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RootViewModel());
    return Scaffold(
      extendBody: true,
      body: Container(
        color: Colors.red,
      ),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: DotNavigationBar(
            margin: EdgeInsets.only(left: 26, right: 16),
            marginR: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            itemPadding: EdgeInsets.fromLTRB(16, 6, 16, 10),
            currentIndex: 0,
            dotIndicatorColor: Colors.transparent,
            unselectedItemColor: Colors.grey[300],
            backgroundColor: Vx.hexToColor('#F6F7FA'),
            onTap: (index) {
              controller.selectedIndex.value = index;
            },
            items: [
              /// Home
              DotNavigationBarItem(
                icon: SvgPicture.asset(
                  controller.selectedIndex.value == 0
                      ? 'assets/icons/books.fill.svg'
                      : 'assets/icons/books.svg',
                  width: 26,
                  height: 26,
                  color: controller.selectedIndex.value == 0
                      ? Vx.hexToColor('#007AFF')
                      : Vx.hexToColor('#787880'),
                ).centered(),
                selectedColor: Vx.hexToColor('#007AFF'),
              ),

              /// Likes
              DotNavigationBarItem(
                icon: SvgPicture.asset(
                  controller.selectedIndex.value == 1
                      ? 'assets/icons/bookmark.fill.svg'
                      : 'assets/icons/bookmark.svg',
                  width: 26,
                  height: 26,
                  color: controller.selectedIndex.value == 1
                      ? Vx.hexToColor('#007AFF')
                      : Vx.hexToColor('#787880'),
                ).centered(),
                selectedColor: Vx.hexToColor('#007AFF'),
              ),

              /// Search
              DotNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/chart.svg',
                  width: 26,
                  height: 26,
                  color: controller.selectedIndex.value == 2
                      ? Vx.hexToColor('#007AFF')
                      : Vx.hexToColor('#787880'),
                ).centered(),
                selectedColor: Vx.hexToColor('#007AFF'),
              ),

              /// Profile
              DotNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/chat.svg',
                  width: 26,
                  height: 26,
                  color: controller.selectedIndex.value == 3
                      ? Vx.hexToColor('#007AFF')
                      : Vx.hexToColor('#787880'),
                ).centered(),
                selectedColor: Vx.hexToColor('#007AFF'),
              ),

              /// Profile
              DotNavigationBarItem(
                icon: SvgPicture.asset(
                  controller.selectedIndex.value == 4
                      ? 'assets/icons/person.fill.svg'
                      : 'assets/icons/person.svg',
                  width: 26,
                  height: 26,
                  color: controller.selectedIndex.value == 4
                      ? Vx.hexToColor('#007AFF')
                      : Vx.hexToColor('#787880'),
                ).centered(),
                selectedColor: Vx.hexToColor('#007AFF'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
