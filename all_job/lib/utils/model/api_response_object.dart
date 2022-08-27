import 'package:json_annotation/json_annotation.dart';

part 'api_response_object.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class APIResponseObject<T> {
  @JsonKey(name: 'code')
  int? code;

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'element')
  double? element;

  @JsonKey(name: 'elements')
  T? elements;

  APIResponseObject({
    this.code,
    this.status,
    this.message,
    this.element,
    this.elements,
  });

  factory APIResponseObject.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    try {
      return _$APIResponseObjectFromJson(json, fromJsonT);
    } catch (e) {
      print("APIResponseObject error $e");
      return APIResponseObject();
    }
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$APIResponseObjectToJson(this, toJsonT);
}
