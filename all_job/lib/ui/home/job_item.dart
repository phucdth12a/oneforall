import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/constant/constant.dart';
import '../../utils/model/job.dart';
import '../../utils/routes/routes.dart';
import '../../utils/view/avatar_view.dart';

class JobItem extends StatelessWidget {
  const JobItem({Key? key, required this.job}) : super(key: key);

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ZStack([
        VStack([
          Container(
            height: 1,
            decoration: BoxDecoration(
                color: Vx.hexToColor('#3C3C43').withOpacity(0.29),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 0.3),
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: Colors.black.withOpacity(.09),
                  )
                ]),
          ),
          HStack(
            [
              const AvatarView(
                size: 53,
                url:
                    'https://images.unsplash.com/photo-1519865885898-a54a6f2c7eea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=758&q=80',
              ),
              Expanded(
                child: VStack([
                  // (job.title ?? '')
                  // Text(
                  //   job.title ?? '',
                  //   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  // ),
                  (job.title ?? '')
                      .text
                      .fontFamily(kFontSFProText)
                      .fontWeight(FontWeight.w600)
                      .size(17)
                      .lineHeight(1.3)
                      .make()
                      .pOnly(top: 8),
                  (job.description ?? '')
                      .text
                      .fontFamily(kFontSFProText)
                      .size(15)
                      .lineHeight(1.3)
                      .make()
                      .pOnly(top: 4),
                  ((job.tags ?? []).join(', '))
                      .text
                      .fontFamily(kFontSFProText)
                      .size(15)
                      .color(Vx.hexToColor('#3C3C43').withOpacity(0.6))
                      .lineHeight(1.3)
                      .make()
                      .pOnly(top: 4),
                  HStack([
                    (job.getDate())
                        .text
                        .fontFamily(kFontSFProText)
                        .color(Vx.hexToColor('#3C3C43').withOpacity(0.6))
                        .size(11)
                        .make(),
                    const WidthBox(8),
                    Image.asset(
                      'assets/images/Linkedin.png',
                      width: 48,
                      height: 12,
                      fit: BoxFit.cover,
                    ),
                  ]).pOnly(top: 13)
                ]).pOnly(left: 15),
              ),
              const Icon(
                Icons.bookmark_border,
              ),
            ],
            crossAlignment: CrossAxisAlignment.start,
          ).pOnly(top: 10)
        ]).pOnly(bottom: 20),
        Positioned(
          right: 0,
          child: Icon(
            Icons.navigate_next,
            size: 24,
            color: Vx.hexToColor('#3C3C43').withOpacity(0.29),
          ),
        )
      ], alignment: AlignmentDirectional.center),
    ).onTap(() => Get.toNamed(Routes.detail));
  }
}
