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

  _ChangeSearchMode changeSearchMode({required bool mode}) {
    return _ChangeSearchMode(
      mode: mode,
    );
  }
}

/// @nodoc
const $PreferencesEvent = _$PreferencesEventTearOff();

/// @nodoc
mixin _$PreferencesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode themeMode) changeTheme,
    required TResult Function(bool mode) changeSearchMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? changeTheme,
    TResult Function(bool mode)? changeSearchMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? changeTheme,
    TResult Function(bool mode)? changeSearchMode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTheme value) changeTheme,
    required TResult Function(_ChangeSearchMode value) changeSearchMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeTheme value)? changeTheme,
    TResult Function(_ChangeSearchMode value)? changeSearchMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTheme value)? changeTheme,
    TResult Function(_ChangeSearchMode value)? changeSearchMode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferencesEventCopyWith<$Res> {
  factory $PreferencesEventCopyWith(
          PreferencesEvent value, $Res Function(PreferencesEvent) then) =
      _$PreferencesEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PreferencesEventCopyWithImpl<$Res>
    implements $PreferencesEventCopyWith<$Res> {
  _$PreferencesEventCopyWithImpl(this._value, this._then);

  final PreferencesEvent _value;
  // ignore: unused_field
  final $Res Function(PreferencesEvent) _then;
}

/// @nodoc
abstract class _$ChangeThemeCopyWith<$Res> {
  factory _$ChangeThemeCopyWith(
          _ChangeTheme value, $Res Function(_ChangeTheme) then) =
      __$ChangeThemeCopyWithImpl<$Res>;
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
    required TResult Function(bool mode) changeSearchMode,
  }) {
    return changeTheme(themeMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? changeTheme,
    TResult Function(bool mode)? changeSearchMode,
  }) {
    return changeTheme?.call(themeMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? changeTheme,
    TResult Function(bool mode)? changeSearchMode,
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
    required TResult Function(_ChangeSearchMode value) changeSearchMode,
  }) {
    return changeTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeTheme value)? changeTheme,
    TResult Function(_ChangeSearchMode value)? changeSearchMode,
  }) {
    return changeTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTheme value)? changeTheme,
    TResult Function(_ChangeSearchMode value)? changeSearchMode,
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

  ThemeMode get themeMode;
  @JsonKey(ignore: true)
  _$ChangeThemeCopyWith<_ChangeTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ChangeSearchModeCopyWith<$Res> {
  factory _$ChangeSearchModeCopyWith(
          _ChangeSearchMode value, $Res Function(_ChangeSearchMode) then) =
      __$ChangeSearchModeCopyWithImpl<$Res>;
  $Res call({bool mode});
}

/// @nodoc
class __$ChangeSearchModeCopyWithImpl<$Res>
    extends _$PreferencesEventCopyWithImpl<$Res>
    implements _$ChangeSearchModeCopyWith<$Res> {
  __$ChangeSearchModeCopyWithImpl(
      _ChangeSearchMode _value, $Res Function(_ChangeSearchMode) _then)
      : super(_value, (v) => _then(v as _ChangeSearchMode));

  @override
  _ChangeSearchMode get _value => super._value as _ChangeSearchMode;

  @override
  $Res call({
    Object? mode = freezed,
  }) {
    return _then(_ChangeSearchMode(
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ChangeSearchMode implements _ChangeSearchMode {
  const _$_ChangeSearchMode({required this.mode});

  @override
  final bool mode;

  @override
  String toString() {
    return 'PreferencesEvent.changeSearchMode(mode: $mode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeSearchMode &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode);

  @JsonKey(ignore: true)
  @override
  _$ChangeSearchModeCopyWith<_ChangeSearchMode> get copyWith =>
      __$ChangeSearchModeCopyWithImpl<_ChangeSearchMode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode themeMode) changeTheme,
    required TResult Function(bool mode) changeSearchMode,
  }) {
    return changeSearchMode(mode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? changeTheme,
    TResult Function(bool mode)? changeSearchMode,
  }) {
    return changeSearchMode?.call(mode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? changeTheme,
    TResult Function(bool mode)? changeSearchMode,
    required TResult orElse(),
  }) {
    if (changeSearchMode != null) {
      return changeSearchMode(mode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTheme value) changeTheme,
    required TResult Function(_ChangeSearchMode value) changeSearchMode,
  }) {
    return changeSearchMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeTheme value)? changeTheme,
    TResult Function(_ChangeSearchMode value)? changeSearchMode,
  }) {
    return changeSearchMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTheme value)? changeTheme,
    TResult Function(_ChangeSearchMode value)? changeSearchMode,
    required TResult orElse(),
  }) {
    if (changeSearchMode != null) {
      return changeSearchMode(this);
    }
    return orElse();
  }
}

abstract class _ChangeSearchMode implements PreferencesEvent {
  const factory _ChangeSearchMode({required bool mode}) = _$_ChangeSearchMode;

  bool get mode;
  @JsonKey(ignore: true)
  _$ChangeSearchModeCopyWith<_ChangeSearchMode> get copyWith =>
      throw _privateConstructorUsedError;
}
