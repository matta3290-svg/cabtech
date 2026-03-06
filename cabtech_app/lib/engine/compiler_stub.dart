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
    objects: const [
  DomObjObject(
    objectId: 'OBJ_ROOM_001',
    sourceToken: 'ROOM',
    objectClass: 'ROOM',
    status: 'VALID',
  ),
  DomObjObject(
    objectId: 'OBJ_RUN_001',
    sourceToken: 'RUN',
    objectClass: 'RUN',
    status: 'VALID',
  ),
  DomObjObject(
    objectId: 'OBJ_SEG_001',
    sourceToken: 'SEGMENT',
    objectClass: 'SEGMENT',
    status: 'VALID',
  ),
  DomObjObject(
    objectId: 'OBJ_CAB_001',
    sourceToken: 'BD3',
    objectClass: 'BASE_CABINET',
    status: 'VALID',
  ),
],
      validation: DomObjValidation(
        ok: true,
        errors: [],
        warnings: [],
      ),
    );

    return domObj;
  }
}