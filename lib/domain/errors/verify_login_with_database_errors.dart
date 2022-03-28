class VerifyLoginWithDatabaseErrors implements Exception {}

//ERROS FROM USECASE
class InvalidUser extends VerifyLoginWithDatabaseErrors {}

class InvalidPassword extends VerifyLoginWithDatabaseErrors {}

//ERROS FROM DATASOURCE
class UserNotfound extends VerifyLoginWithDatabaseErrors {}

class ErrorDataSource extends VerifyLoginWithDatabaseErrors {}
