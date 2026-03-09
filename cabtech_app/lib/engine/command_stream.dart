class CommandStream {
  final List<Map<String, dynamic>> runs;

  const CommandStream({
    required this.runs,
  });

  static CommandStream demo() {
    return const CommandStream(
      runs: [
        {
          'runId': 'OBJ_RUN_001',
          'segmentId': 'OBJ_SEG_001',
          'cabinets': [
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
          ],
        },
        {
          'runId': 'OBJ_RUN_002',
          'segmentId': 'OBJ_SEG_002',
          'cabinets': [
            {
              'objectId': 'OBJ_CAB_004',
              'sourceToken': 'BD3',
              'objectClass': 'BASE_CABINET',
              'width': 36000,
            },
            {
              'objectId': 'OBJ_CAB_005',
              'sourceToken': 'BD3',
              'objectClass': 'BASE_CABINET',
              'width': 36000,
            },
          ],
        },
      ],
    );
  }
}