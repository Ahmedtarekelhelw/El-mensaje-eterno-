import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/mooamalat/controller/mooamalat_controller.dart';

import 'mooamalat_lesson_Screen.dart';
import '../../../core/widgets/custom_listTile.dart';
class MooamalatCourseScreen extends StatelessWidget {
  MooamalatCourseScreen({required this.index ,super.key});
  final int index;
  MooamalatController mooamalatController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${mooamalatController.mooamalatModel.courses![index].title}'),
        ),
        body: Container(
          color: AppColors.kPrimaryColor,
          child: Padding(
              padding: 10.aEdge,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('${mooamalatController.mooamalatModel.courses![index].description}',style: Styles.textStyle16Golden,textAlign: TextAlign.center),
                    SizedBox(
                      height: context.height*0.8,
                      child: ListView.builder(
                          itemCount: mooamalatController.mooamalatModel.courses![index].lessons!.length,
                          itemBuilder: (context, i) =>
                              CustomListTile(
                                index: i,
                                title:'${mooamalatController.mooamalatModel.courses![index].lessons![i].title}',
                                onTap: (){
                                  Get.to(()=> MooamalatLessonScreen(courseIndex: index,lessonIndex: i));
                                },
                              )
                      ),
                    )
                  ],
                ),
              )
          ),
        )
    );
  }
}
