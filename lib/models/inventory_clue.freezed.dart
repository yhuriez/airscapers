// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_clue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InventoryClue _$InventoryClueFromJson(Map<String, dynamic> json) {
  return _InventoryClue.fromJson(json);
}

/// @nodoc
mixin _$InventoryClue {
  String get id => throw _privateConstructorUsedError;
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
      _$InventoryClueCopyWithImpl<$Res, InventoryClue>;
  @useResult
  $Res call({String id, DateTime creationDate});
}

/// @nodoc
class _$InventoryClueCopyWithImpl<$Res, $Val extends InventoryClue>
    implements $InventoryClueCopyWith<$Res> {
  _$InventoryClueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creationDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryClueImplCopyWith<$Res>
    implements $InventoryClueCopyWith<$Res> {
  factory _$$InventoryClueImplCopyWith(
          _$InventoryClueImpl value, $Res Function(_$InventoryClueImpl) then) =
      __$$InventoryClueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, DateTime creationDate});
}

/// @nodoc
class __$$InventoryClueImplCopyWithImpl<$Res>
    extends _$InventoryClueCopyWithImpl<$Res, _$InventoryClueImpl>
    implements _$$InventoryClueImplCopyWith<$Res> {
  __$$InventoryClueImplCopyWithImpl(
      _$InventoryClueImpl _value, $Res Function(_$InventoryClueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creationDate = null,
  }) {
    return _then(_$InventoryClueImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
class _$InventoryClueImpl extends _InventoryClue with DiagnosticableTreeMixin {
  const _$InventoryClueImpl({required this.id, required this.creationDate})
      : super._();

  factory _$InventoryClueImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryClueImplFromJson(json);

  @override
  final String id;
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
            other is _$InventoryClueImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, creationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryClueImplCopyWith<_$InventoryClueImpl> get copyWith =>
      __$$InventoryClueImplCopyWithImpl<_$InventoryClueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryClueImplToJson(
      this,
    );
  }
}

abstract class _InventoryClue extends InventoryClue {
  const factory _InventoryClue(
      {required final String id,
      required final DateTime creationDate}) = _$InventoryClueImpl;
  const _InventoryClue._() : super._();

  factory _InventoryClue.fromJson(Map<String, dynamic> json) =
      _$InventoryClueImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get creationDate;
  @override
  @JsonKey(ignore: true)
  _$$InventoryClueImplCopyWith<_$InventoryClueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
