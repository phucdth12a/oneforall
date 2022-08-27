// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobModel _$JobModelFromJson(Map json) => JobModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
      location: json['location'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      salary: json['salary'] as String?,
      release:
          const LocalDateTimeConverter().fromJson(json['release'] as String?),
      createdAt:
          const LocalDateTimeConverter().fromJson(json['createdAt'] as String?),
      updatedAt:
          const LocalDateTimeConverter().fromJson(json['updatedAt'] as String?),
    );

Map<String, dynamic> _$JobModelToJson(JobModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('content', instance.content);
  writeNotNull('location', instance.location);
  writeNotNull('tags', instance.tags);
  writeNotNull('salary', instance.salary);
  writeNotNull(
      'release', const LocalDateTimeConverter().toJson(instance.release));
  writeNotNull(
      'createdAt', const LocalDateTimeConverter().toJson(instance.createdAt));
  writeNotNull(
      'updatedAt', const LocalDateTimeConverter().toJson(instance.updatedAt));
  return val;
}
