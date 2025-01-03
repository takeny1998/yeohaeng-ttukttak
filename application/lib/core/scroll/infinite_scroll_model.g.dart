// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infinite_scroll_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InfiniteScrollModelImpl<T> _$$InfiniteScrollModelImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$InfiniteScrollModelImpl<T>(
      records: (json['records'] as List<dynamic>).map(fromJsonT).toList(),
      metadata: InfiniteScrollMetadata.fromJson(
          json['_metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InfiniteScrollModelImplToJson<T>(
  _$InfiniteScrollModelImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'records': instance.records.map(toJsonT).toList(),
      '_metadata': instance.metadata,
    };

_$InfiniteScrollMetadataImpl _$$InfiniteScrollMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$InfiniteScrollMetadataImpl(
      pageNumber: (json['pageNumber'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      hasNext: json['hasNext'] as bool,
    );

Map<String, dynamic> _$$InfiniteScrollMetadataImplToJson(
        _$InfiniteScrollMetadataImpl instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'hasNext': instance.hasNext,
    };
