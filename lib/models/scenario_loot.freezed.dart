// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'scenario_loot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScenarioLoot _$ScenarioLootFromJson(Map<String, dynamic> json) {
  return _ScenarioLoot.fromJson(json);
}

/// @nodoc
class _$ScenarioLootTearOff {
  const _$ScenarioLootTearOff();

  _ScenarioLoot call(
      {required int id, required LootType type, String? interactionText}) {
    return _ScenarioLoot(
      id: id,
      type: type,
      interactionText: interactionText,
    );
  }

  ScenarioLoot fromJson(Map<String, Object?> json) {
    return ScenarioLoot.fromJson(json);
  }
}

/// @nodoc
const $ScenarioLoot = _$ScenarioLootTearOff();

/// @nodoc
mixin _$ScenarioLoot {
  int get id => throw _privateConstructorUsedError;
  LootType get type => throw _privateConstructorUsedError;
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
      _$ScenarioLootCopyWithImpl<$Res>;
  $Res call({int id, LootType type, String? interactionText});
}

/// @nodoc
class _$ScenarioLootCopyWithImpl<$Res> implements $ScenarioLootCopyWith<$Res> {
  _$ScenarioLootCopyWithImpl(this._value, this._then);

  final ScenarioLoot _value;
  // ignore: unused_field
  final $Res Function(ScenarioLoot) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? interactionText = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LootType,
      interactionText: interactionText == freezed
          ? _value.interactionText
          : interactionText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ScenarioLootCopyWith<$Res>
    implements $ScenarioLootCopyWith<$Res> {
  factory _$ScenarioLootCopyWith(
          _ScenarioLoot value, $Res Function(_ScenarioLoot) then) =
      __$ScenarioLootCopyWithImpl<$Res>;
  @override
  $Res call({int id, LootType type, String? interactionText});
}

/// @nodoc
class __$ScenarioLootCopyWithImpl<$Res> extends _$ScenarioLootCopyWithImpl<$Res>
    implements _$ScenarioLootCopyWith<$Res> {
  __$ScenarioLootCopyWithImpl(
      _ScenarioLoot _value, $Res Function(_ScenarioLoot) _then)
      : super(_value, (v) => _then(v as _ScenarioLoot));

  @override
  _ScenarioLoot get _value => super._value as _ScenarioLoot;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? interactionText = freezed,
  }) {
    return _then(_ScenarioLoot(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LootType,
      interactionText: interactionText == freezed
          ? _value.interactionText
          : interactionText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScenarioLoot extends _ScenarioLoot with DiagnosticableTreeMixin {
  const _$_ScenarioLoot(
      {required this.id, required this.type, this.interactionText})
      : super._();

  factory _$_ScenarioLoot.fromJson(Map<String, dynamic> json) =>
      _$$_ScenarioLootFromJson(json);

  @override
  final int id;
  @override
  final LootType type;
  @override
  final String? interactionText;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScenarioLoot(id: $id, type: $type, interactionText: $interactionText)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScenarioLoot'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('interactionText', interactionText));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScenarioLoot &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.interactionText, interactionText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(interactionText));

  @JsonKey(ignore: true)
  @override
  _$ScenarioLootCopyWith<_ScenarioLoot> get copyWith =>
      __$ScenarioLootCopyWithImpl<_ScenarioLoot>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScenarioLootToJson(this);
  }
}

abstract class _ScenarioLoot extends ScenarioLoot {
  const factory _ScenarioLoot(
      {required int id,
      required LootType type,
      String? interactionText}) = _$_ScenarioLoot;
  const _ScenarioLoot._() : super._();

  factory _ScenarioLoot.fromJson(Map<String, dynamic> json) =
      _$_ScenarioLoot.fromJson;

  @override
  int get id;
  @override
  LootType get type;
  @override
  String? get interactionText;
  @override
  @JsonKey(ignore: true)
  _$ScenarioLootCopyWith<_ScenarioLoot> get copyWith =>
      throw _privateConstructorUsedError;
}
