import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/human_rights_controller.dart';
import '../widget/app_bar_custom.dart';
import '../widget/artical_custom.dart';
import '../widget/inkwell_custom.dart';

class HumanRightsScreen extends StatelessWidget {
  const HumanRightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HumanRightsControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: 'Human Rights').customAppBar(context),
      body: GetBuilder<HumanRightsControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.articals.length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.articals[index].name.trim(),
                      onTap: () {
                        Get.to(() => ArticalCustom(
                            dataText: controller.articals[index].content));
                      },
                    );
                  }))),
    );
  }
}
