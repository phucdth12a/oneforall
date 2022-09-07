// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'n100.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

N100Model _$N100ModelFromJson(Map json) => N100Model(
      id: json['_id'] as String?,
      pn100: json['PN100'] as String?,
      nv102: json['NV102'] as String?,
      nv104: json['NV104'] as String?,
      createdAt:
          const LocalDateTimeConverter().fromJson(json['createdAt'] as String?),
      updatedAt:
          const LocalDateTimeConverter().fromJson(json['updatedAt'] as String?),
    );

Map<String, dynamic> _$N100ModelToJson(N100Model instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('PN100', instance.pn100);
  writeNotNull('NV102', instance.nv102);
  writeNotNull('NV104', instance.nv104);
  writeNotNull(
      'createdAt', const LocalDateTimeConverter().toJson(instance.createdAt));
  writeNotNull(
      'updatedAt', const LocalDateTimeConverter().toJson(instance.updatedAt));
  return val;
}
