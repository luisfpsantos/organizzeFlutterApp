import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:organizze_app/data/datasources/get_images_from_assets_datasource.dart';
import 'package:organizze_app/domain/repositories/get_images_from_assets_repository.dart';

class GetImagesFromAssetsRepositoryImp
    implements GetImagesFromAssetsRepository {
  final GetImagesFromAssetsDatasource _getImagesFromAssetsDatasource;

  GetImagesFromAssetsRepositoryImp(this._getImagesFromAssetsDatasource);
  @override
  Future<Either<Exception, List<Map<String, dynamic>>>> call(
      String query, BuildContext context) async {
    return await _getImagesFromAssetsDatasource(query, context);
  }
}
