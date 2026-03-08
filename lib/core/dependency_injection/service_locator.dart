/// Simple Service Locator for Dependency Injection
class ServiceLocator {
  static final Map<Type, dynamic> _services = {};
  
  /// Register a service
  static void register<T>(T service) {
    _services[T] = service;
  }
  
  /// Get a registered service
  static T get<T>() {
    final service = _services[T];
    if (service == null) {
      throw Exception('Service of type $T not registered!');
    }
    return service as T;
  }
  
  /// Check if service is registered
  static bool isRegistered<T>() {
    return _services.containsKey(T);
  }
  
  /// Clear all services (for testing)
  static void clear() {
    _services.clear();
  }
}