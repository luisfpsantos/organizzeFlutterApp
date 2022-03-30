class GetLoginOptionsLocalErrors implements Exception {}

//ERRORS FROM DATASOURCE
class LoginLocalNotFound extends GetLoginOptionsLocalErrors {}

class GetLoginOptionsDatasourceError extends GetLoginOptionsLocalErrors {}
