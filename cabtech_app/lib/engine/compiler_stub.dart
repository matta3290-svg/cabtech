import 'package:cabtech_app/engine/dom_obj.dart';
import 'package:cabtech_app/engine/engine_state.dart';

class CompilerStub {
  static DomObjObject buildCabinet({
    required String objectId,
    required String sourceToken,
    required String objectClass,
    required String parentId,
    required String roomId,
    required String runId,
    required String segmentId,
    required int x0,
    required int x1,
  }) {
    return DomObjObject(
      objectId: objectId,
      sourceToken: sourceToken,
      objectClass: objectClass,
      status: 'VALID',
      parentId: parentId,
      roomId: roomId,
      runId: runId,
      segmentId: segmentId,
      x0: x0,
      x1: x1,
    );
  }
  static DomObj compile(EngineState state) {
    const int roomX0 = 0;
    const int roomX1 = 144000;

    const int runX0 = 0;
    const int runX1 = 144000;

    const int segmentX0 = 0;
    const int segmentX1 = 144000;

    const int cabinetWidth = 36000;

    int currentX = segmentX0;

    final cabinet1X0 = currentX;
    final cabinet1X1 = cabinet1X0 + cabinetWidth;
    currentX = cabinet1X1;

    final cabinet2X0 = currentX;
    final cabinet2X1 = cabinet2X0 + cabinetWidth;
    currentX = cabinet2X1;

    final cabinet3X0 = currentX;
    final cabinet3X1 = cabinet3X0 + cabinetWidth;
    currentX = cabinet3X1;

    final segmentSpanUsed = currentX;

    final domObj = DomObj(
      meta: DomObjMeta(
        domObjVersion: '0.1',
        engineVersion: state.canonIndex.engineVersion ?? 'unknown',
        globalSchemaVersion: state.canonIndex.globalSchemaVersion ?? 'unknown',
        strongboxVersion: state.canonIndex.strongboxVersion ?? 'unknown',
        lockRegistryVersion: state.lockRegistry.version,
      ),
      objects: [
        DomObjObject(
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
        DomObjObject(
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
          spanUsed: segmentSpanUsed,
        ),
      
      
        buildCabinet(
          objectId: 'OBJ_CAB_001',
          sourceToken: 'BD3',
          objectClass: 'BASE_CABINET',
          parentId: 'OBJ_SEG_001',
          roomId: 'OBJ_ROOM_001',
          runId: 'OBJ_RUN_001',
          segmentId: 'OBJ_SEG_001',
          x0: cabinet1X0,
          x1: cabinet1X1,
        ),
        buildCabinet(
          objectId: 'OBJ_CAB_002',
          sourceToken: 'BD3',
          objectClass: 'BASE_CABINET',
          parentId: 'OBJ_SEG_001',
          roomId: 'OBJ_ROOM_001',
          runId: 'OBJ_RUN_001',
          segmentId: 'OBJ_SEG_001',
          x0: cabinet2X0,
          x1: cabinet2X1,
        ),
        buildCabinet(
          objectId: 'OBJ_CAB_003',
          sourceToken: 'BD3',
          objectClass: 'BASE_CABINET',
          parentId: 'OBJ_SEG_001',
          roomId: 'OBJ_ROOM_001',
          runId: 'OBJ_RUN_001',
          segmentId: 'OBJ_SEG_001',
          x0: cabinet3X0,
          x1: cabinet3X1,
        ),
      ],
      validation: DomObjValidation(
        ok: cabinet3X1 <= segmentX1,
        errors: cabinet3X1 <= segmentX1
            ? []
            : ['CABINET placement exceeds segment span.'],
        warnings: const [],
      ),
    );

    return domObj;
  }
}