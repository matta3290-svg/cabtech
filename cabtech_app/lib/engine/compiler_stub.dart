import 'package:cabtech_app/engine/dom_obj.dart';
import 'package:cabtech_app/engine/engine_state.dart';
import 'package:cabtech_app/engine/command_stream.dart';
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
    final roomX0 = state.globalSchemaRuntime.roomX0;

final roomX1 = state.globalSchemaRuntime.roomX1;

final runX0 = state.globalSchemaRuntime.runX0;
final runX1 = state.globalSchemaRuntime.runX1;

final segmentX0 = state.globalSchemaRuntime.segmentX0;
final segmentX1 = state.globalSchemaRuntime.segmentX1;

    final commandStream = CommandStream.demo();
    final compileErrors = <String>[];
    if (state.lockRuntime.version.isEmpty) {
  compileErrors.add('LockRuntime version missing.');
}
    if (roomX1 <= roomX0) {
  compileErrors.add('GlobalSchemaRuntime room span invalid.');
}

if (runX1 <= runX0) {
  compileErrors.add('GlobalSchemaRuntime run span invalid.');
}

if (segmentX1 <= segmentX0) {
  compileErrors.add('GlobalSchemaRuntime segment span invalid.');
}
    if (state.lockRuntime.lockCount < 0) {
  compileErrors.add('LockRuntime lockCount invalid.');
}
    final objects = <DomObjObject>[
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
    ];

    int maxSpanUsed = 0;

    for (final run in commandStream.runs) {
      final command = run['command'];

      if (command != 'RUNX') {
        continue;
      }

      if (!run.containsKey('runId') ||
          !run.containsKey('segmentId') ||
          !run.containsKey('cabinets')) {
        compileErrors.add('RUNX command missing required fields.');
        continue;
      }

      final runId = run['runId'] as String;
      final segmentId = run['segmentId'] as String;
      final cabinetSpecs = run['cabinets'] as List<dynamic>;

      objects.add(
        DomObjObject(
          objectId: runId,
          sourceToken: 'RUN',
          objectClass: 'RUN',
          status: 'VALID',
          parentId: 'OBJ_ROOM_001',
          roomId: 'OBJ_ROOM_001',
          runId: runId,
          segmentId: null,
          x0: runX0,
          x1: runX1,
        ),
      );

      int currentX = segmentX0;

      for (final spec in cabinetSpecs) {
        final cabinet = spec as Map<String, dynamic>;
        final objectId = cabinet['objectId'] as String;
        final token = cabinet['token'] as String;

        final strongboxDef =
              state.strongboxCatalogRuntime.lookup(token);
        if (strongboxDef == null) {
          compileErrors.add('Unknown Strongbox token: $token');
          continue;
        }

        final width = strongboxDef['width'] as int;
        final objectClass = strongboxDef['objectClass'] as String;

        final x0 = currentX;
        final x1 = x0 + width;

objects.add(
  buildCabinet(
    objectId: objectId,
    sourceToken: token,
    objectClass: objectClass,    
            parentId: segmentId,
            roomId: 'OBJ_ROOM_001',
            runId: runId,
            segmentId: segmentId,
            x0: x0,
            x1: x1,
          ),
        );

        currentX = x1;
      }

      final segmentSpanUsed = currentX;
      if (segmentSpanUsed > maxSpanUsed) {
        maxSpanUsed = segmentSpanUsed;
      }

      objects.add(
        DomObjObject(
          objectId: segmentId,
          sourceToken: 'SEGMENT',
          objectClass: 'SEGMENT',
          status: 'VALID',
          parentId: runId,
          roomId: 'OBJ_ROOM_001',
          runId: runId,
          segmentId: segmentId,
          x0: segmentX0,
          x1: segmentX1,
          spanUsed: segmentSpanUsed,
        ),
      );
    }

    final domObj = DomObj(
      meta: DomObjMeta(
        domObjVersion: '0.1',
        engineVersion: state.canonIndex.engineVersion ?? 'unknown',
        globalSchemaVersion: state.canonIndex.globalSchemaVersion ?? 'unknown',
        strongboxVersion: state.canonIndex.strongboxVersion ?? 'unknown',
        lockRegistryVersion: state.lockRegistry.version,
      ),
      objects: objects,
      validation: DomObjValidation(
        ok: maxSpanUsed <= segmentX1 && compileErrors.isEmpty,
        errors: [
          ...compileErrors,
          if (maxSpanUsed > segmentX1)
            'CABINET placement exceeds segment span.',
        ],
        warnings: const [],
      ),
    );

    return domObj;
  }
}