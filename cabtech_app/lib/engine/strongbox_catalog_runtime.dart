class StrongboxCatalogRuntime {
  final Map<String, Map<String, dynamic>> entries;

  const StrongboxCatalogRuntime({
    required this.entries,
  });

  Map<String, dynamic>? lookup(String token) {
    return entries[token];
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