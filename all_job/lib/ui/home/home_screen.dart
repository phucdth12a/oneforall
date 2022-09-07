import 'package:all_job/utils/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/routes/routes.dart';
import '../../utils/view/avatar_view.dart';
import '../../utils/view/sliver_refresh_indicator.dart';
import 'home_view_model.dart';
import 'job_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final controller = HomeViewModel();
  final tag = 'HomeScreen';

  @override
  void initState() {
    Get.put(controller, tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<HomeViewModel>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: HStack([
          const AvatarView(
            size: 42,
            url:
                'https://images.unsplash.com/photo-1519865885898-a54a6f2c7eea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=758&q=80',
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
            'Developers'
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
                onChanged: (value) {
                  controller.debouncer.call(() {
                    controller.getListJob(value, false);
                  });
                },
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
        const HeightBox(16),
        SizedBox(
          height: 44,
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(right: 16),
              itemCount: controller.listTags.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => controller.listTagsSelected
                          .contains(controller.listTags[index])
                      ? Container(
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Vx.hexToColor('#007AFF').withOpacity(0.3),
                          ),
                          child: HStack([
                            (controller.listTags[index])
                                .text
                                .fontFamily(kFontSFProText)
                                .size(12)
                                .make(),
                            const WidthBox(8),
                            const Icon(
                              Icons.close,
                              size: 16,
                              color: Colors.black,
                            )
                          ]).centered().px(16),
                        ).pOnly(left: 16).onTap(() {
                          controller.listTagsSelected.removeWhere((element) =>
                              element == controller.listTags[index]);
                          controller.getListJob(controller.currentSearch, true);
                        })
                      : Container(
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 1,
                              color: Vx.hexToColor('#3C3C43').withOpacity(0.29),
                            ),
                          ),
                          child: (controller.listTags[index])
                              .text
                              .fontFamily(kFontSFProText)
                              .size(12)
                              .color(Vx.hexToColor('#3C3C43').withOpacity(0.6))
                              .make()
                              .centered()
                              .px(16),
                        ).pOnly(left: 16).onTap(() {
                          controller.listTagsSelected
                              .addAll([controller.listTags[index]]);
                          print(
                              "controller.listTagsSelected ${controller.listTagsSelected.length}");
                          controller.getListJob(controller.currentSearch, true);
                        }),
                );
              },
            ),
          ),
        ),
        const HeightBox(10),
        Expanded(
          child: CustomScrollView(
              controller: controller.scrollController,
              physics: const RefreshScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                CupertinoSliverRefreshControl(
                    builder: Theme.of(context).platform == TargetPlatform.iOS
                        ? buildAppleRefreshIndicator
                        : buildAndroidRefreshIndicator,
                    onRefresh: controller.onRefresh),
                VStack([
                  HStack([
                    'Recommended for you'
                        .text
                        .fontFamily(kFontSFProText)
                        .fontWeight(FontWeight.w600)
                        .make(),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: 'See all'
                          .text
                          .fontFamily(kFontSFProText)
                          .fontWeight(FontWeight.w600)
                          .make(),
                    ),
                  ]).pOnly(left: 16, right: 6),
                  SizedBox(
                    height: 221,
                    child: Obx(
                      () => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(right: 16),
                        itemCount: controller.listRecomendJob.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 140,
                            height: 221,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Vx.randomColor.withOpacity(0.08),
                            ),
                            child: VStack([
                              AvatarView(
                                size: 53,
                                url:
                                    controller.listRecomendJob[index].avt ?? '',
                              ),
                              Text(
                                (controller.listRecomendJob[index].title ?? ''),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontFamily: kFontSFProDisplay,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                ),
                              ).pOnly(top: 8),
                              Text(
                                controller.listRecomendJob[index].description ??
                                    '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontFamily: kFontSFProDisplay,
                                  fontSize: 15,
                                  height: 1.5,
                                ),
                              ).pOnly(top: 4),
                              Text(
                                (controller.listRecomendJob[index].tags ?? [])
                                    .join(', '),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: kFontSFProText,
                                  fontSize: 15,
                                  color:
                                      Vx.hexToColor('#3C3C43').withOpacity(0.6),
                                  height: 1.5,
                                ),
                              ).pOnly(top: 4),
                              const Spacer(),
                              HStack([
                                controller.listRecomendJob[index]
                                    .getDate()
                                    .text
                                    .fontFamily(kFontSFProText)
                                    .color(Vx.hexToColor('#3C3C43')
                                        .withOpacity(0.6))
                                    .size(11)
                                    .make(),
                                const Spacer(),
                                Image.asset(
                                  'assets/images/Linkedin.png',
                                  width: 48,
                                  height: 12,
                                  fit: BoxFit.cover,
                                ),
                              ])
                            ]).p8(),
                          ).pOnly(left: 16).onTap(() => Get.toNamed(
                              Routes.detail,
                              arguments: controller.listRecomendJob[index]));
                        },
                      ),
                    ),
                  ),
                  const HeightBox(20),
                  HStack([
                    'What’s new'
                        .text
                        .fontFamily(kFontSFProText)
                        .fontWeight(FontWeight.w600)
                        .make(),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: 'See all'
                          .text
                          .fontFamily(kFontSFProText)
                          .fontWeight(FontWeight.w600)
                          .make(),
                    ),
                  ]).pOnly(left: 16, right: 6),
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.listJob.length,
                      itemBuilder: (context, index) {
                        return JobItem(job: controller.listJob[index]);
                      },
                    ),
                  )
                ]).sliverBoxAdapter(),
              ]),
        ),
      ]),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            right: 16, bottom: Get.mediaQuery.viewPadding.bottom + 60),
        child: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.createJob),
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add, size: 44),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
