import 'package:freezed_annotation/freezed_annotation.dart';

part 'infinite_scroll_model.freezed.dart';
part 'infinite_scroll_model.g.dart';

@Freezed(genericArgumentFactories: true)
class InfiniteScrollModel<T> with _$InfiniteScrollModel<T> {

  const factory InfiniteScrollModel({
    required List<T> records,
    @JsonKey(name: '_metadata')
    required InfiniteScrollMetadata metadata,
  }) = _InfiniteScrollModel;

  factory InfiniteScrollModel.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$InfiniteScrollModelFromJson(json, fromJsonT);


  static int resolveNextPageNumber(List<InfiniteScrollModel> infiniteScrolls) {
    if (infiniteScrolls.isEmpty) return 0;
    return infiniteScrolls.last.metadata.pageNumber + 1;
  }

  static bool resolveHasNext(List<InfiniteScrollModel> infiniteScrolls) {
    if (infiniteScrolls.isEmpty) return true;
    return infiniteScrolls.last.metadata.hasNext;
  }
}

@freezed
class InfiniteScrollMetadata with _$InfiniteScrollMetadata {

  const factory InfiniteScrollMetadata({
    required int pageNumber,
    required int pageSize,
    required bool hasNext,
  }) = _InfiniteScrollMetadata;

  factory InfiniteScrollMetadata.fromJson(Map<String, dynamic> json) =>
      _$InfiniteScrollMetadataFromJson(json);
}