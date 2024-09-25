import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_loading_semaphore.freezed.dart';

@freezed
class AsyncLoadingSemaphore with _$AsyncLoadingSemaphore {
  const factory AsyncLoadingSemaphore({
    @Default(0) int count,
  }) = _AsyncLoadingSemaphore;
}
