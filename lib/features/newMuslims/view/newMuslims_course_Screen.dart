import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/newMuslims/controller/newMuslims_controller.dart';

import '../../../core/widgets/custom_listTile.dart';
import 'newMuslims_lesson_Screen.dart';
class NewMuslimsCourseScreen extends StatelessWidget {
  NewMuslimsCourseScreen({required this.index ,super.key});
  final int index;
  final NewMuslimsController newMuslimsController = Get.put(NewMuslimsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Curso para el nuevo musulmán'),
        ),
        body: Obx(
    () => newMuslimsController.isLoading.value
    ? const Center(child: CircularProgressIndicator())
        : Container(
          color: AppColors.kPrimaryColor,
          child: Padding(
              padding: 10.aEdge,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('${newMuslimsController.newMuslimsModel.courses![index].description}',style: Styles.textStyle16Golden,textAlign: TextAlign.center),
                    SizedBox(
                      height: context.height*0.8,
                      child: ListView.builder(
                          itemCount: newMuslimsController.newMuslimsModel.courses![index].lessons!.length,
                          itemBuilder: (context, i) =>
                              CustomListTile(
                                index: i,
                                title:'${newMuslimsController.newMuslimsModel.courses![index].lessons![i].header}',
                                onTap: (){
                                  Get.to(()=> NewMuslimsLessonScreen(courseIndex: index,lessonIndex: i));
                                },
                              )
                      ),
                    )
                  ],
                ),
              )
          ),
        )
    ));
  }
}
