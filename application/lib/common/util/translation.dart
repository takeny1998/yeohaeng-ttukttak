
String Function(String) baseKey(String baseKey) => (String key) {
  return '$baseKey.$key';
};

String enumKey(Enum key) {
  return 'enum.${key.runtimeType}.${key.name}';
}