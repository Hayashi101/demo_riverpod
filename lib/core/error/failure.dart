abstract class Failure {}

class ServerFailure extends Failure {}

class NotFoundFailure extends Failure {}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {}