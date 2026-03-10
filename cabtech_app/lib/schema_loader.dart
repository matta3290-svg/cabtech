import 'engine/canon_loader.dart';
import 'engine/canon_index.dart';
import 'engine/engine_state.dart';
import 'engine/lock_registry.dart';
import 'engine/compiler_stub.dart';
import 'engine/lock_runtime.dart';
Future<EngineState> loadSchemas() async {
  final bundle = await CanonLoader.load(assetPaths: const [
    'assets/schema/GLOBAL_SCHEMA_HEADER_v1.0.yaml',
    'assets/schema/STRONGBOX_CANON_HEADER_v1.0.yaml',
    'assets/schema/CABTECH_ENGINE_REV_v1.0.yaml',
  ]);

  final index = CanonIndex.build(bundle);

  final locks = const LockRegistry(
  version: '0',
  locks: [],
);
  final lockRuntime = LockRuntime.fromRegistry(locks);
  final validation = ValidationReport.validate(bundle, index, locks);

  final state = EngineState(
  canonBundle: bundle,
  canonIndex: index,
  lockRegistry: locks,
  lockRuntime: lockRuntime,
  validation: validation,
);
  final domObj = CompilerStub.compile(state);

  // ignore: avoid_print
  print(
    'ENGINE_READY ok=${state.validation.ok} '
    'engine=${state.canonIndex.engineVersion} '
    'global=${state.canonIndex.globalSchemaVersion} '
    'strongbox=${state.canonIndex.strongboxVersion} '
    'locks=${state.lockRuntime.lockCount} '
    'dom_obj=${domObj.meta.domObjVersion} '
    'objects=${domObj.objects.length} '
    'errors=${state.validation.errors.length}',
  );

  return state;
}