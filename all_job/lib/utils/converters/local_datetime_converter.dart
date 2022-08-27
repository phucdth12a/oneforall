import 'package:json_annotation/json_annotation.dart';

class LocalDateTimeConverter implements JsonConverter<DateTime?, String?> {
  const LocalDateTimeConverter();

  @override
  DateTime? fromJson(String? value) =>
      value == null ? null : DateTime.parse(value).toLocal();

  @override
  String? toJson(DateTime? value) => value?.toUtc().toIso8601String();
}

class TimestampToDateTimeConverter implements JsonConverter<DateTime?, int?> {
  const TimestampToDateTimeConverter();
  @override
  DateTime? fromJson(int? value) =>
      value == null ? null : DateTime.fromMillisecondsSinceEpoch(value);

  @override
  int? toJson(DateTime? value) => value?.millisecondsSinceEpoch;
}

class TimestampToDateTimeConverterUTC
    implements JsonConverter<DateTime?, int?> {
  const TimestampToDateTimeConverterUTC();
  @override
  DateTime? fromJson(int? value) => value == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(value, isUtc: true);

  @override
  int? toJson(DateTime? value) => value?.millisecondsSinceEpoch;
}
