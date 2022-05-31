// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'scenario_index.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScenarioIndex _$ScenarioIndexFromJson(Map<String, dynamic> json) {
  return _ScenarioIndex.fromJson(json);
}

/// @nodoc
class _$ScenarioIndexTearOff {
  const _$ScenarioIndexTearOff();

  _ScenarioIndex call({required List<ScenarioReference> scenarios}) {
    return _ScenarioIndex(
      scenarios: scenarios,
    );
  }

  ScenarioIndex fromJson(Map<String, Object?> json) {
    return ScenarioIndex.fromJson(json);
  }
}

/// @nodoc
const $ScenarioIndex = _$ScenarioIndexTearOff();

/// @nodoc
mixin _$ScenarioIndex {
  List<ScenarioReference> get scenarios => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScenarioIndexCopyWith<ScenarioIndex> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScenarioIndexCopyWith<$Res> {
  factory $ScenarioIndexCopyWith(
          ScenarioIndex value, $Res Function(ScenarioIndex) then) =
      _$ScenarioIndexCopyWithImpl<$Res>;
  $Res call({List<ScenarioReference> scenarios});
}

/// @nodoc
class _$ScenarioIndexCopyWithImpl<$Res>
    implements $ScenarioIndexCopyWith<$Res> {
  _$ScenarioIndexCopyWithImpl(this._value, this._then);

  final ScenarioIndex _value;
  // ignore: unused_field
  final $Res Function(ScenarioIndex) _then;

  @override
  $Res call({
    Object? scenarios = freezed,
  }) {
    return _then(_value.copyWith(
      scenarios: scenarios == freezed
          ? _value.scenarios
          : scenarios // ignore: cast_nullable_to_non_nullable
              as List<ScenarioReference>,
    ));
  }
}

/// @nodoc
abstract class _$ScenarioIndexCopyWith<$Res>
    implements $ScenarioIndexCopyWith<$Res> {
  factory _$ScenarioIndexCopyWith(
          _ScenarioIndex value, $Res Function(_ScenarioIndex) then) =
      __$ScenarioIndexCopyWithImpl<$Res>;
  @override
  $Res call({List<ScenarioReference> scenarios});
}

/// @nodoc
class __$ScenarioIndexCopyWithImpl<$Res>
    extends _$ScenarioIndexCopyWithImpl<$Res>
    implements _$ScenarioIndexCopyWith<$Res> {
  __$ScenarioIndexCopyWithImpl(
      _ScenarioIndex _value, $Res Function(_ScenarioIndex) _then)
      : super(_value, (v) => _then(v as _ScenarioIndex));

  @override
  _ScenarioIndex get _value => super._value as _ScenarioIndex;

  @override
  $Res call({
    Object? scenarios = freezed,
  }) {
    return _then(_ScenarioIndex(
      scenarios: scenarios == freezed
          ? _value.scenarios
          : scenarios // ignore: cast_nullable_to_non_nullable
              as List<ScenarioReference>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScenarioIndex extends _ScenarioIndex with DiagnosticableTreeMixin {
  const _$_ScenarioIndex({required this.scenarios}) : super._();

  factory _$_ScenarioIndex.fromJson(Map<String, dynamic> json) =>
      _$$_ScenarioIndexFromJson(json);

  @override
  final List<ScenarioReference> scenarios;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScenarioIndex(scenarios: $scenarios)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScenarioIndex'))
      ..add(DiagnosticsProperty('scenarios', scenarios));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScenarioIndex &&
            const DeepCollectionEquality().equals(other.scenarios, scenarios));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(scenarios));

  @JsonKey(ignore: true)
  @override
  _$ScenarioIndexCopyWith<_ScenarioIndex> get copyWith =>
      __$ScenarioIndexCopyWithImpl<_ScenarioIndex>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScenarioIndexToJson(this);
  }
}

abstract class _ScenarioIndex extends ScenarioIndex {
  const factory _ScenarioIndex({required List<ScenarioReference> scenarios}) =
      _$_ScenarioIndex;
  const _ScenarioIndex._() : super._();

  factory _ScenarioIndex.fromJson(Map<String, dynamic> json) =
      _$_ScenarioIndex.fromJson;

  @override
  List<ScenarioReference> get scenarios;
  @override
  @JsonKey(ignore: true)
  _$ScenarioIndexCopyWith<_ScenarioIndex> get copyWith =>
      throw _privateConstructorUsedError;
}
