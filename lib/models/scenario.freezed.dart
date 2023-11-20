// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scenario.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Scenario _$ScenarioFromJson(Map<String, dynamic> json) {
  return _Scenario.fromJson(json);
}

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
      _$ScenarioCopyWithImpl<$Res, Scenario>;
  @useResult
  $Res call(
      {ScenarioDetails details,
      List<ScenarioItem> items,
      List<ScenarioMechanism> mechanisms});

  $ScenarioDetailsCopyWith<$Res> get details;
}

/// @nodoc
class _$ScenarioCopyWithImpl<$Res, $Val extends Scenario>
    implements $ScenarioCopyWith<$Res> {
  _$ScenarioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
    Object? items = null,
    Object? mechanisms = null,
  }) {
    return _then(_value.copyWith(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as ScenarioDetails,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ScenarioItem>,
      mechanisms: null == mechanisms
          ? _value.mechanisms
          : mechanisms // ignore: cast_nullable_to_non_nullable
              as List<ScenarioMechanism>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScenarioDetailsCopyWith<$Res> get details {
    return $ScenarioDetailsCopyWith<$Res>(_value.details, (value) {
      return _then(_value.copyWith(details: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScenarioImplCopyWith<$Res>
    implements $ScenarioCopyWith<$Res> {
  factory _$$ScenarioImplCopyWith(
          _$ScenarioImpl value, $Res Function(_$ScenarioImpl) then) =
      __$$ScenarioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScenarioDetails details,
      List<ScenarioItem> items,
      List<ScenarioMechanism> mechanisms});

  @override
  $ScenarioDetailsCopyWith<$Res> get details;
}

/// @nodoc
class __$$ScenarioImplCopyWithImpl<$Res>
    extends _$ScenarioCopyWithImpl<$Res, _$ScenarioImpl>
    implements _$$ScenarioImplCopyWith<$Res> {
  __$$ScenarioImplCopyWithImpl(
      _$ScenarioImpl _value, $Res Function(_$ScenarioImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
    Object? items = null,
    Object? mechanisms = null,
  }) {
    return _then(_$ScenarioImpl(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as ScenarioDetails,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ScenarioItem>,
      mechanisms: null == mechanisms
          ? _value._mechanisms
          : mechanisms // ignore: cast_nullable_to_non_nullable
              as List<ScenarioMechanism>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScenarioImpl extends _Scenario with DiagnosticableTreeMixin {
  const _$ScenarioImpl(
      {required this.details,
      required final List<ScenarioItem> items,
      required final List<ScenarioMechanism> mechanisms})
      : _items = items,
        _mechanisms = mechanisms,
        super._();

  factory _$ScenarioImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScenarioImplFromJson(json);

  @override
  final ScenarioDetails details;
  final List<ScenarioItem> _items;
  @override
  List<ScenarioItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<ScenarioMechanism> _mechanisms;
  @override
  List<ScenarioMechanism> get mechanisms {
    if (_mechanisms is EqualUnmodifiableListView) return _mechanisms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mechanisms);
  }

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
            other is _$ScenarioImpl &&
            (identical(other.details, details) || other.details == details) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._mechanisms, _mechanisms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      details,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_mechanisms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScenarioImplCopyWith<_$ScenarioImpl> get copyWith =>
      __$$ScenarioImplCopyWithImpl<_$ScenarioImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScenarioImplToJson(
      this,
    );
  }
}

abstract class _Scenario extends Scenario {
  const factory _Scenario(
      {required final ScenarioDetails details,
      required final List<ScenarioItem> items,
      required final List<ScenarioMechanism> mechanisms}) = _$ScenarioImpl;
  const _Scenario._() : super._();

  factory _Scenario.fromJson(Map<String, dynamic> json) =
      _$ScenarioImpl.fromJson;

  @override
  ScenarioDetails get details;
  @override
  List<ScenarioItem> get items;
  @override
  List<ScenarioMechanism> get mechanisms;
  @override
  @JsonKey(ignore: true)
  _$$ScenarioImplCopyWith<_$ScenarioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
