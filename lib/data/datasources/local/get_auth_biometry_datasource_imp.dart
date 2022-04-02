import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:organizze_app/data/datasources/get_auth_biometry_datasource.dart';
import 'package:organizze_app/domain/errors/get_auth_biometry_errors.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class GetAuthBiometryDatasourceImp implements GetAuthBiometryDatasource {
  @override
  Future<Either<Exception, bool>> call() async {
    final LocalAuthentication _localAuthentication = LocalAuthentication();

    try {
      bool deviceHaveBiometry = await _localAuthentication.canCheckBiometrics;
      if (deviceHaveBiometry) {
        bool didAuthenticate = await _localAuthentication.authenticate(
          localizedReason: 'Desbloqueie seu celular',
          stickyAuth: true,
        );
        if (didAuthenticate) {
          return right(didAuthenticate);
        } else {
          return left(UserNotAllowed());
        }
      } else {
        return left(DeviceDontHaveBiometry());
      }
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) return left(BiometryNotSet());
      return left(GetAuthBiometryDatasourceError());
    }
  }
}
