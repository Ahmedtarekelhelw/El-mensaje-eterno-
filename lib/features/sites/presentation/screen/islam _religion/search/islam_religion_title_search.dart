import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_religion_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/artical_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/inkwell_custom.dart';

class IslamReligionTitleSearch extends StatelessWidget {
  final int position, positionSub;

  const IslamReligionTitleSearch(
      {super.key, required this.position, required this.positionSub});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Religion").customAppBar(context),
      body: GetBuilder<IslamReligionControllerImp>(
          builder: (controller) => Column(
                children: [
                  SearchFieldWidget(
                    onSubmitted: (val) => {
                      controller.searchFun(
                          val,
                          controller.articals[position].catigory[positionSub]
                              .subCatigory)
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(5),
                        itemCount: controller.searchResult.length,
                        itemBuilder: (context, index) {
                          return InkwellCustom(
                            catigory: false,
                            dataText: controller.searchResult[index].name,
                            onTap: () {
                              Get.to(ArticalCustom(
                                  dataText: controller
                                      .articals[position]
                                      .catigory[positionSub]
                                      .subCatigory[index]
                                      .content));
                            },
                          );
                        }),
                  ),
                ],
              )),
    );
  }
}
