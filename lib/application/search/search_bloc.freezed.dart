// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchEventTearOff {
  const _$SearchEventTearOff();

  _SearchByName searchByName({required String name}) {
    return _SearchByName(
      name: name,
    );
  }

  _RandomCocktail randomCocktail() {
    return const _RandomCocktail();
  }

  _RandomSelectionCocktail randomSelectionCocktail() {
    return const _RandomSelectionCocktail();
  }
}

/// @nodoc
const $SearchEvent = _$SearchEventTearOff();

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) searchByName,
    required TResult Function() randomCocktail,
    required TResult Function() randomSelectionCocktail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? searchByName,
    TResult Function()? randomCocktail,
    TResult Function()? randomSelectionCocktail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? searchByName,
    TResult Function()? randomCocktail,
    TResult Function()? randomSelectionCocktail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchByName value) searchByName,
    required TResult Function(_RandomCocktail value) randomCocktail,
    required TResult Function(_RandomSelectionCocktail value)
        randomSelectionCocktail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchByName value)? searchByName,
    TResult Function(_RandomCocktail value)? randomCocktail,
    TResult Function(_RandomSelectionCocktail value)? randomSelectionCocktail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchByName value)? searchByName,
    TResult Function(_RandomCocktail value)? randomCocktail,
    TResult Function(_RandomSelectionCocktail value)? randomSelectionCocktail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res> implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  final SearchEvent _value;
  // ignore: unused_field
  final $Res Function(SearchEvent) _then;
}

/// @nodoc
abstract class _$SearchByNameCopyWith<$Res> {
  factory _$SearchByNameCopyWith(
          _SearchByName value, $Res Function(_SearchByName) then) =
      __$SearchByNameCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class __$SearchByNameCopyWithImpl<$Res> extends _$SearchEventCopyWithImpl<$Res>
    implements _$SearchByNameCopyWith<$Res> {
  __$SearchByNameCopyWithImpl(
      _SearchByName _value, $Res Function(_SearchByName) _then)
      : super(_value, (v) => _then(v as _SearchByName));

  @override
  _SearchByName get _value => super._value as _SearchByName;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_SearchByName(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchByName implements _SearchByName {
  const _$_SearchByName({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'SearchEvent.searchByName(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchByName &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  _$SearchByNameCopyWith<_SearchByName> get copyWith =>
      __$SearchByNameCopyWithImpl<_SearchByName>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) searchByName,
    required TResult Function() randomCocktail,
    required TResult Function() randomSelectionCocktail,
  }) {
    return searchByName(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? searchByName,
    TResult Function()? randomCocktail,
    TResult Function()? randomSelectionCocktail,
  }) {
    return searchByName?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? searchByName,
    TResult Function()? randomCocktail,
    TResult Function()? randomSelectionCocktail,
    required TResult orElse(),
  }) {
    if (searchByName != null) {
      return searchByName(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchByName value) searchByName,
    required TResult Function(_RandomCocktail value) randomCocktail,
    required TResult Function(_RandomSelectionCocktail value)
        randomSelectionCocktail,
  }) {
    return searchByName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchByName value)? searchByName,
    TResult Function(_RandomCocktail value)? randomCocktail,
    TResult Function(_RandomSelectionCocktail value)? randomSelectionCocktail,
  }) {
    return searchByName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchByName value)? searchByName,
    TResult Function(_RandomCocktail value)? randomCocktail,
    TResult Function(_RandomSelectionCocktail value)? randomSelectionCocktail,
    required TResult orElse(),
  }) {
    if (searchByName != null) {
      return searchByName(this);
    }
    return orElse();
  }
}

abstract class _SearchByName implements SearchEvent {
  const factory _SearchByName({required String name}) = _$_SearchByName;

  String get name;
  @JsonKey(ignore: true)
  _$SearchByNameCopyWith<_SearchByName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RandomCocktailCopyWith<$Res> {
  factory _$RandomCocktailCopyWith(
          _RandomCocktail value, $Res Function(_RandomCocktail) then) =
      __$RandomCocktailCopyWithImpl<$Res>;
}

/// @nodoc
class __$RandomCocktailCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res>
    implements _$RandomCocktailCopyWith<$Res> {
  __$RandomCocktailCopyWithImpl(
      _RandomCocktail _value, $Res Function(_RandomCocktail) _then)
      : super(_value, (v) => _then(v as _RandomCocktail));

  @override
  _RandomCocktail get _value => super._value as _RandomCocktail;
}

/// @nodoc

class _$_RandomCocktail implements _RandomCocktail {
  const _$_RandomCocktail();

  @override
  String toString() {
    return 'SearchEvent.randomCocktail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RandomCocktail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) searchByName,
    required TResult Function() randomCocktail,
    required TResult Function() randomSelectionCocktail,
  }) {
    return randomCocktail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? searchByName,
    TResult Function()? randomCocktail,
    TResult Function()? randomSelectionCocktail,
  }) {
    return randomCocktail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? searchByName,
    TResult Function()? randomCocktail,
    TResult Function()? randomSelectionCocktail,
    required TResult orElse(),
  }) {
    if (randomCocktail != null) {
      return randomCocktail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchByName value) searchByName,
    required TResult Function(_RandomCocktail value) randomCocktail,
    required TResult Function(_RandomSelectionCocktail value)
        randomSelectionCocktail,
  }) {
    return randomCocktail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchByName value)? searchByName,
    TResult Function(_RandomCocktail value)? randomCocktail,
    TResult Function(_RandomSelectionCocktail value)? randomSelectionCocktail,
  }) {
    return randomCocktail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchByName value)? searchByName,
    TResult Function(_RandomCocktail value)? randomCocktail,
    TResult Function(_RandomSelectionCocktail value)? randomSelectionCocktail,
    required TResult orElse(),
  }) {
    if (randomCocktail != null) {
      return randomCocktail(this);
    }
    return orElse();
  }
}

abstract class _RandomCocktail implements SearchEvent {
  const factory _RandomCocktail() = _$_RandomCocktail;
}

/// @nodoc
abstract class _$RandomSelectionCocktailCopyWith<$Res> {
  factory _$RandomSelectionCocktailCopyWith(_RandomSelectionCocktail value,
          $Res Function(_RandomSelectionCocktail) then) =
      __$RandomSelectionCocktailCopyWithImpl<$Res>;
}

/// @nodoc
class __$RandomSelectionCocktailCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res>
    implements _$RandomSelectionCocktailCopyWith<$Res> {
  __$RandomSelectionCocktailCopyWithImpl(_RandomSelectionCocktail _value,
      $Res Function(_RandomSelectionCocktail) _then)
      : super(_value, (v) => _then(v as _RandomSelectionCocktail));

  @override
  _RandomSelectionCocktail get _value =>
      super._value as _RandomSelectionCocktail;
}

/// @nodoc

class _$_RandomSelectionCocktail implements _RandomSelectionCocktail {
  const _$_RandomSelectionCocktail();

  @override
  String toString() {
    return 'SearchEvent.randomSelectionCocktail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RandomSelectionCocktail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) searchByName,
    required TResult Function() randomCocktail,
    required TResult Function() randomSelectionCocktail,
  }) {
    return randomSelectionCocktail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? searchByName,
    TResult Function()? randomCocktail,
    TResult Function()? randomSelectionCocktail,
  }) {
    return randomSelectionCocktail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? searchByName,
    TResult Function()? randomCocktail,
    TResult Function()? randomSelectionCocktail,
    required TResult orElse(),
  }) {
    if (randomSelectionCocktail != null) {
      return randomSelectionCocktail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchByName value) searchByName,
    required TResult Function(_RandomCocktail value) randomCocktail,
    required TResult Function(_RandomSelectionCocktail value)
        randomSelectionCocktail,
  }) {
    return randomSelectionCocktail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchByName value)? searchByName,
    TResult Function(_RandomCocktail value)? randomCocktail,
    TResult Function(_RandomSelectionCocktail value)? randomSelectionCocktail,
  }) {
    return randomSelectionCocktail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchByName value)? searchByName,
    TResult Function(_RandomCocktail value)? randomCocktail,
    TResult Function(_RandomSelectionCocktail value)? randomSelectionCocktail,
    required TResult orElse(),
  }) {
    if (randomSelectionCocktail != null) {
      return randomSelectionCocktail(this);
    }
    return orElse();
  }
}

abstract class _RandomSelectionCocktail implements SearchEvent {
  const factory _RandomSelectionCocktail() = _$_RandomSelectionCocktail;
}
