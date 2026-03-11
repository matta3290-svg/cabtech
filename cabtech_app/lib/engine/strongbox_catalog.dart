class StrongboxCatalog {
  static const Map<String, Map<String, dynamic>> demo = {
    'BD3': {
      'objectClass': 'BASE_CABINET',
      'width': 36000,
    },
  };

  static Map<String, dynamic>? lookup(String token) {
    return demo[token];
  }
}