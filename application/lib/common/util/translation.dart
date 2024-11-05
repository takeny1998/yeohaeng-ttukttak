
String Function(String) baseKey(String baseKey) => (String key) {
  return '$baseKey.$key';
};

String enumKey(Enum? key) {
  if (key == null) return 'null';

  return 'enum.${key.runtimeType}.${key.name}';
}