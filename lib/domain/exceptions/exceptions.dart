abstract class DomainException implements Exception {}

class NoDataInCacheException implements DomainException {}

class RemoteHostNotReachedException implements DomainException {}

class NoDataFoundException implements DomainException {}
