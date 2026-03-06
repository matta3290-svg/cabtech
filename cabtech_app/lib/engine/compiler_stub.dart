import 'dom_obj.dart';
import 'engine_state.dart';

class CompilerStub {
  static DomObj compile(EngineState state) {
    final domObj = DomObj(
      meta: DomObjMeta(
        domObjVersion: '0.1',
        engineVersion: state.canonIndex.engineVersion ?? 'unknown',
        globalSchemaVersion: state.canonIndex.globalSchemaVersion ?? 'unknown',
        strongboxVersion: state.canonIndex.strongboxVersion ?? 'unknown',
        lockRegistryVersion: state.lockRegistry.version,
      ),
      objects: const [],
      validation: DomObjValidation(
        ok: true,
        errors: [],
        warnings: [],
      ),
    );

    return domObj;
  }
}