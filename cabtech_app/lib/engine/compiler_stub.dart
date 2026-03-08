import 'package:cabtech_app/engine/dom_obj.dart';
import 'package:cabtech_app/engine/engine_state.dart';

class CompilerStub {
    static const List<Map<String, dynamic>> cabinetSpecs = [
    {
      'objectId': 'OBJ_CAB_001',
      'sourceToken': 'BD3',
      'objectClass': 'BASE_CABINET',
      'width': 36000,
    },
    {
      'objectId': 'OBJ_CAB_002',
      'sourceToken': 'BD3',
      'objectClass': 'BASE_CABINET',
      'width': 36000,
    },
    {
      'objectId': 'OBJ_CAB_003',
      'sourceToken': 'BD3',
      'objectClass': 'BASE_CABINET',
      'width': 36000,
    },
  ];
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

        int currentX = segmentX0;
    final cabinets = <DomObjObject>[];

    for (final spec in cabinetSpecs) {
      final width = spec['width'] as int;
      final x0 = currentX;
      final x1 = x0 + width;

      cabinets.add(
        buildCabinet(
          objectId: spec['objectId'] as String,
          sourceToken: spec['sourceToken'] as String,
          objectClass: spec['objectClass'] as String,
          parentId: 'OBJ_SEG_001',
          roomId: 'OBJ_ROOM_001',
          runId: 'OBJ_RUN_001',
          segmentId: 'OBJ_SEG_001',
          x0: x0,
          x1: x1,
        ),
      );

      currentX = x1;
    }

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
      
      
                ...cabinets,
      ],
      validation: DomObjValidation(
                ok: segmentSpanUsed <= segmentX1,
        errors: segmentSpanUsed <= segmentX1
            ? []
            : ['CABINET placement exceeds segment span.'],
      ),
    );

    return domObj;
  }
}