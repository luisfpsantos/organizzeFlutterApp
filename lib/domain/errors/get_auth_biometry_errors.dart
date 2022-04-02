class GetAuthBiometryErrors implements Exception {}

//Errros from datasource
class UserNotAllowed extends GetAuthBiometryErrors {}

class DeviceDontHaveBiometry extends GetAuthBiometryErrors {}

class BiometryNotSet extends GetAuthBiometryErrors {}

class GetAuthBiometryDatasourceError extends GetAuthBiometryErrors {}
