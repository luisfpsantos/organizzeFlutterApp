class SaveLoginOptionsLocalErros implements Exception {}

//ERROS FROM DATASOURCE
class CanNotSaveLocalOptions extends SaveLoginOptionsLocalErros {}

class SaveLocalDatasourceError extends SaveLoginOptionsLocalErros {}
