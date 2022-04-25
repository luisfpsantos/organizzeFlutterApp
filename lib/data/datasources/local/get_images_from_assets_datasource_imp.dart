import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:organizze_app/data/datasources/get_images_from_assets_datasource.dart';
import 'package:organizze_app/domain/errors/get_images_from_assets_erros.dart';

class GetImagesFromAssetsDatasourceImp
    implements GetImagesFromAssetsDatasource {
  @override
  Future<Either<Exception, List<Map<String, dynamic>>>> call(
      String query, BuildContext context) async {
    List<Map<String, dynamic>> imagesList = [];
    try {
      String assets =
          await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

      Map<String, dynamic> mapAssets = json.decode(assets);

      List<String> filterAssets =
          mapAssets.keys.where((keys) => keys.contains(query)).toList();

      if (filterAssets.isEmpty) return left(NoAssetsFound());

      for (var asset in filterAssets) {
        imagesList.add(
          {
            'image': Image.asset(asset, scale: 1),
            'iconPath': asset,
          },
        );
      }

      return right(imagesList);
    } catch (e) {
      return left(GetImagesFromAssetsError());
    }
  }
}
