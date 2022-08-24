import 'package:all_job/utils/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'onboarding_view_model.dart';

class OnboardingScreen extends GetView<OnboardingViewModel> {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingViewModel());
    return Scaffold(
      body: PageView(
        controller: controller.controller,
        children: [
          pageOneWiget(),
          Center(
            child: Text('Second Page'),
          ),
          Center(
            child: Text('Third Page'),
          )
        ],
      ),
    );
  }

  Widget pageOneWiget() {
    return SafeArea(
      child: VStack([
        'Skip'
            .text
            .fontFamily(kFontSFProText)
            .size(17)
            .color(kColor60606706)
            .make()
            .pOnly(left: 16, top: 11),
        const HeightBox(25),
        HStack([
          'Job'
              .text
              .fontFamily(kFontSFMono)
              .fontWeight(FontWeight.w900)
              .size(34)
              .color(Colors.black)
              .make(),
          'Now'
              .text
              .fontFamily(kFontSFMono)
              .fontWeight(FontWeight.w900)
              .size(34)
              .color(Vx.hexToColor('#5C6BC0'))
              .make(),
        ]).centered(),
        const HeightBox(25),
        AspectRatio(
          aspectRatio: 1,
          child: Image.asset('assets/images/job1.jpg'),
        ).px(38),
        'Find job offers from the most popular job listing sites'
            .text
            .size(28)
            .color(Colors.black)
            .align(TextAlign.center)
            .make(),
        const HeightBox(30),
        HStack([
          Image.asset(
            'assets/images/indeed.png',
            width: 64,
            height: 18,
          ),
          const WidthBox(16),
          Image.asset(
            'assets/images/Monster.png',
            width: 76,
            height: 13,
          ),
          const WidthBox(16),
          Image.asset(
            'assets/images/Linkedin.png',
            width: 72,
            height: 18,
          ),
        ]).centered(),
        const HeightBox(16),
        HStack([
          Image.asset(
            'assets/images/glassdor.png',
            width: 87,
            height: 17,
          ),
          const WidthBox(16),
          Image.asset(
            'assets/images/AngelList.png',
            width: 85,
            height: 17,
          ),
        ]).centered(),
        const Spacer(),
        HStack([
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Container(
              height: 44,
              width: 123,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Vx.hexToColor('#007AFF'),
              ),
              child: 'Next'
                  .text
                  .fontFamily(kFontSFProText)
                  .size(17)
                  .color(Colors.white)
                  .make()
                  .centered(),
            ),
          )
        ]),
        const HeightBox(10),
      ]),
    );
  }
}
