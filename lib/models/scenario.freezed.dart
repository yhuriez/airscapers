// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'scenario.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Scenario _$ScenarioFromJson(Map<String, dynamic> json) {
  return _Scenario.fromJson(json);
}

/// @nodoc
class _$ScenarioTearOff {
  const _$ScenarioTearOff();

  _Scenario call(
      {required ScenarioDetails details,
      required List<ScenarioItem> items,
      required List<ScenarioMechanism> mechanisms}) {
    return _Scenario(
      details: details,
      items: items,
      mechanisms: mechanisms,
    );
  }

  Scenario fromJson(Map<String, Object?> json) {
    return Scenario.fromJson(json);
  }
}

/// @nodoc
const $Scenario = _$ScenarioTearOff();

/// @nodoc
mixin _$Scenario {
  ScenarioDetails get details => throw _privateConstructorUsedError;
  List<ScenarioItem> get items => throw _privateConstructorUsedError;
  List<ScenarioMechanism> get mechanisms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScenarioCopyWith<Scenario> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScenarioCopyWith<$Res> {
  factory $ScenarioCopyWith(Scenario value, $Res Function(Scenario) then) =
      _$ScenarioCopyWithImpl<$Res>;
  $Res call(
      {ScenarioDetails details,
      List<ScenarioItem> items,
      List<ScenarioMechanism> mechanisms});

  $ScenarioDetailsCopyWith<$Res> get details;
}

/// @nodoc
class _$ScenarioCopyWithImpl<$Res> implements $ScenarioCopyWith<$Res> {
  _$ScenarioCopyWithImpl(this._value, this._then);

  final Scenario _value;
  // ignore: unused_field
  final $Res Function(Scenario) _then;

  @override
  $Res call({
    Object? details = freezed,
    Object? items = freezed,
    Object? mechanisms = freezed,
  }) {
    return _then(_value.copyWith(
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as ScenarioDetails,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ScenarioItem>,
      mechanisms: mechanisms == freezed
          ? _value.mechanisms
          : mechanisms // ignore: cast_nullable_to_non_nullable
              as List<ScenarioMechanism>,
    ));
  }

  @override
  $ScenarioDetailsCopyWith<$Res> get details {
    return $ScenarioDetailsCopyWith<$Res>(_value.details, (value) {
      return _then(_value.copyWith(details: value));
    });
  }
}

/// @nodoc
abstract class _$ScenarioCopyWith<$Res> implements $ScenarioCopyWith<$Res> {
  factory _$ScenarioCopyWith(_Scenario value, $Res Function(_Scenario) then) =
      __$ScenarioCopyWithImpl<$Res>;
  @override
  $Res call(
      {ScenarioDetails details,
      List<ScenarioItem> items,
      List<ScenarioMechanism> mechanisms});

  @override
  $ScenarioDetailsCopyWith<$Res> get details;
}

/// @nodoc
class __$ScenarioCopyWithImpl<$Res> extends _$ScenarioCopyWithImpl<$Res>
    implements _$ScenarioCopyWith<$Res> {
  __$ScenarioCopyWithImpl(_Scenario _value, $Res Function(_Scenario) _then)
      : super(_value, (v) => _then(v as _Scenario));

  @override
  _Scenario get _value => super._value as _Scenario;

  @override
  $Res call({
    Object? details = freezed,
    Object? items = freezed,
    Object? mechanisms = freezed,
  }) {
    return _then(_Scenario(
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as ScenarioDetails,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ScenarioItem>,
      mechanisms: mechanisms == freezed
          ? _value.mechanisms
          : mechanisms // ignore: cast_nullable_to_non_nullable
              as List<ScenarioMechanism>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Scenario extends _Scenario with DiagnosticableTreeMixin {
  const _$_Scenario(
      {required this.details, required this.items, required this.mechanisms})
      : super._();

  factory _$_Scenario.fromJson(Map<String, dynamic> json) =>
      _$$_ScenarioFromJson(json);

  @override
  final ScenarioDetails details;
  @override
  final List<ScenarioItem> items;
  @override
  final List<ScenarioMechanism> mechanisms;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Scenario(details: $details, items: $items, mechanisms: $mechanisms)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Scenario'))
      ..add(DiagnosticsProperty('details', details))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('mechanisms', mechanisms));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Scenario &&
            const DeepCollectionEquality().equals(other.details, details) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality()
                .equals(other.mechanisms, mechanisms));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(details),
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(mechanisms));

  @JsonKey(ignore: true)
  @override
  _$ScenarioCopyWith<_Scenario> get copyWith =>
      __$ScenarioCopyWithImpl<_Scenario>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScenarioToJson(this);
  }
}

abstract class _Scenario extends Scenario {
  const factory _Scenario(
      {required ScenarioDetails details,
      required List<ScenarioItem> items,
      required List<ScenarioMechanism> mechanisms}) = _$_Scenario;
  const _Scenario._() : super._();

  factory _Scenario.fromJson(Map<String, dynamic> json) = _$_Scenario.fromJson;

  @override
  ScenarioDetails get details;
  @override
  List<ScenarioItem> get items;
  @override
  List<ScenarioMechanism> get mechanisms;
  @override
  @JsonKey(ignore: true)
  _$ScenarioCopyWith<_Scenario> get copyWith =>
      throw _privateConstructorUsedError;
}
