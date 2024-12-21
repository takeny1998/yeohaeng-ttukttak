import 'package:freezed_annotation/freezed_annotation.dart';

part 'reference.freezed.dart';

@freezed
class Reference<T, R> with _$Reference<T, R> {
  const factory Reference({
    required T entity,
    required R reference,
  }) = _Reference;
}
