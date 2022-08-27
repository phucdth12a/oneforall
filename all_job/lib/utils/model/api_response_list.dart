import 'package:json_annotation/json_annotation.dart';

part 'api_response_list.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class APIResponseList<T> {
  @JsonKey(name: 'code')
  int? code;

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'message', ignore: true)
  String? message;

  @JsonKey(name: 'element')
  double? element;

  @JsonKey(name: 'elements')
  List<T>? elements;

  APIResponseList({
    this.code,
    this.status,
    this.message,
    this.element,
    this.elements,
  });

  factory APIResponseList.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    try {
      return _$APIResponseListFromJson(json, fromJsonT);
    } catch (e) {
      print("APIResponseList error $e");
      return APIResponseList();
    }
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$APIResponseListToJson(this, toJsonT);
}
