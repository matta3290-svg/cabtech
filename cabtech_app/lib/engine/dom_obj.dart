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
  final String? parentId;
  final String? roomId;
  final String? runId;
  final String? segmentId;
  final int? x0;
  final int? x1;
  final int? spanUsed;

  const DomObjObject({
    required this.objectId,
    required this.sourceToken,
    required this.objectClass,
    required this.status,
    this.parentId,
    this.roomId,
    this.runId,
    this.segmentId,
        this.x0,
    this.x1,
    this.spanUsed,
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
}