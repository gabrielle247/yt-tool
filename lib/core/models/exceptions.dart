abstract class RepositoryException implements Exception {
  final String message;
  final Object? cause;
  
  RepositoryException(this.message, {this.cause});
  
  @override
  String toString() => cause == null 
      ? '$runtimeType: $message' 
      : '$runtimeType: $message\nCause: $cause';
}

class RepositoryInitializationException extends RepositoryException {
  RepositoryInitializationException(super.message, {super.cause});
}

class NotFoundException extends RepositoryException {
  NotFoundException(super.message, {super.cause});
}

class EncryptionException extends RepositoryException {
  EncryptionException(super.message, {super.cause});
}

class DecryptionException extends RepositoryException {
  DecryptionException(super.message, {super.cause});
}

class ValidationException extends RepositoryException {
  ValidationException(super.message, {super.cause});
}

class DatabaseException extends RepositoryException {
  DatabaseException(super.message, {super.cause});
}