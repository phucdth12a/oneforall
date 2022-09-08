import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_view_model.dart';

class ProfileScreen extends GetView<ProfileViewModel> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileViewModel());
    return Container();
  }
}
