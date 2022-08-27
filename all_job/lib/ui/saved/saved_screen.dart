import 'package:all_job/ui/saved/saved_view_model.dart';
import 'package:all_job/utils/constant/constant.dart';
import 'package:all_job/utils/model/job.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../home/job_item.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen>
    with AutomaticKeepAliveClientMixin {
  final controller = SavedViewModel();
  final tag = 'HomeScreen';

  @override
  void initState() {
    Get.put(controller, tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<SavedViewModel>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: 'Edit'.text.fontFamily(kFontSFProText).size(17).make(),
          ),
        ],
      ),
      body: VStack([
        'Saved offers'
            .text
            .fontWeight(FontWeight.w700)
            .size(34)
            .make()
            .pOnly(left: 16, bottom: 16),
        Expanded(
          child: ListView.builder(
            itemCount: 40,
            itemBuilder: (context, index) {
              return JobItem(job: JobModel());
            },
          ),
        ),
      ]),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
