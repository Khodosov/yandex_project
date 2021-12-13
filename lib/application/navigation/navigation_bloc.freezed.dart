// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'navigation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NavigationEventTearOff {
  const _$NavigationEventTearOff();

  _ChangeTab changeTab({required AppTab tab, required BuildContext context}) {
    return _ChangeTab(
      tab: tab,
      context: context,
    );
  }
}

/// @nodoc
const $NavigationEvent = _$NavigationEventTearOff();

/// @nodoc
mixin _$NavigationEvent {
  AppTab get tab => throw _privateConstructorUsedError;

  BuildContext get context => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppTab tab, BuildContext context) changeTab,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AppTab tab, BuildContext context)? changeTab,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppTab tab, BuildContext context)? changeTab,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTab value) changeTab,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeTab value)? changeTab,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTab value)? changeTab,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationEventCopyWith<NavigationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationEventCopyWith<$Res> {
  factory $NavigationEventCopyWith(
          NavigationEvent value, $Res Function(NavigationEvent) then) =
      _$NavigationEventCopyWithImpl<$Res>;

  $Res call({AppTab tab, BuildContext context});
}

/// @nodoc
class _$NavigationEventCopyWithImpl<$Res>
    implements $NavigationEventCopyWith<$Res> {
  _$NavigationEventCopyWithImpl(this._value, this._then);

  final NavigationEvent _value;

  // ignore: unused_field
  final $Res Function(NavigationEvent) _then;

  @override
  $Res call({
    Object? tab = freezed,
    Object? context = freezed,
  }) {
    return _then(_value.copyWith(
      tab: tab == freezed
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as AppTab,
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc
abstract class _$ChangeTabCopyWith<$Res>
    implements $NavigationEventCopyWith<$Res> {
  factory _$ChangeTabCopyWith(
          _ChangeTab value, $Res Function(_ChangeTab) then) =
      __$ChangeTabCopyWithImpl<$Res>;

  @override
  $Res call({AppTab tab, BuildContext context});
}

/// @nodoc
class __$ChangeTabCopyWithImpl<$Res> extends _$NavigationEventCopyWithImpl<$Res>
    implements _$ChangeTabCopyWith<$Res> {
  __$ChangeTabCopyWithImpl(_ChangeTab _value, $Res Function(_ChangeTab) _then)
      : super(_value, (v) => _then(v as _ChangeTab));

  @override
  _ChangeTab get _value => super._value as _ChangeTab;

  @override
  $Res call({
    Object? tab = freezed,
    Object? context = freezed,
  }) {
    return _then(_ChangeTab(
      tab: tab == freezed
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as AppTab,
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$_ChangeTab implements _ChangeTab {
  const _$_ChangeTab({required this.tab, required this.context});

  @override
  final AppTab tab;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'NavigationEvent.changeTab(tab: $tab, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeTab &&
            (identical(other.tab, tab) || other.tab == tab) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tab, context);

  @JsonKey(ignore: true)
  @override
  _$ChangeTabCopyWith<_ChangeTab> get copyWith =>
      __$ChangeTabCopyWithImpl<_ChangeTab>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppTab tab, BuildContext context) changeTab,
  }) {
    return changeTab(tab, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AppTab tab, BuildContext context)? changeTab,
  }) {
    return changeTab?.call(tab, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppTab tab, BuildContext context)? changeTab,
    required TResult orElse(),
  }) {
    if (changeTab != null) {
      return changeTab(tab, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTab value) changeTab,
  }) {
    return changeTab(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeTab value)? changeTab,
  }) {
    return changeTab?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTab value)? changeTab,
    required TResult orElse(),
  }) {
    if (changeTab != null) {
      return changeTab(this);
    }
    return orElse();
  }
}

abstract class _ChangeTab implements NavigationEvent {
  const factory _ChangeTab(
      {required AppTab tab, required BuildContext context}) = _$_ChangeTab;

  @override
  AppTab get tab;

  @override
  BuildContext get context;

  @override
  @JsonKey(ignore: true)
  _$ChangeTabCopyWith<_ChangeTab> get copyWith =>
      throw _privateConstructorUsedError;
}
