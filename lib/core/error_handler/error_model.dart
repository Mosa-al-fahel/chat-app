import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel extends Equatable{
 final String? message;
  final bool? status;
  const ErrorModel({this.message, this.status});
  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  @override
  List<Object?> get props => [message,status];
      
}

sealed class ApiResult<T> extends Equatable {
  const ApiResult._();
  const factory ApiResult.success(T data) = ApiSuccess<T>;
  const factory ApiResult.failed(ErrorModel error) = ApiFailure<T>;
  @override
  List<Object?> get props => [];
}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;
  const ApiSuccess(this.data) : super._();
   @override
  List<Object?> get props => [data];
}

class ApiFailure<T> extends ApiResult<T> {
  final ErrorModel error;
 const ApiFailure(this.error) : super._();
  @override
  List<Object?> get props => [error];
}
