// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scenario_loot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScenarioLoot _$ScenarioLootFromJson(Map<String, dynamic> json) {
  return _ScenarioLoot.fromJson(json);
}

/// @nodoc
mixin _$ScenarioLoot {
  String get id => throw _privateConstructorUsedError;
  String? get interactionText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScenarioLootCopyWith<ScenarioLoot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScenarioLootCopyWith<$Res> {
  factory $ScenarioLootCopyWith(
          ScenarioLoot value, $Res Function(ScenarioLoot) then) =
      _$ScenarioLootCopyWithImpl<$Res, ScenarioLoot>;
  @useResult
  $Res call({String id, String? interactionText});
}

/// @nodoc
class _$ScenarioLootCopyWithImpl<$Res, $Val extends ScenarioLoot>
    implements $ScenarioLootCopyWith<$Res> {
  _$ScenarioLootCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? interactionText = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      interactionText: freezed == interactionText
          ? _value.interactionText
          : interactionText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScenarioLootImplCopyWith<$Res>
    implements $ScenarioLootCopyWith<$Res> {
  factory _$$ScenarioLootImplCopyWith(
          _$ScenarioLootImpl value, $Res Function(_$ScenarioLootImpl) then) =
      __$$ScenarioLootImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? interactionText});
}

/// @nodoc
class __$$ScenarioLootImplCopyWithImpl<$Res>
    extends _$ScenarioLootCopyWithImpl<$Res, _$ScenarioLootImpl>
    implements _$$ScenarioLootImplCopyWith<$Res> {
  __$$ScenarioLootImplCopyWithImpl(
      _$ScenarioLootImpl _value, $Res Function(_$ScenarioLootImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? interactionText = freezed,
  }) {
    return _then(_$ScenarioLootImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      interactionText: freezed == interactionText
          ? _value.interactionText
          : interactionText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScenarioLootImpl extends _ScenarioLoot with DiagnosticableTreeMixin {
  const _$ScenarioLootImpl({required this.id, this.interactionText})
      : super._();

  factory _$ScenarioLootImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScenarioLootImplFromJson(json);

  @override
  final String id;
  @override
  final String? interactionText;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScenarioLoot(id: $id, interactionText: $interactionText)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScenarioLoot'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('interactionText', interactionText));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScenarioLootImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.interactionText, interactionText) ||
                other.interactionText == interactionText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, interactionText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScenarioLootImplCopyWith<_$ScenarioLootImpl> get copyWith =>
      __$$ScenarioLootImplCopyWithImpl<_$ScenarioLootImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScenarioLootImplToJson(
      this,
    );
  }
}

abstract class _ScenarioLoot extends ScenarioLoot {
  const factory _ScenarioLoot(
      {required final String id,
      final String? interactionText}) = _$ScenarioLootImpl;
  const _ScenarioLoot._() : super._();

  factory _ScenarioLoot.fromJson(Map<String, dynamic> json) =
      _$ScenarioLootImpl.fromJson;

  @override
  String get id;
  @override
  String? get interactionText;
  @override
  @JsonKey(ignore: true)
  _$$ScenarioLootImplCopyWith<_$ScenarioLootImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
