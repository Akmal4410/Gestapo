// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigationScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int newPage) onPageChanged,
    required TResult Function() initialPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int newPage)? onPageChanged,
    TResult? Function()? initialPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int newPage)? onPageChanged,
    TResult Function()? initialPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnPageChanged value) onPageChanged,
    required TResult Function(InitialPage value) initialPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnPageChanged value)? onPageChanged,
    TResult? Function(InitialPage value)? initialPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnPageChanged value)? onPageChanged,
    TResult Function(InitialPage value)? initialPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationScreenEventCopyWith<$Res> {
  factory $NavigationScreenEventCopyWith(NavigationScreenEvent value,
          $Res Function(NavigationScreenEvent) then) =
      _$NavigationScreenEventCopyWithImpl<$Res, NavigationScreenEvent>;
}

/// @nodoc
class _$NavigationScreenEventCopyWithImpl<$Res,
        $Val extends NavigationScreenEvent>
    implements $NavigationScreenEventCopyWith<$Res> {
  _$NavigationScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnPageChangedCopyWith<$Res> {
  factory _$$OnPageChangedCopyWith(
          _$OnPageChanged value, $Res Function(_$OnPageChanged) then) =
      __$$OnPageChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({int newPage});
}

/// @nodoc
class __$$OnPageChangedCopyWithImpl<$Res>
    extends _$NavigationScreenEventCopyWithImpl<$Res, _$OnPageChanged>
    implements _$$OnPageChangedCopyWith<$Res> {
  __$$OnPageChangedCopyWithImpl(
      _$OnPageChanged _value, $Res Function(_$OnPageChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPage = null,
  }) {
    return _then(_$OnPageChanged(
      newPage: null == newPage
          ? _value.newPage
          : newPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OnPageChanged implements OnPageChanged {
  const _$OnPageChanged({required this.newPage});

  @override
  final int newPage;

  @override
  String toString() {
    return 'NavigationScreenEvent.onPageChanged(newPage: $newPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnPageChanged &&
            (identical(other.newPage, newPage) || other.newPage == newPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnPageChangedCopyWith<_$OnPageChanged> get copyWith =>
      __$$OnPageChangedCopyWithImpl<_$OnPageChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int newPage) onPageChanged,
    required TResult Function() initialPage,
  }) {
    return onPageChanged(newPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int newPage)? onPageChanged,
    TResult? Function()? initialPage,
  }) {
    return onPageChanged?.call(newPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int newPage)? onPageChanged,
    TResult Function()? initialPage,
    required TResult orElse(),
  }) {
    if (onPageChanged != null) {
      return onPageChanged(newPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnPageChanged value) onPageChanged,
    required TResult Function(InitialPage value) initialPage,
  }) {
    return onPageChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnPageChanged value)? onPageChanged,
    TResult? Function(InitialPage value)? initialPage,
  }) {
    return onPageChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnPageChanged value)? onPageChanged,
    TResult Function(InitialPage value)? initialPage,
    required TResult orElse(),
  }) {
    if (onPageChanged != null) {
      return onPageChanged(this);
    }
    return orElse();
  }
}

abstract class OnPageChanged implements NavigationScreenEvent {
  const factory OnPageChanged({required final int newPage}) = _$OnPageChanged;

  int get newPage;
  @JsonKey(ignore: true)
  _$$OnPageChangedCopyWith<_$OnPageChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialPageCopyWith<$Res> {
  factory _$$InitialPageCopyWith(
          _$InitialPage value, $Res Function(_$InitialPage) then) =
      __$$InitialPageCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialPageCopyWithImpl<$Res>
    extends _$NavigationScreenEventCopyWithImpl<$Res, _$InitialPage>
    implements _$$InitialPageCopyWith<$Res> {
  __$$InitialPageCopyWithImpl(
      _$InitialPage _value, $Res Function(_$InitialPage) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialPage implements InitialPage {
  const _$InitialPage();

  @override
  String toString() {
    return 'NavigationScreenEvent.initialPage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int newPage) onPageChanged,
    required TResult Function() initialPage,
  }) {
    return initialPage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int newPage)? onPageChanged,
    TResult? Function()? initialPage,
  }) {
    return initialPage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int newPage)? onPageChanged,
    TResult Function()? initialPage,
    required TResult orElse(),
  }) {
    if (initialPage != null) {
      return initialPage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnPageChanged value) onPageChanged,
    required TResult Function(InitialPage value) initialPage,
  }) {
    return initialPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnPageChanged value)? onPageChanged,
    TResult? Function(InitialPage value)? initialPage,
  }) {
    return initialPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnPageChanged value)? onPageChanged,
    TResult Function(InitialPage value)? initialPage,
    required TResult orElse(),
  }) {
    if (initialPage != null) {
      return initialPage(this);
    }
    return orElse();
  }
}

abstract class InitialPage implements NavigationScreenEvent {
  const factory InitialPage() = _$InitialPage;
}

/// @nodoc
mixin _$NavigationScreenState {
  int get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationScreenStateCopyWith<NavigationScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationScreenStateCopyWith<$Res> {
  factory $NavigationScreenStateCopyWith(NavigationScreenState value,
          $Res Function(NavigationScreenState) then) =
      _$NavigationScreenStateCopyWithImpl<$Res, NavigationScreenState>;
  @useResult
  $Res call({int page});
}

/// @nodoc
class _$NavigationScreenStateCopyWithImpl<$Res,
        $Val extends NavigationScreenState>
    implements $NavigationScreenStateCopyWith<$Res> {
  _$NavigationScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NavigationScreenStateCopyWith<$Res>
    implements $NavigationScreenStateCopyWith<$Res> {
  factory _$$_NavigationScreenStateCopyWith(_$_NavigationScreenState value,
          $Res Function(_$_NavigationScreenState) then) =
      __$$_NavigationScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$_NavigationScreenStateCopyWithImpl<$Res>
    extends _$NavigationScreenStateCopyWithImpl<$Res, _$_NavigationScreenState>
    implements _$$_NavigationScreenStateCopyWith<$Res> {
  __$$_NavigationScreenStateCopyWithImpl(_$_NavigationScreenState _value,
      $Res Function(_$_NavigationScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$_NavigationScreenState(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_NavigationScreenState implements _NavigationScreenState {
  const _$_NavigationScreenState({required this.page});

  @override
  final int page;

  @override
  String toString() {
    return 'NavigationScreenState(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NavigationScreenState &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NavigationScreenStateCopyWith<_$_NavigationScreenState> get copyWith =>
      __$$_NavigationScreenStateCopyWithImpl<_$_NavigationScreenState>(
          this, _$identity);
}

abstract class _NavigationScreenState implements NavigationScreenState {
  const factory _NavigationScreenState({required final int page}) =
      _$_NavigationScreenState;

  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_NavigationScreenStateCopyWith<_$_NavigationScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
