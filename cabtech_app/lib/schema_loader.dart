import 'engine/canon_loader.dart';
import 'engine/canon_index.dart';

Future<void> loadSchemas() async {
  final bundle = await CanonLoader.load(assetPaths: const [
    'assets/schema/GLOBAL_SCHEMA_HEADER_v1.0.yaml',
    'assets/schema/STRONGBOX_CANON_HEADER_v1.0.yaml',
    'assets/schema/CABTECH_ENGINE_REV_v1.0.yaml',
  ]);

  final index = CanonIndex.build(bundle);

  print('CANON_BUNDLE_OK files=${bundle.files.length}');
  for (final p in bundle.files) {
    print(' - $p');
  }

  print('ENGINE_VERSION=${index.engineVersion}');
  print('GLOBAL_VERSION=${index.globalSchemaVersion}');
  print('STRONGBOX_VERSION=${index.strongboxVersion}');
}