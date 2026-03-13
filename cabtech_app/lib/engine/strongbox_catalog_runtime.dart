class StrongboxCatalogRuntime {
  final Map<String, Map<String, dynamic>> entries;

  const StrongboxCatalogRuntime({
    required this.entries,
  });

  Map<String, dynamic>? lookup(String token) {
    return entries[token];
  }
  bool validate(List<String> errors) {
  for (final entry in entries.entries) {
    final token = entry.key;
    final def = entry.value;

    if (!def.containsKey('objectClass')) {
      errors.add(
        'Strongbox token $token missing objectClass.',
      );
    }

    if (!def.containsKey('width')) {
      errors.add(
        'Strongbox token $token missing width.',
      );
    }
  }

  return errors.isEmpty;
}
  static const StrongboxCatalogRuntime demo =
      StrongboxCatalogRuntime(
        entries: {
          'BD3': {
          'objectClass': 'BASE_CABINET',
          'width': 36000,
          },
        },
      );
}