// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ResultTearOff {
  const _$ResultTearOff();

  Ok<V, E> ok<V, E>(V value) {
    return Ok<V, E>(
      value,
    );
  }

  Err<V, E> err<V, E>(E error) {
    return Err<V, E>(
      error,
    );
  }
}

/// @nodoc
const $Result = _$ResultTearOff();

/// @nodoc
mixin _$Result<V, E> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(V value) ok,
    required TResult Function(E error) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(V value)? ok,
    TResult Function(E error)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(V value)? ok,
    TResult Function(E error)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Ok<V, E> value) ok,
    required TResult Function(Err<V, E> value) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Ok<V, E> value)? ok,
    TResult Function(Err<V, E> value)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<V, E> value)? ok,
    TResult Function(Err<V, E> value)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<V, E, $Res> {
  factory $ResultCopyWith(
          Result<V, E> value, $Res Function(Result<V, E>) then) =
      _$ResultCopyWithImpl<V, E, $Res>;
}

/// @nodoc
class _$ResultCopyWithImpl<V, E, $Res> implements $ResultCopyWith<V, E, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result<V, E> _value;
  // ignore: unused_field
  final $Res Function(Result<V, E>) _then;
}

/// @nodoc
abstract class $OkCopyWith<V, E, $Res> {
  factory $OkCopyWith(Ok<V, E> value, $Res Function(Ok<V, E>) then) =
      _$OkCopyWithImpl<V, E, $Res>;
  $Res call({V value});
}

/// @nodoc
class _$OkCopyWithImpl<V, E, $Res> extends _$ResultCopyWithImpl<V, E, $Res>
    implements $OkCopyWith<V, E, $Res> {
  _$OkCopyWithImpl(Ok<V, E> _value, $Res Function(Ok<V, E>) _then)
      : super(_value, (v) => _then(v as Ok<V, E>));

  @override
  Ok<V, E> get _value => super._value as Ok<V, E>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(Ok<V, E>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as V,
    ));
  }
}

/// @nodoc
class _$Ok<V, E> implements Ok<V, E> {
  _$Ok(this.value);

  @override
  final V value;

  @override
  String toString() {
    return 'Result<$V, $E>.ok(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Ok<V, E> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  $OkCopyWith<V, E, Ok<V, E>> get copyWith =>
      _$OkCopyWithImpl<V, E, Ok<V, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(V value) ok,
    required TResult Function(E error) err,
  }) {
    return ok(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(V value)? ok,
    TResult Function(E error)? err,
  }) {
    return ok?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(V value)? ok,
    TResult Function(E error)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Ok<V, E> value) ok,
    required TResult Function(Err<V, E> value) err,
  }) {
    return ok(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Ok<V, E> value)? ok,
    TResult Function(Err<V, E> value)? err,
  }) {
    return ok?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<V, E> value)? ok,
    TResult Function(Err<V, E> value)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(this);
    }
    return orElse();
  }
}

abstract class Ok<V, E> implements Result<V, E> {
  factory Ok(V value) = _$Ok<V, E>;

  V get value;
  @JsonKey(ignore: true)
  $OkCopyWith<V, E, Ok<V, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrCopyWith<V, E, $Res> {
  factory $ErrCopyWith(Err<V, E> value, $Res Function(Err<V, E>) then) =
      _$ErrCopyWithImpl<V, E, $Res>;
  $Res call({E error});
}

/// @nodoc
class _$ErrCopyWithImpl<V, E, $Res> extends _$ResultCopyWithImpl<V, E, $Res>
    implements $ErrCopyWith<V, E, $Res> {
  _$ErrCopyWithImpl(Err<V, E> _value, $Res Function(Err<V, E>) _then)
      : super(_value, (v) => _then(v as Err<V, E>));

  @override
  Err<V, E> get _value => super._value as Err<V, E>;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(Err<V, E>(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc

class _$Err<V, E> implements Err<V, E> {
  _$Err(this.error);

  @override
  final E error;

  @override
  String toString() {
    return 'Result<$V, $E>.err(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Err<V, E> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $ErrCopyWith<V, E, Err<V, E>> get copyWith =>
      _$ErrCopyWithImpl<V, E, Err<V, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(V value) ok,
    required TResult Function(E error) err,
  }) {
    return err(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(V value)? ok,
    TResult Function(E error)? err,
  }) {
    return err?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(V value)? ok,
    TResult Function(E error)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Ok<V, E> value) ok,
    required TResult Function(Err<V, E> value) err,
  }) {
    return err(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Ok<V, E> value)? ok,
    TResult Function(Err<V, E> value)? err,
  }) {
    return err?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<V, E> value)? ok,
    TResult Function(Err<V, E> value)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(this);
    }
    return orElse();
  }
}

abstract class Err<V, E> implements Result<V, E> {
  factory Err(E error) = _$Err<V, E>;

  E get error;
  @JsonKey(ignore: true)
  $ErrCopyWith<V, E, Err<V, E>> get copyWith =>
      throw _privateConstructorUsedError;
}
