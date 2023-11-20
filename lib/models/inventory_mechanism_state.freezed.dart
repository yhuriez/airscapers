// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_mechanism_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InventoryMechanism _$InventoryMechanismFromJson(Map<String, dynamic> json) {
  return _InventoryMechanismState.fromJson(json);
}

/// @nodoc
mixin _$InventoryMechanism {
  String get mechanismId => throw _privateConstructorUsedError;
  DateTime get creationDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryMechanismCopyWith<InventoryMechanism> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryMechanismCopyWith<$Res> {
  factory $InventoryMechanismCopyWith(
          InventoryMechanism value, $Res Function(InventoryMechanism) then) =
      _$InventoryMechanismCopyWithImpl<$Res, InventoryMechanism>;
  @useResult
  $Res call({String mechanismId, DateTime creationDate});
}

/// @nodoc
class _$InventoryMechanismCopyWithImpl<$Res, $Val extends InventoryMechanism>
    implements $InventoryMechanismCopyWith<$Res> {
  _$InventoryMechanismCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mechanismId = null,
    Object? creationDate = null,
  }) {
    return _then(_value.copyWith(
      mechanismId: null == mechanismId
          ? _value.mechanismId
          : mechanismId // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryMechanismStateImplCopyWith<$Res>
    implements $InventoryMechanismCopyWith<$Res> {
  factory _$$InventoryMechanismStateImplCopyWith(
          _$InventoryMechanismStateImpl value,
          $Res Function(_$InventoryMechanismStateImpl) then) =
      __$$InventoryMechanismStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mechanismId, DateTime creationDate});
}

/// @nodoc
class __$$InventoryMechanismStateImplCopyWithImpl<$Res>
    extends _$InventoryMechanismCopyWithImpl<$Res,
        _$InventoryMechanismStateImpl>
    implements _$$InventoryMechanismStateImplCopyWith<$Res> {
  __$$InventoryMechanismStateImplCopyWithImpl(
      _$InventoryMechanismStateImpl _value,
      $Res Function(_$InventoryMechanismStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mechanismId = null,
    Object? creationDate = null,
  }) {
    return _then(_$InventoryMechanismStateImpl(
      mechanismId: null == mechanismId
          ? _value.mechanismId
          : mechanismId // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryMechanismStateImpl extends _InventoryMechanismState
    with DiagnosticableTreeMixin {
  const _$InventoryMechanismStateImpl(
      {required this.mechanismId, required this.creationDate})
      : super._();

  factory _$InventoryMechanismStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryMechanismStateImplFromJson(json);

  @override
  final String mechanismId;
  @override
  final DateTime creationDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InventoryMechanism(mechanismId: $mechanismId, creationDate: $creationDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InventoryMechanism'))
      ..add(DiagnosticsProperty('mechanismId', mechanismId))
      ..add(DiagnosticsProperty('creationDate', creationDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryMechanismStateImpl &&
            (identical(other.mechanismId, mechanismId) ||
                other.mechanismId == mechanismId) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mechanismId, creationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryMechanismStateImplCopyWith<_$InventoryMechanismStateImpl>
      get copyWith => __$$InventoryMechanismStateImplCopyWithImpl<
          _$InventoryMechanismStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryMechanismStateImplToJson(
      this,
    );
  }
}

abstract class _InventoryMechanismState extends InventoryMechanism {
  const factory _InventoryMechanismState(
      {required final String mechanismId,
      required final DateTime creationDate}) = _$InventoryMechanismStateImpl;
  const _InventoryMechanismState._() : super._();

  factory _InventoryMechanismState.fromJson(Map<String, dynamic> json) =
      _$InventoryMechanismStateImpl.fromJson;

  @override
  String get mechanismId;
  @override
  DateTime get creationDate;
  @override
  @JsonKey(ignore: true)
  _$$InventoryMechanismStateImplCopyWith<_$InventoryMechanismStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
