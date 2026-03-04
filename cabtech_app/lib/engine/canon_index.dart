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
      final path = entry.key;
      final parsed = entry.value.parsed;

      if (parsed is Map) {
        if (path.contains('ENGINE_REV')) {
          engine = parsed['cabtech_engine_rev']?['version']?.toString();
        }

        if (path.contains('GLOBAL_SCHEMA')) {
          global = parsed['global_schema']?['version']?.toString();
        }

        if (path.contains('STRONGBOX_CANON')) {
          strongbox = parsed['strongbox_canon']?['version']?.toString();
        }
      }
    }

    return CanonIndex(
      engineVersion: engine,
      globalSchemaVersion: global,
      strongboxVersion: strongbox,
    );
  }
}
