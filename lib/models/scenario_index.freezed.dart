// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scenario_index.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScenarioIndex _$ScenarioIndexFromJson(Map<String, dynamic> json) {
  return _ScenarioIndex.fromJson(json);
}

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
      _$ScenarioIndexCopyWithImpl<$Res, ScenarioIndex>;
  @useResult
  $Res call({List<ScenarioReference> scenarios});
}

/// @nodoc
class _$ScenarioIndexCopyWithImpl<$Res, $Val extends ScenarioIndex>
    implements $ScenarioIndexCopyWith<$Res> {
  _$ScenarioIndexCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scenarios = null,
  }) {
    return _then(_value.copyWith(
      scenarios: null == scenarios
          ? _value.scenarios
          : scenarios // ignore: cast_nullable_to_non_nullable
              as List<ScenarioReference>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScenarioIndexImplCopyWith<$Res>
    implements $ScenarioIndexCopyWith<$Res> {
  factory _$$ScenarioIndexImplCopyWith(
          _$ScenarioIndexImpl value, $Res Function(_$ScenarioIndexImpl) then) =
      __$$ScenarioIndexImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ScenarioReference> scenarios});
}

/// @nodoc
class __$$ScenarioIndexImplCopyWithImpl<$Res>
    extends _$ScenarioIndexCopyWithImpl<$Res, _$ScenarioIndexImpl>
    implements _$$ScenarioIndexImplCopyWith<$Res> {
  __$$ScenarioIndexImplCopyWithImpl(
      _$ScenarioIndexImpl _value, $Res Function(_$ScenarioIndexImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scenarios = null,
  }) {
    return _then(_$ScenarioIndexImpl(
      scenarios: null == scenarios
          ? _value._scenarios
          : scenarios // ignore: cast_nullable_to_non_nullable
              as List<ScenarioReference>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScenarioIndexImpl extends _ScenarioIndex with DiagnosticableTreeMixin {
  const _$ScenarioIndexImpl({required final List<ScenarioReference> scenarios})
      : _scenarios = scenarios,
        super._();

  factory _$ScenarioIndexImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScenarioIndexImplFromJson(json);

  final List<ScenarioReference> _scenarios;
  @override
  List<ScenarioReference> get scenarios {
    if (_scenarios is EqualUnmodifiableListView) return _scenarios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scenarios);
  }

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
            other is _$ScenarioIndexImpl &&
            const DeepCollectionEquality()
                .equals(other._scenarios, _scenarios));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_scenarios));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScenarioIndexImplCopyWith<_$ScenarioIndexImpl> get copyWith =>
      __$$ScenarioIndexImplCopyWithImpl<_$ScenarioIndexImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScenarioIndexImplToJson(
      this,
    );
  }
}

abstract class _ScenarioIndex extends ScenarioIndex {
  const factory _ScenarioIndex(
      {required final List<ScenarioReference> scenarios}) = _$ScenarioIndexImpl;
  const _ScenarioIndex._() : super._();

  factory _ScenarioIndex.fromJson(Map<String, dynamic> json) =
      _$ScenarioIndexImpl.fromJson;

  @override
  List<ScenarioReference> get scenarios;
  @override
  @JsonKey(ignore: true)
  _$$ScenarioIndexImplCopyWith<_$ScenarioIndexImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
