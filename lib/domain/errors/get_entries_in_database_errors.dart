class GetEntriesInDatabaseErrors implements Exception {}

class NoEntriesFound extends GetEntriesInDatabaseErrors {}

class GetEntriesInDatabaseDatasourceError extends GetEntriesInDatabaseErrors {}
