import 'canon_bundle.dart';
import 'canon_index.dart';

class ValidationReport {static ValidationReport validate(
  CanonBundle bundle,
  CanonIndex index,
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

  return ValidationReport(
    errors: errors,
    warnings: warnings,
  );
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
  final ValidationReport validation;

  const EngineState({
    required this.canonBundle,
    required this.canonIndex,
    required this.validation,
  });
}