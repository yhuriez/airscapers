// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'inventory_mechanism_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InventoryMechanismState _$InventoryMechanismStateFromJson(
    Map<String, dynamic> json) {
  return _InventoryMechanismState.fromJson(json);
}

/// @nodoc
class _$InventoryMechanismStateTearOff {
  const _$InventoryMechanismStateTearOff();

  _InventoryMechanismState call(
      {required int mechanismId,
      required DateTime creationDate,
      required int currentStateId}) {
    return _InventoryMechanismState(
      mechanismId: mechanismId,
      creationDate: creationDate,
      currentStateId: currentStateId,
    );
  }

  InventoryMechanismState fromJson(Map<String, Object?> json) {
    return InventoryMechanismState.fromJson(json);
  }
}

/// @nodoc
const $InventoryMechanismState = _$InventoryMechanismStateTearOff();

/// @nodoc
mixin _$InventoryMechanismState {
  int get mechanismId => throw _privateConstructorUsedError;
  DateTime get creationDate => throw _privateConstructorUsedError;
  int get currentStateId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryMechanismStateCopyWith<InventoryMechanismState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryMechanismStateCopyWith<$Res> {
  factory $InventoryMechanismStateCopyWith(InventoryMechanismState value,
          $Res Function(InventoryMechanismState) then) =
      _$InventoryMechanismStateCopyWithImpl<$Res>;
  $Res call({int mechanismId, DateTime creationDate, int currentStateId});
}

/// @nodoc
class _$InventoryMechanismStateCopyWithImpl<$Res>
    implements $InventoryMechanismStateCopyWith<$Res> {
  _$InventoryMechanismStateCopyWithImpl(this._value, this._then);

  final InventoryMechanismState _value;
  // ignore: unused_field
  final $Res Function(InventoryMechanismState) _then;

  @override
  $Res call({
    Object? mechanismId = freezed,
    Object? creationDate = freezed,
    Object? currentStateId = freezed,
  }) {
    return _then(_value.copyWith(
      mechanismId: mechanismId == freezed
          ? _value.mechanismId
          : mechanismId // ignore: cast_nullable_to_non_nullable
              as int,
      creationDate: creationDate == freezed
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentStateId: currentStateId == freezed
          ? _value.currentStateId
          : currentStateId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$InventoryMechanismStateCopyWith<$Res>
    implements $InventoryMechanismStateCopyWith<$Res> {
  factory _$InventoryMechanismStateCopyWith(_InventoryMechanismState value,
          $Res Function(_InventoryMechanismState) then) =
      __$InventoryMechanismStateCopyWithImpl<$Res>;
  @override
  $Res call({int mechanismId, DateTime creationDate, int currentStateId});
}

/// @nodoc
class __$InventoryMechanismStateCopyWithImpl<$Res>
    extends _$InventoryMechanismStateCopyWithImpl<$Res>
    implements _$InventoryMechanismStateCopyWith<$Res> {
  __$InventoryMechanismStateCopyWithImpl(_InventoryMechanismState _value,
      $Res Function(_InventoryMechanismState) _then)
      : super(_value, (v) => _then(v as _InventoryMechanismState));

  @override
  _InventoryMechanismState get _value =>
      super._value as _InventoryMechanismState;

  @override
  $Res call({
    Object? mechanismId = freezed,
    Object? creationDate = freezed,
    Object? currentStateId = freezed,
  }) {
    return _then(_InventoryMechanismState(
      mechanismId: mechanismId == freezed
          ? _value.mechanismId
          : mechanismId // ignore: cast_nullable_to_non_nullable
              as int,
      creationDate: creationDate == freezed
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentStateId: currentStateId == freezed
          ? _value.currentStateId
          : currentStateId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InventoryMechanismState extends _InventoryMechanismState
    with DiagnosticableTreeMixin {
  const _$_InventoryMechanismState(
      {required this.mechanismId,
      required this.creationDate,
      required this.currentStateId})
      : super._();

  factory _$_InventoryMechanismState.fromJson(Map<String, dynamic> json) =>
      _$$_InventoryMechanismStateFromJson(json);

  @override
  final int mechanismId;
  @override
  final DateTime creationDate;
  @override
  final int currentStateId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InventoryMechanismState(mechanismId: $mechanismId, creationDate: $creationDate, currentStateId: $currentStateId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InventoryMechanismState'))
      ..add(DiagnosticsProperty('mechanismId', mechanismId))
      ..add(DiagnosticsProperty('creationDate', creationDate))
      ..add(DiagnosticsProperty('currentStateId', currentStateId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InventoryMechanismState &&
            const DeepCollectionEquality()
                .equals(other.mechanismId, mechanismId) &&
            const DeepCollectionEquality()
                .equals(other.creationDate, creationDate) &&
            const DeepCollectionEquality()
                .equals(other.currentStateId, currentStateId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(mechanismId),
      const DeepCollectionEquality().hash(creationDate),
      const DeepCollectionEquality().hash(currentStateId));

  @JsonKey(ignore: true)
  @override
  _$InventoryMechanismStateCopyWith<_InventoryMechanismState> get copyWith =>
      __$InventoryMechanismStateCopyWithImpl<_InventoryMechanismState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InventoryMechanismStateToJson(this);
  }
}

abstract class _InventoryMechanismState extends InventoryMechanismState {
  const factory _InventoryMechanismState(
      {required int mechanismId,
      required DateTime creationDate,
      required int currentStateId}) = _$_InventoryMechanismState;
  const _InventoryMechanismState._() : super._();

  factory _InventoryMechanismState.fromJson(Map<String, dynamic> json) =
      _$_InventoryMechanismState.fromJson;

  @override
  int get mechanismId;
  @override
  DateTime get creationDate;
  @override
  int get currentStateId;
  @override
  @JsonKey(ignore: true)
  _$InventoryMechanismStateCopyWith<_InventoryMechanismState> get copyWith =>
      throw _privateConstructorUsedError;
}
