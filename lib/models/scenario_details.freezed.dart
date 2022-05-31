// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'scenario_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScenarioDetails _$ScenarioDetailsFromJson(Map<String, dynamic> json) {
  return _ScenarioDetails.fromJson(json);
}

/// @nodoc
class _$ScenarioDetailsTearOff {
  const _$ScenarioDetailsTearOff();

  _ScenarioDetails call(
      {required String title, required int duration, required String endText}) {
    return _ScenarioDetails(
      title: title,
      duration: duration,
      endText: endText,
    );
  }

  ScenarioDetails fromJson(Map<String, Object?> json) {
    return ScenarioDetails.fromJson(json);
  }
}

/// @nodoc
const $ScenarioDetails = _$ScenarioDetailsTearOff();

/// @nodoc
mixin _$ScenarioDetails {
  String get title => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  String get endText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScenarioDetailsCopyWith<ScenarioDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScenarioDetailsCopyWith<$Res> {
  factory $ScenarioDetailsCopyWith(
          ScenarioDetails value, $Res Function(ScenarioDetails) then) =
      _$ScenarioDetailsCopyWithImpl<$Res>;
  $Res call({String title, int duration, String endText});
}

/// @nodoc
class _$ScenarioDetailsCopyWithImpl<$Res>
    implements $ScenarioDetailsCopyWith<$Res> {
  _$ScenarioDetailsCopyWithImpl(this._value, this._then);

  final ScenarioDetails _value;
  // ignore: unused_field
  final $Res Function(ScenarioDetails) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? duration = freezed,
    Object? endText = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      endText: endText == freezed
          ? _value.endText
          : endText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ScenarioDetailsCopyWith<$Res>
    implements $ScenarioDetailsCopyWith<$Res> {
  factory _$ScenarioDetailsCopyWith(
          _ScenarioDetails value, $Res Function(_ScenarioDetails) then) =
      __$ScenarioDetailsCopyWithImpl<$Res>;
  @override
  $Res call({String title, int duration, String endText});
}

/// @nodoc
class __$ScenarioDetailsCopyWithImpl<$Res>
    extends _$ScenarioDetailsCopyWithImpl<$Res>
    implements _$ScenarioDetailsCopyWith<$Res> {
  __$ScenarioDetailsCopyWithImpl(
      _ScenarioDetails _value, $Res Function(_ScenarioDetails) _then)
      : super(_value, (v) => _then(v as _ScenarioDetails));

  @override
  _ScenarioDetails get _value => super._value as _ScenarioDetails;

  @override
  $Res call({
    Object? title = freezed,
    Object? duration = freezed,
    Object? endText = freezed,
  }) {
    return _then(_ScenarioDetails(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      endText: endText == freezed
          ? _value.endText
          : endText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScenarioDetails extends _ScenarioDetails with DiagnosticableTreeMixin {
  const _$_ScenarioDetails(
      {required this.title, required this.duration, required this.endText})
      : super._();

  factory _$_ScenarioDetails.fromJson(Map<String, dynamic> json) =>
      _$$_ScenarioDetailsFromJson(json);

  @override
  final String title;
  @override
  final int duration;
  @override
  final String endText;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScenarioDetails(title: $title, duration: $duration, endText: $endText)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScenarioDetails'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('endText', endText));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScenarioDetails &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.endText, endText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(endText));

  @JsonKey(ignore: true)
  @override
  _$ScenarioDetailsCopyWith<_ScenarioDetails> get copyWith =>
      __$ScenarioDetailsCopyWithImpl<_ScenarioDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScenarioDetailsToJson(this);
  }
}

abstract class _ScenarioDetails extends ScenarioDetails {
  const factory _ScenarioDetails(
      {required String title,
      required int duration,
      required String endText}) = _$_ScenarioDetails;
  const _ScenarioDetails._() : super._();

  factory _ScenarioDetails.fromJson(Map<String, dynamic> json) =
      _$_ScenarioDetails.fromJson;

  @override
  String get title;
  @override
  int get duration;
  @override
  String get endText;
  @override
  @JsonKey(ignore: true)
  _$ScenarioDetailsCopyWith<_ScenarioDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
