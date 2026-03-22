// lib/core/errors/exceptions.dart

/// Exception thrown when something goes wrong with the server (e.g., Supabase errors).
class ServerException implements Exception {
  final String message;
  
  const ServerException({this.message = 'An unexpected server error occurred.'});

  @override
  String toString() => message;
}

/// Exception thrown when something goes wrong with local SharedPreferences/caching.
class CacheException implements Exception {
  final String message;

  const CacheException({this.message = 'Failed to load local data.'});

  @override
  String toString() => message;
}
