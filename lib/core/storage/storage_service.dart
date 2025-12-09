/// Abstract interface for storage services
/// This allows different implementations for different storage needs
/// Following Interface Segregation Principle
abstract class StorageService {
  /// Store a value with the given key
  Future<void> write(String key, String value);

  /// Retrieve a value for the given key
  /// Returns null if key doesn't exist
  Future<String?> read(String key);

  /// Delete a value for the given key
  Future<void> delete(String key);

  /// Clear all stored values
  Future<void> clear();

  /// Check if a key exists
  Future<bool> contains(String key);
}
