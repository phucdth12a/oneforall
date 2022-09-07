import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/constant/constant.dart';
import 'login_register_view_model.dart';

class LoginRegisterScreen extends GetView<LoginRegisterViewModel> {
  const LoginRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginRegisterViewModel());
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: VStack([
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
            const HeightBox(47),
            Obx(
              () => Container(
                width: Get.mediaQuery.size.width - 32,
                height: 32,
                padding: EdgeInsets.zero,
                child: CupertinoSlidingSegmentedControl<int>(
                  backgroundColor: Vx.hexToColor('#767680').withOpacity(0.12),
                  thumbColor: Colors.white,
                  padding: const EdgeInsets.all(2),
                  groupValue: controller.segmentIndex.value,
                  children: {
                    0: Text(
                      'Register',
                      style: TextStyle(
                        fontFamily: kFontSFProText,
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: controller.segmentIndex.value == 0
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                    1: Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: kFontSFProText,
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: controller.segmentIndex.value == 1
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  },
                  onValueChanged: (value) {
                    controller.segmentIndex.value = value!;
                  },
                ),
              ).centered(),
            ),
            const HeightBox(34),
            Obx(
              () => controller.segmentIndex.value == 0
                  ? registerWidget(context)
                  : loginWidget(context),
            ),
          ]),
        ),
      ),
    );
  }

  Widget registerWidget(BuildContext context) {
    return VStack([
      emailWidget(
        textEditingController: controller.registerEmailTextEditingController,
        focusNode: controller.registerEmailFocusNode,
        hintText: 'Email',
        textInputAction: TextInputAction.next,
        submitAction: (value) {
          print("value $value");
          controller.registerPasswordFocusNode.requestFocus();
        },
      ),
      const HeightBox(10),
      paswordWidget(
        textEditingController: controller.registerPasswordTextEditingController,
        focusNode: controller.registerPasswordFocusNode,
        isShow: controller.isShowRegisterPassword.value,
        hintText: 'Password',
        textInputAction: TextInputAction.next,
        submitAction: (value) {
          controller.registerRePasswordFocusNode.requestFocus();
        },
        changeShow: (value) {
          controller.isShowRegisterPassword.value = value;
        },
      ),
      const HeightBox(10),
      paswordWidget(
        textEditingController:
            controller.registerRePasswordTextEditingController,
        focusNode: controller.registerRePasswordFocusNode,
        isShow: controller.isShowReRegisterPassword.value,
        hintText: 'Re Password',
        textInputAction: TextInputAction.send,
        submitAction: (value) {},
        changeShow: (value) {
          controller.isShowReRegisterPassword.value = value;
        },
      ),
      const HeightBox(32),
      Container(
        height: 44,
        width: Get.mediaQuery.size.width - 40,
        decoration: BoxDecoration(
          color: Vx.hexToColor('#007AFF'),
          borderRadius: BorderRadius.circular(8),
        ),
        child: 'Sign Up'
            .text
            .fontFamily(kFontSFProText)
            .size(17)
            .color(Colors.white)
            .make()
            .centered(),
      ).onTap(() => controller.registerAction(context)),
      const HeightBox(32),
      HStack([
        'By signing up, you  accept our'
            .text
            .fontFamily(kFontSFProText)
            .size(17)
            .make(),
        ' conditions '
            .text
            .fontFamily(kFontSFProText)
            .size(17)
            .color(Vx.hexToColor('#007AFF'))
            .make()
            .onTap(() {
          print("conditions");
        }),
      ]),
      const HeightBox(16),
      HStack([
        'Have an account?'.text.fontFamily(kFontSFProText).size(17).make(),
        ' Login   '
            .text
            .fontFamily(kFontSFProText)
            .size(17)
            .color(Vx.hexToColor('#007AFF'))
            .make()
            .onTap(() {
          controller.segmentIndex.value = 1;
        }),
      ]),
    ]).px(20);
  }

  Widget loginWidget(BuildContext context) {
    return VStack([
      emailWidget(
        textEditingController: controller.loginEmailTextEditingController,
        focusNode: controller.loginEmailFocusNode,
        hintText: 'Email',
        textInputAction: TextInputAction.next,
        submitAction: (value) {
          controller.loginPasswordFocusNode.requestFocus();
        },
      ),
      const HeightBox(10),
      paswordWidget(
        textEditingController: controller.loginPasswordTextEditingController,
        focusNode: controller.loginPasswordFocusNode,
        isShow: controller.isShowLoginPassword.value,
        hintText: 'Password',
        textInputAction: TextInputAction.send,
        submitAction: (value) {
          controller.loginAction(context);
        },
        changeShow: (value) {
          controller.isShowLoginPassword.value = value;
        },
      ),
      const HeightBox(32),
      Container(
        height: 44,
        width: Get.mediaQuery.size.width - 40,
        decoration: BoxDecoration(
          color: Vx.hexToColor('#007AFF'),
          borderRadius: BorderRadius.circular(8),
        ),
        child: 'Sign In'
            .text
            .fontFamily(kFontSFProText)
            .size(17)
            .color(Colors.white)
            .make()
            .centered(),
      ).onTap(() => controller.loginAction(context)),
      const HeightBox(32),
      HStack([
        'Forgot password?'.text.fontFamily(kFontSFProText).size(17).make(),
        ' Remember   '
            .text
            .fontFamily(kFontSFProText)
            .size(17)
            .color(Vx.hexToColor('#007AFF'))
            .make()
            .onTap(() {
          print("conditions");
        }),
      ]),
      const HeightBox(16),
      HStack([
        'Don’t have an account?'
            .text
            .fontFamily(kFontSFProText)
            .size(17)
            .make(),
        ' Register   '
            .text
            .fontFamily(kFontSFProText)
            .size(17)
            .color(Vx.hexToColor('#007AFF'))
            .make()
            .onTap(() {
          controller.segmentIndex.value = 0;
        }),
      ]),
    ]).px(20);
  }

  Widget emailWidget({
    required TextEditingController textEditingController,
    required FocusNode focusNode,
    required String hintText,
    required TextInputAction textInputAction,
    required Function(String) submitAction,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Vx.hexToColor('#F2F2F7'),
      ),
      child: TextField(
        textAlign: TextAlign.left,
        controller: textEditingController,
        focusNode: focusNode,
        textInputAction: textInputAction,
        keyboardType: TextInputType.emailAddress,
        onSubmitted: (value) {
          submitAction(value);
        },
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 17,
            color: Vx.hexToColor('#3C3C43').withOpacity(0.3),
            fontFamily: kFontSFProText,
          ),
        ),
        style: const TextStyle(
          fontSize: 17,
          color: Colors.black,
          fontFamily: kFontSFProText,
        ),
        autocorrect: false,
        enableSuggestions: false,
        maxLines: 1,
      ),
    );
  }

  Widget paswordWidget({
    required TextEditingController textEditingController,
    required FocusNode focusNode,
    required bool isShow,
    required String hintText,
    required TextInputAction textInputAction,
    required Function(String) submitAction,
    required Function(bool) changeShow,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Vx.hexToColor('#F2F2F7'),
      ),
      child: HStack([
        Expanded(
          child: TextField(
            textAlign: TextAlign.left,
            controller: textEditingController,
            focusNode: focusNode,
            textInputAction: textInputAction,
            onSubmitted: (value) {
              submitAction(value);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 17,
                color: Vx.hexToColor('#3C3C43').withOpacity(0.3),
                fontFamily: kFontSFProText,
              ),
            ),
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontFamily: kFontSFProText,
            ),
            obscureText: !isShow,
            autocorrect: false,
            enableSuggestions: false,
            maxLines: 1,
          ),
        ),
        SizedBox(
          width: 60,
          height: 44,
          child: Image.asset(
            isShow ? 'assets/images/hide.png' : 'assets/images/view.png',
            color: Vx.hexToColor('#3C3C43').withOpacity(0.3),
            width: 24,
            height: 24,
          ).centered(),
        ).onTap(() => changeShow(!isShow)),
      ]),
    );
  }
}
