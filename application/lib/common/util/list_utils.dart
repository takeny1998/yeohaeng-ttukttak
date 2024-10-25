import 'dart:math';

final class ListUtils {
  static bool isIndexInRange(int index, {int start = 0, required int end}) {
    return start <= index && index <= end;
  }

  static T random<T>(Iterable<T> list) {
    final index = Random().nextInt(list.length);
    return list.elementAt(index);
  }
}
