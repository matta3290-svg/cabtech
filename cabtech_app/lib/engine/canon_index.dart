import 'canon_bundle.dart';

class CanonIndex {
  final String? engineVersion;
  final String? globalSchemaVersion;
  final String? strongboxVersion;

  CanonIndex({
    required this.engineVersion,
    required this.globalSchemaVersion,
    required this.strongboxVersion,
  });

  static CanonIndex build(CanonBundle bundle) {
    String? engine;
    String? global;
    String? strongbox;

    for (final entry in bundle.filesByPath.entries) {
      final parsed = entry.value.parsed;

      if (parsed is Map) {
        engine = parsed['cabtech_engine_rev']?['version']?.toString() ?? engine;
        global = parsed['global_schema_header']?['version']?.toString() ?? global;
        strongbox =
            parsed['strongbox_canon_header']?['version']?.toString() ?? strongbox;
      }
    }

    return CanonIndex(
      engineVersion: engine,
      globalSchemaVersion: global,
      strongboxVersion: strongbox,
    );
  }
}