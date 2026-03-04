import 'engine/canon_loader.dart';
import 'engine/canon_index.dart';
import 'engine/engine_state.dart';

Future<EngineState> loadSchemas() async {
  final bundle = await CanonLoader.load(assetPaths: const [
    'assets/schema/GLOBAL_SCHEMA_HEADER_v1.0.yaml',
    'assets/schema/STRONGBOX_CANON_HEADER_v1.0.yaml',
    'assets/schema/CABTECH_ENGINE_REV_v1.0.yaml',
  ]);

  final index = CanonIndex.build(bundle);

  final state = EngineState(
    canonBundle: bundle,
    canonIndex: index,
    validation: const ValidationReport(),
  );

  print('ENGINE_READY ok=${state.validation.ok} '
      'engine=${state.canonIndex.engineVersion} '
      'global=${state.canonIndex.globalSchemaVersion} '
      'strongbox=${state.canonIndex.strongboxVersion}');

  return state;
}