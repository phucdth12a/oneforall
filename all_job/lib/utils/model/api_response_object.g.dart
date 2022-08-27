// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIResponseObject<T> _$APIResponseObjectFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    APIResponseObject<T>(
      code: json['code'] as int?,
      status: json['status'] as String?,
      message: json['message'] as String?,
      element: (json['element'] as num?)?.toDouble(),
      elements: _$nullableGenericFromJson(json['elements'], fromJsonT),
    );

Map<String, dynamic> _$APIResponseObjectToJson<T>(
  APIResponseObject<T> instance,
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
  writeNotNull('message', instance.message);
  writeNotNull('element', instance.element);
  writeNotNull('elements', _$nullableGenericToJson(instance.elements, toJsonT));
  return val;
}

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
