import 'package:cabtech_app/engine/dom_obj.dart';
import 'package:cabtech_app/engine/engine_state.dart';

class CompilerStub {
  static DomObj compile(EngineState state) {
    const int roomX0 = 0;
    const int roomX1 = 144000;

    const int runX0 = 0;
    const int runX1 = 144000;

    const int segmentX0 = 0;
    const int segmentX1 = 144000;

    const int cabinetWidth = 36000;

    final int segmentSpanUsedBefore = 0;
    final int cabinetX0 = segmentSpanUsedBefore;
    final int cabinetX1 = cabinetX0 + cabinetWidth;
    final int segmentSpanUsedAfter = cabinetX1;

    final domObj = DomObj(
      meta: DomObjMeta(
        domObjVersion: '0.1',
        engineVersion: state.canonIndex.engineVersion ?? 'unknown',
        globalSchemaVersion: state.canonIndex.globalSchemaVersion ?? 'unknown',
        strongboxVersion: state.canonIndex.strongboxVersion ?? 'unknown',
        lockRegistryVersion: state.lockRegistry.version,
      ),
      objects: [
        const DomObjObject(
          objectId: 'OBJ_ROOM_001',
          sourceToken: 'ROOM',
          objectClass: 'ROOM',
          status: 'VALID',
          parentId: null,
          roomId: 'OBJ_ROOM_001',
          runId: null,
          segmentId: null,
          x0: roomX0,
          x1: roomX1,
        ),
        const DomObjObject(
          objectId: 'OBJ_RUN_001',
          sourceToken: 'RUN',
          objectClass: 'RUN',
          status: 'VALID',
          parentId: 'OBJ_ROOM_001',
          roomId: 'OBJ_ROOM_001',
          runId: 'OBJ_RUN_001',
          segmentId: null,
          x0: runX0,
          x1: runX1,
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
          x0: segmentX0,
          x1: segmentX1,
          spanUsed: segmentSpanUsedAfter,
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
          x0: cabinetX0,
          x1: cabinetX1,
        ),
      ],
      validation: const DomObjValidation(
        ok: true,
        errors: [],
        warnings: [],
      ),
    );

    return domObj;
  }
}