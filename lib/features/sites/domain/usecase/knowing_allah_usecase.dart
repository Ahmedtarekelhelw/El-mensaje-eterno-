import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/knowing_allah_model.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../repository/knowing_allah_repository.dart';

class KnowingAllahUseCase {
  final KnowingAllahRepository knowingAllahRepository;
  KnowingAllahUseCase(
    this.knowingAllahRepository,
  );
  Future<Either<Failure, KnowingAllahModel>> call() async {
    Get.find<Logger>().i("Call KnowingAllahUseCase");
    return knowingAllahRepository.getArtical();
  }

  Future<Either<Failure, List<MediaEntity>>> getBooks() async {
    Get.find<Logger>().i("Call KnowingAllahUseCase");
    return knowingAllahRepository.getBooks();
  }
}
