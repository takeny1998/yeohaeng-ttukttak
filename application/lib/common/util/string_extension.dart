
extension StringExtension on String {

  String lineBreakByWord() {
    return replaceAllMapped(RegExp(r'(\S)(?=\S)'), (m) => '${m[1]}\u200D');
  }

}