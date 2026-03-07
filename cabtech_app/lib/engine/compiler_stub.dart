import 'package:cabtech_app/engine/dom_obj.dart';
import 'package:cabtech_app/engine/engine_state.dart';

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
    parentId: null,
    roomId: 'OBJ_ROOM_001',
    runId: null,
    segmentId: null,
        x0: 0,
    x1: 144000,

  ),
  DomObjObject(
    objectId: 'OBJ_RUN_001',
    sourceToken: 'RUN',
    objectClass: 'RUN',
    status: 'VALID',
    parentId: 'OBJ_ROOM_001',
    roomId: 'OBJ_ROOM_001',
    runId: 'OBJ_RUN_001',
    segmentId: null,
        x0: 0,
    x1: 144000,

  ),
  DomObjObject(
    objectId: 'OBJ_SEG_001',
    sourceToken: 'SEGMENT',
    objectClass: 'SEGMENT',
    status: 'VALID',
    parentId: 'OBJ_RUN_001',
    roomId: 'OBJ_ROOM_001',
    runId: 'OBJ_RUN_001',
    segmentId: 'OBJ_SEG_001',
        x0: 0,
    x1: 144000,
    spanUsed: 36000,

  ),
  DomObjObject(
    objectId: 'OBJ_CAB_001',
    sourceToken: 'BD3',
    objectClass: 'BASE_CABINET',
    status: 'VALID',
    parentId: 'OBJ_SEG_001',
    roomId: 'OBJ_ROOM_001',
    runId: 'OBJ_RUN_001',
    segmentId: 'OBJ_SEG_001',
        x0: 0,
    x1: 36000,

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