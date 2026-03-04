class CanonFile {
  final String path;
  final String text; // the YAML text contents
  final dynamic parsed;

  CanonFile({
    required this.path,
    required this.text,
    required this.parsed,
  });
}

class CanonBundle {
  final List<String> files;
  final Map<String, CanonFile> filesByPath;
  final DateTime loadedAt;

  CanonBundle({
    required this.files,
    required this.filesByPath,
    required this.loadedAt,
  });
}