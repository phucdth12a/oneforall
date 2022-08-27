// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIResponseList<T> _$APIResponseListFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    APIResponseList<T>(
      code: json['code'] as int?,
      status: json['status'] as String?,
      element: (json['element'] as num?)?.toDouble(),
      elements: (json['elements'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$APIResponseListToJson<T>(
  APIResponseList<T> instance,
  Object? Function(T value) toJsonT,
) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('status', instance.status);
  writeNotNull('element', instance.element);
  writeNotNull('elements', instance.elements?.map(toJsonT).toList());
  return val;
}
