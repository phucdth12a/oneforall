import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/constant/constant.dart';
import 'add_job_view_model.dart';

class AddJobScreen extends GetView<AddJobViewModel> {
  const AddJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddJobViewModel());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Create Job',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: VStack([
          'Title'.text.size(16).make(),
          TextField(
            controller: controller.titleTextEditingController,
            minLines: 1,
            maxLines: 100,
            maxLength: 256,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Input title....',
            ),
          ),
          Container(height: 1, color: Colors.black87.withOpacity(0.2)).py(10),
          'Content'.text.size(16).make(),
          TextField(
            controller: controller.contentTextEditingController,
            minLines: 1,
            maxLines: 100,
            maxLength: 2000,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Input content....',
            ),
          ),
          Container(height: 1, color: Colors.black87.withOpacity(0.2)).py(10),
          'Location'.text.size(16).make(),
          TextField(
            controller: controller.locationTextEditingController,
            minLines: 1,
            maxLines: 100,
            maxLength: 100,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Input location....',
            ),
          ),
          Container(height: 1, color: Colors.black87.withOpacity(0.2)).py(10),
          'Salary'.text.size(16).make(),
          TextField(
            controller: controller.salaryTextEditingController,
            minLines: 1,
            maxLines: 100,
            maxLength: 100,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Input slary....',
            ),
          ),
          Container(height: 1, color: Colors.black87.withOpacity(0.2)).py(10),
          HStack([
            'Tags'.text.size(16).make(),
            const Spacer(),
            TextButton(
                onPressed: () => controller.addTag(),
                child: Container(
                  width: 100,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child:
                      'Add'.text.color(Colors.white).size(16).make().centered(),
                )),
          ]),
          TextField(
            controller: controller.tagTextEditingController,
            minLines: 1,
            maxLines: 100,
            maxLength: 100,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Input Tag....',
            ),
          ),
          const HeightBox(16),
          SizedBox(
            height: 44,
            child: Obx(
              () => ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: controller.listTagSelected.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Vx.hexToColor('#007AFF').withOpacity(0.3),
                    ),
                    child: HStack([
                      (controller.listTagSelected[index])
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
                  ).pOnly(right: 16).onTap(() {
                    controller.listTags.add(controller.listTagSelected[index]);
                    controller.listTagSelected.removeAt(index);
                  });
                },
              ),
            ),
          ),
          const HeightBox(16),
          SizedBox(
            height: 44,
            child: Obx(
              () => ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: controller.listTags.length,
                itemBuilder: (context, index) {
                  return Container(
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
                  ).pOnly(right: 16).onTap(() {
                    controller.listTagSelected.add(controller.listTags[index]);
                    controller.listTags.removeAt(index);
                  });
                },
              ),
            ),
          ),
          const HeightBox(20),
          TextButton(
            onPressed: () => controller.addJob(context),
            child: Container(
              width: Get.mediaQuery.size.width,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.blue,
              ),
              child: 'Save'.text.color(Colors.white).size(20).make().centered(),
            ),
          ),
          const HeightBox(100),
        ]).p20(),
      ),
    );
  }
}
