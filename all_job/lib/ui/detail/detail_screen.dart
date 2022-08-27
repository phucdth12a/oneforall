import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/view/avatar_view.dart';
import 'detail_view_model.dart';

class DetailScreen extends GetView<DetailViewModel> {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DetailViewModel());
    return Scaffold(
      body: SingleChildScrollView(
        child: VStack([
          SizedBox(
            height: 313,
            width: Get.mediaQuery.size.width,
            child: ZStack([
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1525431836161-e40d6846e656?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c3BsYXNofGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.55)
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 16,
                bottom: 19,
                child: HStack([
                  const AvatarView(
                    size: 66,
                    url:
                        'https://images.unsplash.com/photo-1519865885898-a54a6f2c7eea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=758&q=80',
                  ),
                  VStack([
                    'UX Designer'
                        .text
                        .fontWeight(FontWeight.w700)
                        .size(28)
                        .color(Colors.white)
                        .make()
                        .pOnly(bottom: 4),
                    'Amazon'
                        .text
                        .fontWeight(FontWeight.w700)
                        .size(22)
                        .color(Colors.white)
                        .make(),
                  ]).pOnly(left: 16)
                ]),
              ),
              const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )
                  .pOnly(
                    left: 16,
                    top: Get.mediaQuery.viewPadding.top < 46
                        ? Get.mediaQuery.viewPadding.top + 8
                        : Get.mediaQuery.viewPadding.top,
                  )
                  .onTap(() => Get.back()),
            ]),
          ),
          HStack([
            'Seattle, US (Remote)'
                .text
                .fontWeight(FontWeight.w700)
                .size(22)
                .make(),
            const Spacer(),
            const Icon(
              Icons.bookmark_outlined,
            ),
          ]).pOnly(left: 16, top: 20, right: 16),
          'Published 9h ago on: '.text.make().pOnly(left: 16, top: 17),
          Image.asset(
            'assets/images/Linkedin.png',
            width: 77,
            height: 19,
            fit: BoxFit.cover,
          ).pOnly(left: 16, top: 8),
          'About us'
              .text
              .fontWeight(FontWeight.w700)
              .size(22)
              .make()
              .pOnly(left: 16, top: 50),
          'What unites all Amazonians across teams and regions is that we are all striving to delight customers and make their lives easier. Our mission drives us to seek diverse perspectives.'
              .text
              .size(15)
              .lineHeight(1.3)
              .make()
              .pOnly(left: 16, top: 16, right: 16),
          SizedBox(
            height: 180,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(right: 16),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: Get.mediaQuery.size.width - 54,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://images.unsplash.com/photo-1533167649158-6d508895b680?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3BsYXNofGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                      fit: BoxFit.cover,
                    ).cornerRadius(8),
                  ).pOnly(left: 16);
                }),
          ).pOnly(top: 16),
          'What unites all Amazonians across teams and regions is that we are all striving to delight customers and make their lives easier. Our mission drives us to seek diverse perspectives.'
              .text
              .size(15)
              .lineHeight(1.3)
              .make()
              .pOnly(left: 16, top: 16, right: 16),
          const HeightBox(80),
        ]),
      ),
    );
  }
}
