import 'dart:io';

import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;

class DownloadScreenController extends GetxController {
  Future<void> downloadFile() async {
    try {
      final response = await http.get(
        Uri.parse('${AppApiRoutes.jsonApi}quran.json'),
      );
      if (response.statusCode == 200) {
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/quran.json');
        await file.writeAsBytes(response.bodyBytes);
        print('File downloaded to ${file.path}');
      } else {
        print('Failed to download file');
      }
    } catch (e) {
      print('Error: $e');
    } finally {}
  }

  @override
  void onInit() async {
    await downloadFile();
    super.onInit();
  }
}
