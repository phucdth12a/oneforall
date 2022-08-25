import 'package:all_job/utils/constant/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_view_model.dart';

class HomeScreen extends GetView<HomeViewModel> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeViewModel());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: HStack([
          ClipOval(
            child: CachedNetworkImage(
              imageUrl:
                  'https://images.unsplash.com/photo-1519865885898-a54a6f2c7eea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=758&q=80',
              fit: BoxFit.fill,
              width: 42,
              height: 42,
            ),
          ),
          const WidthBox(9),
          VStack([
            'Hello'
                .text
                .fontFamily(kFontSFProText)
                .fontWeight(FontWeight.w600)
                .size(13)
                .color(Colors.black)
                .make(),
            'Guillem B.'
                .text
                .fontWeight(FontWeight.w700)
                .size(22)
                .color(Colors.black)
                .make(),
          ]),
        ]),
        actions: [
          ZStack([
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.black,
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Vx.hexToColor('#007AFF'),
                ),
              ),
            )
          ])
        ],
      ),
      body: VStack([
        const HeightBox(16),
        Container(
          height: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Vx.hexToColor('#767680').withOpacity(0.12),
          ),
          child: HStack([
            const WidthBox(8),
            Icon(
              Icons.search,
              size: 20,
              color: Vx.hexToColor('#3C3C43').withOpacity(0.6),
            ),
            Expanded(
              child: TextField(
                textAlign: TextAlign.left,
                controller: controller.searchController,
                maxLines: 1,
                onChanged: (value) {},
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: 'Position, location or keywords',
                  contentPadding: EdgeInsets.fromLTRB(6, 0, 6, 12),
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 17,
                  fontFamily: kFontSFProText,
                  color: Colors.black,
                ),
                autocorrect: false,
                enableSuggestions: false,
              ),
            ),
          ]),
        ).px(16),
      ]),
    );
  }
}
