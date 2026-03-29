// lib/core/errors/failures.dart

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([String message = 'A server error occurred.']) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure([String message = 'Failed to load local data.']) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure([String message = 'Please check your connection or try again.']) : super(message);
}
