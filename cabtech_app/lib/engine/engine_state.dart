import 'canon_bundle.dart';
import 'canon_index.dart';

class ValidationReport {
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