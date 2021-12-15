// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FailureTearOff {
  const _$FailureTearOff();

  _ServerError serverError([Object? error]) {
    return _ServerError(
      error,
    );
  }

  _NotFound notFound() {
    return const _NotFound();
  }

  _BadConnection badConnection() {
    return const _BadConnection();
  }

  _DataBaseError dataBaseError() {
    return const _DataBaseError();
  }
}

/// @nodoc
const $Failure = _$FailureTearOff();

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error) serverError,
    required TResult Function() notFound,
    required TResult Function() badConnection,
    required TResult Function() dataBaseError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Object? error)? serverError,
    TResult Function()? notFound,
    TResult Function()? badConnection,
    TResult Function()? dataBaseError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? serverError,
    TResult Function()? notFound,
    TResult Function()? badConnection,
    TResult Function()? dataBaseError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadConnection value) badConnection,
    required TResult Function(_DataBaseError value) dataBaseError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadConnection value)? badConnection,
    TResult Function(_DataBaseError value)? dataBaseError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadConnection value)? badConnection,
    TResult Function(_DataBaseError value)? dataBaseError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  final Failure _value;
  // ignore: unused_field
  final $Res Function(Failure) _then;
}

/// @nodoc
abstract class _$ServerErrorCopyWith<$Res> {
  factory _$ServerErrorCopyWith(
          _ServerError value, $Res Function(_ServerError) then) =
      __$ServerErrorCopyWithImpl<$Res>;
  $Res call({Object? error});
}

/// @nodoc
class __$ServerErrorCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$ServerErrorCopyWith<$Res> {
  __$ServerErrorCopyWithImpl(
      _ServerError _value, $Res Function(_ServerError) _then)
      : super(_value, (v) => _then(v as _ServerError));

  @override
  _ServerError get _value => super._value as _ServerError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_ServerError(
      error == freezed ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$_ServerError implements _ServerError {
  const _$_ServerError([this.error]);

  @override
  final Object? error;

  @override
  String toString() {
    return 'Failure.serverError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServerError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$ServerErrorCopyWith<_ServerError> get copyWith =>
      __$ServerErrorCopyWithImpl<_ServerError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error) serverError,
    required TResult Function() notFound,
    required TResult Function() badConnection,
    required TResult Function() dataBaseError,
  }) {
    return serverError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Object? error)? serverError,
    TResult Function()? notFound,
    TResult Function()? badConnection,
    TResult Function()? dataBaseError,
  }) {
    return serverError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? serverError,
    TResult Function()? notFound,
    TResult Function()? badConnection,
    TResult Function()? dataBaseError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadConnection value) badConnection,
    required TResult Function(_DataBaseError value) dataBaseError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadConnection value)? badConnection,
    TResult Function(_DataBaseError value)? dataBaseError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadConnection value)? badConnection,
    TResult Function(_DataBaseError value)? dataBaseError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements Failure {
  const factory _ServerError([Object? error]) = _$_ServerError;

  Object? get error;
  @JsonKey(ignore: true)
  _$ServerErrorCopyWith<_ServerError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NotFoundCopyWith<$Res> {
  factory _$NotFoundCopyWith(_NotFound value, $Res Function(_NotFound) then) =
      __$NotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$NotFoundCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$NotFoundCopyWith<$Res> {
  __$NotFoundCopyWithImpl(_NotFound _value, $Res Function(_NotFound) _then)
      : super(_value, (v) => _then(v as _NotFound));

  @override
  _NotFound get _value => super._value as _NotFound;
}

/// @nodoc

class _$_NotFound implements _NotFound {
  const _$_NotFound();

  @override
  String toString() {
    return 'Failure.notFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error) serverError,
    required TResult Function() notFound,
    required TResult Function() badConnection,
    required TResult Function() dataBaseError,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Object? error)? serverError,
    TResult Function()? notFound,
    TResult Function()? badConnection,
    TResult Function()? dataBaseError,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? serverError,
    TResult Function()? notFound,
    TResult Function()? badConnection,
    TResult Function()? dataBaseError,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadConnection value) badConnection,
    required TResult Function(_DataBaseError value) dataBaseError,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadConnection value)? badConnection,
    TResult Function(_DataBaseError value)? dataBaseError,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadConnection value)? badConnection,
    TResult Function(_DataBaseError value)? dataBaseError,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound implements Failure {
  const factory _NotFound() = _$_NotFound;
}

/// @nodoc
abstract class _$BadConnectionCopyWith<$Res> {
  factory _$BadConnectionCopyWith(
          _BadConnection value, $Res Function(_BadConnection) then) =
      __$BadConnectionCopyWithImpl<$Res>;
}

/// @nodoc
class __$BadConnectionCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$BadConnectionCopyWith<$Res> {
  __$BadConnectionCopyWithImpl(
      _BadConnection _value, $Res Function(_BadConnection) _then)
      : super(_value, (v) => _then(v as _BadConnection));

  @override
  _BadConnection get _value => super._value as _BadConnection;
}

/// @nodoc

class _$_BadConnection implements _BadConnection {
  const _$_BadConnection();

  @override
  String toString() {
    return 'Failure.badConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BadConnection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error) serverError,
    required TResult Function() notFound,
    required TResult Function() badConnection,
    required TResult Function() dataBaseError,
  }) {
    return badConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Object? error)? serverError,
    TResult Function()? notFound,
    TResult Function()? badConnection,
    TResult Function()? dataBaseError,
  }) {
    return badConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? serverError,
    TResult Function()? notFound,
    TResult Function()? badConnection,
    TResult Function()? dataBaseError,
    required TResult orElse(),
  }) {
    if (badConnection != null) {
      return badConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadConnection value) badConnection,
    required TResult Function(_DataBaseError value) dataBaseError,
  }) {
    return badConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadConnection value)? badConnection,
    TResult Function(_DataBaseError value)? dataBaseError,
  }) {
    return badConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadConnection value)? badConnection,
    TResult Function(_DataBaseError value)? dataBaseError,
    required TResult orElse(),
  }) {
    if (badConnection != null) {
      return badConnection(this);
    }
    return orElse();
  }
}

abstract class _BadConnection implements Failure {
  const factory _BadConnection() = _$_BadConnection;
}

/// @nodoc
abstract class _$DataBaseErrorCopyWith<$Res> {
  factory _$DataBaseErrorCopyWith(
          _DataBaseError value, $Res Function(_DataBaseError) then) =
      __$DataBaseErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$DataBaseErrorCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$DataBaseErrorCopyWith<$Res> {
  __$DataBaseErrorCopyWithImpl(
      _DataBaseError _value, $Res Function(_DataBaseError) _then)
      : super(_value, (v) => _then(v as _DataBaseError));

  @override
  _DataBaseError get _value => super._value as _DataBaseError;
}

/// @nodoc

class _$_DataBaseError implements _DataBaseError {
  const _$_DataBaseError();

  @override
  String toString() {
    return 'Failure.dataBaseError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DataBaseError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error) serverError,
    required TResult Function() notFound,
    required TResult Function() badConnection,
    required TResult Function() dataBaseError,
  }) {
    return dataBaseError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Object? error)? serverError,
    TResult Function()? notFound,
    TResult Function()? badConnection,
    TResult Function()? dataBaseError,
  }) {
    return dataBaseError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? serverError,
    TResult Function()? notFound,
    TResult Function()? badConnection,
    TResult Function()? dataBaseError,
    required TResult orElse(),
  }) {
    if (dataBaseError != null) {
      return dataBaseError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadConnection value) badConnection,
    required TResult Function(_DataBaseError value) dataBaseError,
  }) {
    return dataBaseError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadConnection value)? badConnection,
    TResult Function(_DataBaseError value)? dataBaseError,
  }) {
    return dataBaseError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadConnection value)? badConnection,
    TResult Function(_DataBaseError value)? dataBaseError,
    required TResult orElse(),
  }) {
    if (dataBaseError != null) {
      return dataBaseError(this);
    }
    return orElse();
  }
}

abstract class _DataBaseError implements Failure {
  const factory _DataBaseError() = _$_DataBaseError;
}
