import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {

  const factory Failure.serverError([Object? error]) = _ServerError;

  const factory Failure.notFound() = _NotFound;

  const factory Failure.badConnection() = _BadConnection;

  const factory Failure.dataBaseError() = _DataBaseError;
}