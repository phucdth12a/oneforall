import 'package:all_job/utils/routes/routes.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'root_view_model.dart';

class RootScreen extends GetView<RootViewModel> {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RootViewModel());
    double paddingH = (Get.mediaQuery.size.width - 268) / 2;
    return Obx(
      () => Scaffold(
        extendBody: true,
        body: PageView(
          controller: controller.pageController,
          onPageChanged: (index) {},
          physics: const NeverScrollableScrollPhysics(),
          children: controller.screens,
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              bottom: Get.mediaQuery.viewPadding.bottom > 0 ? 0 : 10),
          child: DotNavigationBar(
            margin: const EdgeInsets.only(left: 26, right: 16),
            marginR: EdgeInsets.symmetric(horizontal: paddingH, vertical: 0),
            itemPadding: const EdgeInsets.fromLTRB(16, 6, 16, 10),
            currentIndex: 0,
            dotIndicatorColor: Colors.transparent,
            unselectedItemColor: Vx.hexToColor('#787880'),
            backgroundColor: Vx.hexToColor('#F6F7FA'),
            onTap: (index) {
              if (index == 2) {
                Get.toNamed(Routes.loginRegister);
              } else {
                controller.selectedIndex.value = index;
                controller.pageController.jumpToPage(index);
              }
            },
            items: [
              DotNavigationBarItem(
                icon: Icon(
                  controller.selectedIndex.value == 0
                      ? Icons.business_center
                      : Icons.business_center_outlined,
                  color: controller.selectedIndex.value == 0
                      ? Vx.hexToColor('#007AFF')
                      : Vx.hexToColor('#787880').withOpacity(0.4),
                ),
                selectedColor: Vx.hexToColor('#007AFF'),
                unselectedColor: Vx.hexToColor('#787880'),
              ),
              DotNavigationBarItem(
                icon: Icon(
                  controller.selectedIndex.value == 1
                      ? Icons.bookmark_rounded
                      : Icons.bookmark_outline_rounded,
                  color: controller.selectedIndex.value == 1
                      ? Vx.hexToColor('#007AFF')
                      : Vx.hexToColor('#787880').withOpacity(0.4),
                ),
                selectedColor: Vx.hexToColor('#007AFF'),
                unselectedColor: Vx.hexToColor('#787880'),
              ),
              // DotNavigationBarItem(
              //   icon: Icon(
              //     controller.selectedIndex.value == 2
              //         ? Icons.area_chart_rounded
              //         : Icons.area_chart_outlined,
              //     color: controller.selectedIndex.value == 2
              //         ? Vx.hexToColor('#007AFF')
              //         : Vx.hexToColor('#787880').withOpacity(0.4),
              //   ),
              //   selectedColor: Vx.hexToColor('#007AFF'),
              //   unselectedColor: Vx.hexToColor('#787880'),
              // ),
              // DotNavigationBarItem(
              //   icon: Icon(
              //     controller.selectedIndex.value == 3
              //         ? Icons.chat_bubble_rounded
              //         : Icons.chat_bubble_outline_rounded,
              //     color: controller.selectedIndex.value == 3
              //         ? Vx.hexToColor('#007AFF')
              //         : Vx.hexToColor('#787880').withOpacity(0.4),
              //   ),
              //   selectedColor: Vx.hexToColor('#007AFF'),
              //   unselectedColor: Vx.hexToColor('#787880'),
              // ),
              DotNavigationBarItem(
                icon: Icon(
                  controller.selectedIndex.value == 2
                      ? Icons.account_circle_rounded
                      : Icons.account_circle_outlined,
                  color: controller.selectedIndex.value == 2
                      ? Vx.hexToColor('#007AFF')
                      : Vx.hexToColor('#787880').withOpacity(0.4),
                ),
                selectedColor: Vx.hexToColor('#007AFF'),
                unselectedColor: Vx.hexToColor('#787880'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
