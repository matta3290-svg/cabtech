class GlobalSchemaRuntime {
  final int roomX0;
  final int roomX1;

  final int runX0;
  final int runX1;

  final int segmentX0;
  final int segmentX1;

  const GlobalSchemaRuntime({
    required this.roomX0,
    required this.roomX1,
    required this.runX0,
    required this.runX1,
    required this.segmentX0,
    required this.segmentX1,
  });

  static const GlobalSchemaRuntime defaultRuntime =
      GlobalSchemaRuntime(
        roomX0: 0,
        roomX1: 144000,
        runX0: 0,
        runX1: 144000,
        segmentX0: 0,
        segmentX1: 144000,
      );
}