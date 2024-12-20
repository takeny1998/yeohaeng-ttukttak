import 'package:application_new/shared/dto/reference.dart';

final class ReferenceIterable<T, R> {
  final Iterable<Reference<T, R>> references;

  const ReferenceIterable({Iterable<Reference<T, R>>? references})
      : references = references ?? const [];

  bool contains(T entity) {
    final Iterable<T> entities = mapToEntity();
    return entities.contains(entity);
  }

  ReferenceIterable<T, R> add(T entity, R reference) {
    return ReferenceIterable(references: List.of(references)
      ..add(Reference(entity: entity, reference: reference)));
  }

  ReferenceIterable<T, R> remove(T entity) {
    return ReferenceIterable(references:
        references.where((reference) => reference.entity != entity));
  }

  Iterable<T> mapToEntity() {
    return references.map((reference) => reference.entity);
  }

  Iterable<R> mapToReference() {
    return references.map((reference) => reference.reference).toSet();
  }

  Reference<T, R> get(int index) {
    return references.toList()[index];
  }

  int get length => references.length;

}
