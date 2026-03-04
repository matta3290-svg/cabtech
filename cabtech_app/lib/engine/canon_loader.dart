import 'package:flutter/services.dart' show rootBundle;
import 'package:yaml/yaml.dart';
import 'canon_bundle.dart';

class CanonLoader {
  static Future<CanonBundle> load({
    required List<String> assetPaths,
  }) async {
    final map = <String, CanonFile>{};
    final files = <String>[];

    for (final path in assetPaths) {
      final text = await rootBundle.loadString(path);
      final parsed = loadYaml(text);

      files.add(path);

      map[path] = CanonFile(
        path: path,
        text: text,
        parsed: parsed,
      );
    }

    return CanonBundle(
      loadedAt: DateTime.now(),
      files: files,
      filesByPath: map,
    );
  }
}