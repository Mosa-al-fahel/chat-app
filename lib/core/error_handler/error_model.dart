import 'package:json_annotation/json_annotation.dart';
part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  String? message;
  bool? status;
  ErrorModel({this.message, this.status});
  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
}

sealed class ApiResult<T> {
  ApiResult._();
  factory ApiResult.success(T data) = ApiSuccess<T>;
  factory ApiResult.failed(ErrorModel error) = ApiFailure<T>;
}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;
  ApiSuccess(this.data) : super._();
}

class ApiFailure<T> extends ApiResult<T> {
  final ErrorModel error;
  ApiFailure(this.error) : super._();
}
