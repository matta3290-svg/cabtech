import 'canon_bundle.dart';
import 'canon_index.dart';
import 'lock_registry.dart';
import 'lock_runtime.dart';

class ValidationReport {
  static ValidationReport validate(
    CanonBundle bundle,
    CanonIndex index,
    LockRegistry locks,
  ) {
    final errors = <String>[];
    final warnings = <String>[];

    if (bundle.files.isEmpty) {
      errors.add('No canon files loaded.');
    }

    if (index.engineVersion == null) {
      errors.add('Missing engine version.');
    }
    if (index.globalSchemaVersion == null) {
      errors.add('Missing global schema version.');
    }
    if (index.strongboxVersion == null) {
      errors.add('Missing strongbox version.');
    }

    // Locks sanity (v0 scaffold)
    if (locks.version.isEmpty) {
      errors.add('Missing lock registry version.');
    }

    return ValidationReport(errors: errors, warnings: warnings);
  }

  final List<String> errors;
  final List<String> warnings;

  const ValidationReport({
    this.errors = const [],
    this.warnings = const [],
  });

  bool get ok => errors.isEmpty;
}

class EngineState {
  final CanonBundle canonBundle;
  final CanonIndex canonIndex;
  final LockRegistry lockRegistry;
  final LockRuntime lockRuntime;
  final ValidationReport validation;

  const EngineState({
    required this.canonBundle,
    required this.canonIndex,
    required this.lockRegistry,
    required this.lockRuntime,
    required this.validation,
  });
}