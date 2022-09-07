import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Alert {
  static showAlert({
    required BuildContext context,
    required String title,
    required String content,
    Function? action,
  }) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (action != null) {
                action.call();
              } else {
                Get.back();
              }
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
