// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scenario_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScenarioDetails _$ScenarioDetailsFromJson(Map<String, dynamic> json) {
  return _ScenarioDetails.fromJson(json);
}

/// @nodoc
mixin _$ScenarioDetails {
  String get title => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  int get maxDuration => throw _privateConstructorUsedError;
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
      _$ScenarioDetailsCopyWithImpl<$Res, ScenarioDetails>;
  @useResult
  $Res call({String title, int duration, int maxDuration, String endText});
}

/// @nodoc
class _$ScenarioDetailsCopyWithImpl<$Res, $Val extends ScenarioDetails>
    implements $ScenarioDetailsCopyWith<$Res> {
  _$ScenarioDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? duration = null,
    Object? maxDuration = null,
    Object? endText = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      maxDuration: null == maxDuration
          ? _value.maxDuration
          : maxDuration // ignore: cast_nullable_to_non_nullable
              as int,
      endText: null == endText
          ? _value.endText
          : endText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScenarioDetailsImplCopyWith<$Res>
    implements $ScenarioDetailsCopyWith<$Res> {
  factory _$$ScenarioDetailsImplCopyWith(_$ScenarioDetailsImpl value,
          $Res Function(_$ScenarioDetailsImpl) then) =
      __$$ScenarioDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, int duration, int maxDuration, String endText});
}

/// @nodoc
class __$$ScenarioDetailsImplCopyWithImpl<$Res>
    extends _$ScenarioDetailsCopyWithImpl<$Res, _$ScenarioDetailsImpl>
    implements _$$ScenarioDetailsImplCopyWith<$Res> {
  __$$ScenarioDetailsImplCopyWithImpl(
      _$ScenarioDetailsImpl _value, $Res Function(_$ScenarioDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? duration = null,
    Object? maxDuration = null,
    Object? endText = null,
  }) {
    return _then(_$ScenarioDetailsImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      maxDuration: null == maxDuration
          ? _value.maxDuration
          : maxDuration // ignore: cast_nullable_to_non_nullable
              as int,
      endText: null == endText
          ? _value.endText
          : endText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScenarioDetailsImpl extends _ScenarioDetails
    with DiagnosticableTreeMixin {
  const _$ScenarioDetailsImpl(
      {required this.title,
      required this.duration,
      required this.maxDuration,
      required this.endText})
      : super._();

  factory _$ScenarioDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScenarioDetailsImplFromJson(json);

  @override
  final String title;
  @override
  final int duration;
  @override
  final int maxDuration;
  @override
  final String endText;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScenarioDetails(title: $title, duration: $duration, maxDuration: $maxDuration, endText: $endText)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScenarioDetails'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('maxDuration', maxDuration))
      ..add(DiagnosticsProperty('endText', endText));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScenarioDetailsImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.maxDuration, maxDuration) ||
                other.maxDuration == maxDuration) &&
            (identical(other.endText, endText) || other.endText == endText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, duration, maxDuration, endText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScenarioDetailsImplCopyWith<_$ScenarioDetailsImpl> get copyWith =>
      __$$ScenarioDetailsImplCopyWithImpl<_$ScenarioDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScenarioDetailsImplToJson(
      this,
    );
  }
}

abstract class _ScenarioDetails extends ScenarioDetails {
  const factory _ScenarioDetails(
      {required final String title,
      required final int duration,
      required final int maxDuration,
      required final String endText}) = _$ScenarioDetailsImpl;
  const _ScenarioDetails._() : super._();

  factory _ScenarioDetails.fromJson(Map<String, dynamic> json) =
      _$ScenarioDetailsImpl.fromJson;

  @override
  String get title;
  @override
  int get duration;
  @override
  int get maxDuration;
  @override
  String get endText;
  @override
  @JsonKey(ignore: true)
  _$$ScenarioDetailsImplCopyWith<_$ScenarioDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
