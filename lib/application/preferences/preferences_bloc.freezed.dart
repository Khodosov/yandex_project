// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'preferences_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PreferencesEventTearOff {
  const _$PreferencesEventTearOff();

  _ChangeTheme changeTheme({required ThemeMode themeMode}) {
    return _ChangeTheme(
      themeMode: themeMode,
    );
  }
}

/// @nodoc
const $PreferencesEvent = _$PreferencesEventTearOff();

/// @nodoc
mixin _$PreferencesEvent {
  ThemeMode get themeMode => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode themeMode) changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? changeTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTheme value) changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeTheme value)? changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTheme value)? changeTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PreferencesEventCopyWith<PreferencesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferencesEventCopyWith<$Res> {
  factory $PreferencesEventCopyWith(
          PreferencesEvent value, $Res Function(PreferencesEvent) then) =
      _$PreferencesEventCopyWithImpl<$Res>;
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class _$PreferencesEventCopyWithImpl<$Res>
    implements $PreferencesEventCopyWith<$Res> {
  _$PreferencesEventCopyWithImpl(this._value, this._then);

  final PreferencesEvent _value;
  // ignore: unused_field
  final $Res Function(PreferencesEvent) _then;

  @override
  $Res call({
    Object? themeMode = freezed,
  }) {
    return _then(_value.copyWith(
      themeMode: themeMode == freezed
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc
abstract class _$ChangeThemeCopyWith<$Res>
    implements $PreferencesEventCopyWith<$Res> {
  factory _$ChangeThemeCopyWith(
          _ChangeTheme value, $Res Function(_ChangeTheme) then) =
      __$ChangeThemeCopyWithImpl<$Res>;
  @override
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class __$ChangeThemeCopyWithImpl<$Res>
    extends _$PreferencesEventCopyWithImpl<$Res>
    implements _$ChangeThemeCopyWith<$Res> {
  __$ChangeThemeCopyWithImpl(
      _ChangeTheme _value, $Res Function(_ChangeTheme) _then)
      : super(_value, (v) => _then(v as _ChangeTheme));

  @override
  _ChangeTheme get _value => super._value as _ChangeTheme;

  @override
  $Res call({
    Object? themeMode = freezed,
  }) {
    return _then(_ChangeTheme(
      themeMode: themeMode == freezed
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

class _$_ChangeTheme implements _ChangeTheme {
  const _$_ChangeTheme({required this.themeMode});

  @override
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'PreferencesEvent.changeTheme(themeMode: $themeMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeTheme &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  @JsonKey(ignore: true)
  @override
  _$ChangeThemeCopyWith<_ChangeTheme> get copyWith =>
      __$ChangeThemeCopyWithImpl<_ChangeTheme>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode themeMode) changeTheme,
  }) {
    return changeTheme(themeMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? changeTheme,
  }) {
    return changeTheme?.call(themeMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? changeTheme,
    required TResult orElse(),
  }) {
    if (changeTheme != null) {
      return changeTheme(themeMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTheme value) changeTheme,
  }) {
    return changeTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeTheme value)? changeTheme,
  }) {
    return changeTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTheme value)? changeTheme,
    required TResult orElse(),
  }) {
    if (changeTheme != null) {
      return changeTheme(this);
    }
    return orElse();
  }
}

abstract class _ChangeTheme implements PreferencesEvent {
  const factory _ChangeTheme({required ThemeMode themeMode}) = _$_ChangeTheme;

  @override
  ThemeMode get themeMode;
  @override
  @JsonKey(ignore: true)
  _$ChangeThemeCopyWith<_ChangeTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
