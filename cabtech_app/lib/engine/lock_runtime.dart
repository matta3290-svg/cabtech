import 'lock_registry.dart';

class LockRuntime {
  final String version;
  final int lockCount;

  const LockRuntime({
    required this.version,
    required this.lockCount,
  });

  static LockRuntime fromRegistry(LockRegistry registry) {
    return LockRuntime(
      version: registry.version,
      lockCount: registry.locks.length,
    );
  }
}