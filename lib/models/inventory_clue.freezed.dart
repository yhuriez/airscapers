// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'inventory_clue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InventoryClue _$InventoryClueFromJson(Map<String, dynamic> json) {
  return _InventoryClue.fromJson(json);
}

/// @nodoc
class _$InventoryClueTearOff {
  const _$InventoryClueTearOff();

  _InventoryClue call({required int id, required DateTime creationDate}) {
    return _InventoryClue(
      id: id,
      creationDate: creationDate,
    );
  }

  InventoryClue fromJson(Map<String, Object?> json) {
    return InventoryClue.fromJson(json);
  }
}

/// @nodoc
const $InventoryClue = _$InventoryClueTearOff();

/// @nodoc
mixin _$InventoryClue {
  int get id => throw _privateConstructorUsedError;
  DateTime get creationDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryClueCopyWith<InventoryClue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryClueCopyWith<$Res> {
  factory $InventoryClueCopyWith(
          InventoryClue value, $Res Function(InventoryClue) then) =
      _$InventoryClueCopyWithImpl<$Res>;
  $Res call({int id, DateTime creationDate});
}

/// @nodoc
class _$InventoryClueCopyWithImpl<$Res>
    implements $InventoryClueCopyWith<$Res> {
  _$InventoryClueCopyWithImpl(this._value, this._then);

  final InventoryClue _value;
  // ignore: unused_field
  final $Res Function(InventoryClue) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? creationDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      creationDate: creationDate == freezed
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$InventoryClueCopyWith<$Res>
    implements $InventoryClueCopyWith<$Res> {
  factory _$InventoryClueCopyWith(
          _InventoryClue value, $Res Function(_InventoryClue) then) =
      __$InventoryClueCopyWithImpl<$Res>;
  @override
  $Res call({int id, DateTime creationDate});
}

/// @nodoc
class __$InventoryClueCopyWithImpl<$Res>
    extends _$InventoryClueCopyWithImpl<$Res>
    implements _$InventoryClueCopyWith<$Res> {
  __$InventoryClueCopyWithImpl(
      _InventoryClue _value, $Res Function(_InventoryClue) _then)
      : super(_value, (v) => _then(v as _InventoryClue));

  @override
  _InventoryClue get _value => super._value as _InventoryClue;

  @override
  $Res call({
    Object? id = freezed,
    Object? creationDate = freezed,
  }) {
    return _then(_InventoryClue(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      creationDate: creationDate == freezed
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InventoryClue extends _InventoryClue with DiagnosticableTreeMixin {
  const _$_InventoryClue({required this.id, required this.creationDate})
      : super._();

  factory _$_InventoryClue.fromJson(Map<String, dynamic> json) =>
      _$$_InventoryClueFromJson(json);

  @override
  final int id;
  @override
  final DateTime creationDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InventoryClue(id: $id, creationDate: $creationDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InventoryClue'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('creationDate', creationDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InventoryClue &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.creationDate, creationDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(creationDate));

  @JsonKey(ignore: true)
  @override
  _$InventoryClueCopyWith<_InventoryClue> get copyWith =>
      __$InventoryClueCopyWithImpl<_InventoryClue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InventoryClueToJson(this);
  }
}

abstract class _InventoryClue extends InventoryClue {
  const factory _InventoryClue(
      {required int id, required DateTime creationDate}) = _$_InventoryClue;
  const _InventoryClue._() : super._();

  factory _InventoryClue.fromJson(Map<String, dynamic> json) =
      _$_InventoryClue.fromJson;

  @override
  int get id;
  @override
  DateTime get creationDate;
  @override
  @JsonKey(ignore: true)
  _$InventoryClueCopyWith<_InventoryClue> get copyWith =>
      throw _privateConstructorUsedError;
}
