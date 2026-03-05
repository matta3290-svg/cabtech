import 'package:flutter/services.dart' show rootBundle;
import 'package:yaml/yaml.dart';

class LockRegistry {
  final String version;
  final List<Map<String, dynamic>> locks;

  const LockRegistry({
    required this.version,
    required this.locks,
  });

  int get count => locks.length;

  static Future<LockRegistry> loadFromAssets({
    String path = 'assets/locks/locks_v0.yaml',
  }) async {
    final text = await rootBundle.loadString(path);
    final parsed = loadYaml(text);

    if (parsed is! YamlMap) {
      throw FormatException('locks file must be a YAML map: $path');
    }

    final root = parsed['lock_registry_v0'];
    if (root is! YamlMap) {
      throw FormatException('missing lock_registry_v0 root node: $path');
    }

    final version = (root['version'] ?? '').toString();
    if (version.isEmpty) {
      throw FormatException('missing lock_registry_v0.version: $path');
    }

    final locksNode = root['locks'];
    if (locksNode is! YamlList) {
      throw FormatException('lock_registry_v0.locks must be a list: $path');
    }

    final locks = <Map<String, dynamic>>[];
    for (final item in locksNode) {
      if (item is YamlMap) {
        locks.add(Map<String, dynamic>.from(item));
      } else {
        throw FormatException('each lock entry must be a map: $path');
      }
    }

    return LockRegistry(
      version: version,
      locks: locks,
    );
  }
}