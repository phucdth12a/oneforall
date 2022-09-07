import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import '../converters/local_datetime_converter.dart';

part 'n100.g.dart';

@JsonSerializable()
class N100Model {
  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'PN100')
  String? pn100;

  @JsonKey(name: 'NV102')
  String? nv102;

  @JsonKey(name: 'NV104')
  String? nv104;

  @LocalDateTimeConverter()
  @JsonKey(name: "createdAt")
  DateTime? createdAt;

  @LocalDateTimeConverter()
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;

  N100Model({
    this.id,
    this.pn100,
    this.nv102,
    this.nv104,
    this.createdAt,
    this.updatedAt,
  });

  factory N100Model.fromJson(Map<String, dynamic> json) =>
      _$N100ModelFromJson(json);

  Map<String, dynamic> toJson() => _$N100ModelToJson(this);
}
