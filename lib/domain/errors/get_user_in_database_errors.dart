class GetUsersInDatabaseErrors implements Exception {}

//ERRORS FROM DATASOURCE
class GetUserNotFound extends GetUsersInDatabaseErrors {}

class GetUserDatasourceError extends GetUsersInDatabaseErrors {}
