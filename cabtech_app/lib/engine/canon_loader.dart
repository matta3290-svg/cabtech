import 'package:flutter/services.dart' show rootBundle;
import 'package:yaml/yaml.dart';

import 'canon_bundle.dart';

class CanonLoader {
  static Future<CanonBundle> load({
    required List<String> assetPaths,
  }) async {
    final filesByPath = <String, CanonFile>{};
    final files = <String>[];

    for (final path in assetPaths) {
      final text = await rootBundle.loadString(path);

      // Safety: stop if someone accidentally pasted Dart into a YAML asset.
      if (text.contains('void main(') || text.contains('runApp(')) {
        throw StateError('DART FOUND IN YAML ASSET: $path');
      }

      final parsed = loadYaml(text);

      files.add(path);
      filesByPath[path] = CanonFile(
        path: path,
        text: text,
        parsed: parsed,
      );
    }

    return CanonBundle(
      loadedAt: DateTime.now(),
      files: files,
      filesByPath: filesByPath,
    );
  }
}