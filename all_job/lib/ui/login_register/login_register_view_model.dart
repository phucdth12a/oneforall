import 'dart:convert';

import 'package:all_job/utils/api/user_api.dart';
import 'package:all_job/utils/model/api_response_object.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/alert/alert.dart';

class LoginRegisterViewModel extends GetxController {
  var segmentIndex = 0.obs;

  final registerEmailTextEditingController = TextEditingController();
  final registerEmailFocusNode = FocusNode();

  final registerPasswordTextEditingController = TextEditingController();
  final registerPasswordFocusNode = FocusNode();
  var isShowRegisterPassword = false.obs;

  final registerRePasswordTextEditingController = TextEditingController();
  final registerRePasswordFocusNode = FocusNode();
  var isShowReRegisterPassword = false.obs;

  final loginEmailTextEditingController = TextEditingController();
  final loginEmailFocusNode = FocusNode();

  final loginPasswordTextEditingController = TextEditingController();
  final loginPasswordFocusNode = FocusNode();
  var isShowLoginPassword = false.obs;

  @override
  void onClose() {
    registerEmailTextEditingController.dispose();
    registerEmailFocusNode.dispose();

    registerPasswordTextEditingController.dispose();
    registerPasswordFocusNode.dispose();

    registerRePasswordTextEditingController.dispose();
    registerRePasswordFocusNode.dispose();

    loginEmailTextEditingController.dispose();
    loginEmailFocusNode.dispose();

    loginPasswordTextEditingController.dispose();
    loginPasswordFocusNode.dispose();

    super.onClose();
  }

  registerAction(BuildContext context) async {
    String email = registerEmailTextEditingController.text;
    String password = registerPasswordTextEditingController.text;
    String repassword = registerRePasswordTextEditingController.text;
    if (!email.isEmail) {
      Alert.showAlert(
        context: context,
        title: 'Error',
        content: 'Please input email',
      );
      return;
    }
    if (password.isEmpty) {
      Alert.showAlert(
        context: context,
        title: 'Error',
        content: 'Please input password',
      );
      return;
    }
    if (password != repassword) {
      Alert.showAlert(
        context: context,
        title: 'Error',
        content: 'Pasword and Re Password not correct',
      );
      return;
    }

    var byte = utf8.encode(password);
    APIResponseObject<int> result = await UserAPI.instance
        .registerUser(email: email, password: sha256.convert(byte).toString());
  }

  loginAction(BuildContext context) async {
    String email = loginEmailTextEditingController.text;
    String password = loginPasswordTextEditingController.text;
    if (!email.isEmail) {
      Alert.showAlert(
        context: context,
        title: 'Error',
        content: 'Please input email',
      );
      return;
    }
    if (password.isEmpty) {
      Alert.showAlert(
        context: context,
        title: 'Error',
        content: 'Please input password',
      );
      return;
    }
    var byte = utf8.encode(password);
    APIResponseObject<int> result = await UserAPI.instance
        .loginUser(email: email, password: sha256.convert(byte).toString());
  }
}
