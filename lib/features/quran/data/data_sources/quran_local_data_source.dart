import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:hiwayda_oracion_islamica/features/quran/data/models/surah_model.dart';
import 'package:path_provider/path_provider.dart';

abstract class QuranLocalDataSource {
  Future<List<SurahModel>> getSurahs();
}

class QuranLocalDataSourceImpl extends QuranLocalDataSource {
  @override
  Future<List<SurahModel>> getSurahs() async {
    try {
      List<SurahModel> surahs = [];
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/quran.json';
      final file = File(filePath);
      String jsonString = await file.readAsString();
      final jsonResponse = json.decode(jsonString);
      surahs = jsonResponse
          .map<SurahModel>(
            (surah) => SurahModel.fromJson(surah),
          )
          .toList();

      log('localData');
      return surahs;
    } catch (e) {
      log(e.toString());
      //
      //
      // );
      rethrow;
    }
  }
}
