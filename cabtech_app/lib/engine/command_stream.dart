class CommandStream {
  final List<Map<String, dynamic>> runs;

  const CommandStream({
    required this.runs,
  });

  static CommandStream demo() {
  return const CommandStream(
    runs: [
      {
        'command': 'RUNX',
        'runId': 'OBJ_RUN_001',
        'segmentId': 'OBJ_SEG_001',
        'cabinets': [
  {
  'objectId': 'OBJ_CAB_001',
  'token': 'BD3',
},
{
  'objectId': 'OBJ_CAB_002',
  'token': 'BD3',
},
  {
    'objectId': 'OBJ_CAB_003',
    'token': 'BD3',
  },
],
        },
        {
         'command': 'RUNX',
             'runId': 'OBJ_RUN_002',
             'segmentId': 'OBJ_SEG_002',
            'cabinets': [
  {
    'objectId': 'OBJ_CAB_004',
    'token': 'BD3',
  },
  {
    'objectId': 'OBJ_CAB_005',
    'token': 'BD3',
  },
],
        },
      ],
    );
  }
}