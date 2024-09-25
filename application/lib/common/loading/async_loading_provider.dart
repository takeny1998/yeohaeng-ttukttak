import 'package:application_new/common/loading/async_loading_semaphore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'async_loading_provider.g.dart';

@riverpod
class AsyncLoading extends _$AsyncLoading {
  @override
  AsyncLoadingSemaphore build() {
    return const AsyncLoadingSemaphore();
  }

  FutureOr<T> guard<T>(FutureOr<T> Function() callback) async {
    try {
      state = state.copyWith(count: state.count + 1);
      return await callback();
    } finally {
      state = state.copyWith(count: state.count - 1);
    }
  }
}
