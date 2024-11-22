import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/download_screen/controller/download_screen_controller.dart';

class DownloadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DownloadScreenController());
    return Scaffold();
  }
}
