import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import '../converters/local_datetime_converter.dart';

part 'job.g.dart';

@JsonSerializable()
class JobModel {
  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'content')
  String? content;

  @JsonKey(name: "location")
  String? location;

  /// thumb BE
  @JsonKey(name: "tags")
  List<String>? tags;

  @JsonKey(name: "salary")
  String? salary;

  @LocalDateTimeConverter()
  @JsonKey(name: "release")
  DateTime? release;

  @LocalDateTimeConverter()
  @JsonKey(name: "createdAt")
  DateTime? createdAt;

  @LocalDateTimeConverter()
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;

  @JsonKey(name: "avt")
  String? avt;

  JobModel({
    this.id,
    this.title,
    this.description,
    this.content,
    this.location,
    this.tags,
    this.salary,
    this.release,
    this.createdAt,
    this.updatedAt,
    this.avt,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);

  Map<String, dynamic> toJson() => _$JobModelToJson(this);

  String getDate() {
    var inputFormat = DateFormat('dd/MM/yyyy');
    return inputFormat.format(release ?? DateTime.now());
  }
}
