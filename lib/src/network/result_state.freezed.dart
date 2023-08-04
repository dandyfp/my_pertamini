// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResultState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) data,
    required TResult Function(
            NetworkExceptions error, CoreRes<dynamic>? errorRes)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? data,
    TResult? Function(NetworkExceptions error, CoreRes<dynamic>? errorRes)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? data,
    TResult Function(NetworkExceptions error, CoreRes<dynamic>? errorRes)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data<T> value) data,
    required TResult Function(Error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Data<T> value)? data,
    TResult? Function(Error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data<T> value)? data,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultStateCopyWith<T, $Res> {
  factory $ResultStateCopyWith(
          ResultState<T> value, $Res Function(ResultState<T>) then) =
      _$ResultStateCopyWithImpl<T, $Res, ResultState<T>>;
}

/// @nodoc
class _$ResultStateCopyWithImpl<T, $Res, $Val extends ResultState<T>>
    implements $ResultStateCopyWith<T, $Res> {
  _$ResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DataCopyWith<T, $Res> {
  factory _$$DataCopyWith(_$Data<T> value, $Res Function(_$Data<T>) then) =
      __$$DataCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$DataCopyWithImpl<T, $Res>
    extends _$ResultStateCopyWithImpl<T, $Res, _$Data<T>>
    implements _$$DataCopyWith<T, $Res> {
  __$$DataCopyWithImpl(_$Data<T> _value, $Res Function(_$Data<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Data<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Data<T> implements Data<T> {
  const _$Data({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'ResultState<$T>.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Data<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataCopyWith<T, _$Data<T>> get copyWith =>
      __$$DataCopyWithImpl<T, _$Data<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) data,
    required TResult Function(
            NetworkExceptions error, CoreRes<dynamic>? errorRes)
        error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? data,
    TResult? Function(NetworkExceptions error, CoreRes<dynamic>? errorRes)?
        error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? data,
    TResult Function(NetworkExceptions error, CoreRes<dynamic>? errorRes)?
        error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data<T> value) data,
    required TResult Function(Error<T> value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Data<T> value)? data,
    TResult? Function(Error<T> value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data<T> value)? data,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class Data<T> implements ResultState<T> {
  const factory Data({required final T data}) = _$Data<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$DataCopyWith<T, _$Data<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCopyWith<T, $Res> {
  factory _$$ErrorCopyWith(_$Error<T> value, $Res Function(_$Error<T>) then) =
      __$$ErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({NetworkExceptions error, CoreRes<dynamic>? errorRes});

  $NetworkExceptionsCopyWith<$Res> get error;
}

/// @nodoc
class __$$ErrorCopyWithImpl<T, $Res>
    extends _$ResultStateCopyWithImpl<T, $Res, _$Error<T>>
    implements _$$ErrorCopyWith<T, $Res> {
  __$$ErrorCopyWithImpl(_$Error<T> _value, $Res Function(_$Error<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? errorRes = freezed,
  }) {
    return _then(_$Error<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as NetworkExceptions,
      errorRes: freezed == errorRes
          ? _value.errorRes
          : errorRes // ignore: cast_nullable_to_non_nullable
              as CoreRes<dynamic>?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkExceptionsCopyWith<$Res> get error {
    return $NetworkExceptionsCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$Error<T> implements Error<T> {
  const _$Error({required this.error, this.errorRes});

  @override
  final NetworkExceptions error;
  @override
  final CoreRes<dynamic>? errorRes;

  @override
  String toString() {
    return 'ResultState<$T>.error(error: $error, errorRes: $errorRes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error<T> &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.errorRes, errorRes) ||
                other.errorRes == errorRes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, errorRes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCopyWith<T, _$Error<T>> get copyWith =>
      __$$ErrorCopyWithImpl<T, _$Error<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) data,
    required TResult Function(
            NetworkExceptions error, CoreRes<dynamic>? errorRes)
        error,
  }) {
    return error(this.error, errorRes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? data,
    TResult? Function(NetworkExceptions error, CoreRes<dynamic>? errorRes)?
        error,
  }) {
    return error?.call(this.error, errorRes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? data,
    TResult Function(NetworkExceptions error, CoreRes<dynamic>? errorRes)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, errorRes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data<T> value) data,
    required TResult Function(Error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Data<T> value)? data,
    TResult? Function(Error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data<T> value)? data,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements ResultState<T> {
  const factory Error(
      {required final NetworkExceptions error,
      final CoreRes<dynamic>? errorRes}) = _$Error<T>;

  NetworkExceptions get error;
  CoreRes<dynamic>? get errorRes;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<T, _$Error<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
