import 'dart:math';

final class IterableUtil {
  static bool isIndexInRange(int index, {int start = 0, required int end}) {
    return start <= index && index <= end;
  }

  static T random<T>(Iterable<T> list) {
    final index = Random().nextInt(list.length);
    return list.elementAt(index);
  }


  static bool anyMatched<T>(Iterable<T> a, Iterable<T> b) {
    if (a.isEmpty || b.isEmpty) return true;

    return Set.of(a).intersection(Set.of(b)).isNotEmpty;
  }

}
