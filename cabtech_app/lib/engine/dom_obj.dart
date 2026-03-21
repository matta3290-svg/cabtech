class DomObjMeta {
  final String domObjVersion;
  final String engineVersion;
  final String globalSchemaVersion;
  final String strongboxVersion;
  final String lockRegistryVersion;

  const DomObjMeta({
    required this.domObjVersion,
    required this.engineVersion,
    required this.globalSchemaVersion,
    required this.strongboxVersion,
    required this.lockRegistryVersion,
  });
}

class DomObjValidation {
  final bool ok;
  final List<String> errors;
  final List<String> warnings;

  const DomObjValidation({
    required this.ok,
    this.errors = const [],
    this.warnings = const [],
  });
}

class DomObjObject {
  final String objectId;
  final String sourceToken;
  final String objectClass;
  final String status;
  final bool isGeometric;
  final String? parentId;
  final String? roomId;
  final String? runId;
  final String? segmentId;
  final int? x0;
  final int? x1;
  final int? spanUsed;
  final String? createdBy;
  final String? sourceType;
  final String? sourceRef;
  final DateTime? createdAt;
  


  const DomObjObject({
    required this.objectId,
    required this.sourceToken,
    required this.objectClass,
    required this.status,
    required this.isGeometric,
    this.parentId,
    this.roomId,
    this.runId,
    this.segmentId,
    this.x0,
    this.x1,
    this.spanUsed,
    this.createdBy,
    this.sourceType,
    this.sourceRef,
    this.createdAt,

  });
}

class DomObj {
  final DomObjMeta meta;
  final List<DomObjObject> objects;
  final DomObjValidation validation;

  const DomObj({
    required this.meta,
    required this.objects,
    required this.validation,
  });

  List<String> validateHierarchy() {
    final errors = <String>[];

    final objectIds = objects.map((o) => o.objectId).toSet();

    for (final obj in objects) {
      if (obj.objectClass == 'RUN') {
        if (obj.parentId != 'OBJ_ROOM_001') {
          errors.add('RUN ${obj.objectId} missing ROOM parent.');
        }
      }

      if (obj.objectClass == 'SEGMENT') {
        if (obj.parentId == null || !objectIds.contains(obj.parentId)) {
          errors.add('SEGMENT ${obj.objectId} missing valid RUN parent.');
        }
      }

      if (obj.objectClass == 'BASE_CABINET') {
        if (obj.parentId == null || !objectIds.contains(obj.parentId)) {
          errors.add('CABINET ${obj.objectId} missing valid SEGMENT parent.');
        }
      }
    }

    return errors;
  }

  List<String> validateSpans() {
  final errors = <String>[];

  for (final obj in objects) {
  final x0 = obj.x0;
  final x1 = obj.x1;

  if (x0 == null || x1 == null) {
    continue;
  }

  if (x1 <= x0) {
    errors.add(
      '${obj.objectClass} ${obj.objectId} has invalid span (x1 <= x0).',
    );
  }
}

  return errors;
}

List<String> validateUniqueObjectIds() {
  final errors = <String>[];
  final seen = <String>{};

  for (final obj in objects) {
    if (seen.contains(obj.objectId)) {
      errors.add(
        'Duplicate objectId detected: ${obj.objectId}.',
      );
    } else {
      seen.add(obj.objectId);
    }
  }

  return errors;
}
}