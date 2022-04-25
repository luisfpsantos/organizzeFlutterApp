import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:organizze_app/domain/repositories/get_images_from_assets_repository.dart';
import 'package:organizze_app/domain/usecases/get_images_from_assets/get_images_from_assets_usecase.dart';

class GetImagesFromAssetsUsecaseImp implements GetImagesFromAssetsUsecase {
  final GetImagesFromAssetsRepository _getImagesFromAssetsRepository;

  GetImagesFromAssetsUsecaseImp(this._getImagesFromAssetsRepository);
  @override
  Future<Either<Exception, List<Map<String, dynamic>>>> call(
      String query, BuildContext context) async {
    return await _getImagesFromAssetsRepository(query, context);
  }
}
