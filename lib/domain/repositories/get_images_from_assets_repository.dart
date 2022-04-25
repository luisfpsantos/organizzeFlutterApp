import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class GetImagesFromAssetsRepository {
  Future<Either<Exception, List<Map<String, dynamic>>>> call(
      String query, BuildContext context);
}
