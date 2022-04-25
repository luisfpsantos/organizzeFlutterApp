abstract class GetCategoriesInDatabaseErrors implements Exception {}

class NoCategoriesFound extends GetCategoriesInDatabaseErrors {}

class GetCategoriesInDatabaseDatasourceError
    extends GetCategoriesInDatabaseErrors {}
