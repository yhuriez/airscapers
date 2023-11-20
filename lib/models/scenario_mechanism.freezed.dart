// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scenario_mechanism.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScenarioMechanism _$ScenarioMechanismFromJson(Map<String, dynamic> json) {
  return _ScenarioMechanism.fromJson(json);
}

/// @nodoc
mixin _$ScenarioMechanism {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  MechanismSolving get solving => throw _privateConstructorUsedError;
  String? get transitionId => throw _privateConstructorUsedError;
  bool get endTrack => throw _privateConstructorUsedError;
  List<String> get clues => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScenarioMechanismCopyWith<ScenarioMechanism> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScenarioMechanismCopyWith<$Res> {
  factory $ScenarioMechanismCopyWith(
          ScenarioMechanism value, $Res Function(ScenarioMechanism) then) =
      _$ScenarioMechanismCopyWithImpl<$Res, ScenarioMechanism>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String? image,
      MechanismSolving solving,
      String? transitionId,
      bool endTrack,
      List<String> clues});

  $MechanismSolvingCopyWith<$Res> get solving;
}

/// @nodoc
class _$ScenarioMechanismCopyWithImpl<$Res, $Val extends ScenarioMechanism>
    implements $ScenarioMechanismCopyWith<$Res> {
  _$ScenarioMechanismCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? image = freezed,
    Object? solving = null,
    Object? transitionId = freezed,
    Object? endTrack = null,
    Object? clues = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      solving: null == solving
          ? _value.solving
          : solving // ignore: cast_nullable_to_non_nullable
              as MechanismSolving,
      transitionId: freezed == transitionId
          ? _value.transitionId
          : transitionId // ignore: cast_nullable_to_non_nullable
              as String?,
      endTrack: null == endTrack
          ? _value.endTrack
          : endTrack // ignore: cast_nullable_to_non_nullable
              as bool,
      clues: null == clues
          ? _value.clues
          : clues // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MechanismSolvingCopyWith<$Res> get solving {
    return $MechanismSolvingCopyWith<$Res>(_value.solving, (value) {
      return _then(_value.copyWith(solving: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScenarioMechanismImplCopyWith<$Res>
    implements $ScenarioMechanismCopyWith<$Res> {
  factory _$$ScenarioMechanismImplCopyWith(_$ScenarioMechanismImpl value,
          $Res Function(_$ScenarioMechanismImpl) then) =
      __$$ScenarioMechanismImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String? image,
      MechanismSolving solving,
      String? transitionId,
      bool endTrack,
      List<String> clues});

  @override
  $MechanismSolvingCopyWith<$Res> get solving;
}

/// @nodoc
class __$$ScenarioMechanismImplCopyWithImpl<$Res>
    extends _$ScenarioMechanismCopyWithImpl<$Res, _$ScenarioMechanismImpl>
    implements _$$ScenarioMechanismImplCopyWith<$Res> {
  __$$ScenarioMechanismImplCopyWithImpl(_$ScenarioMechanismImpl _value,
      $Res Function(_$ScenarioMechanismImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? image = freezed,
    Object? solving = null,
    Object? transitionId = freezed,
    Object? endTrack = null,
    Object? clues = null,
  }) {
    return _then(_$ScenarioMechanismImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      solving: null == solving
          ? _value.solving
          : solving // ignore: cast_nullable_to_non_nullable
              as MechanismSolving,
      transitionId: freezed == transitionId
          ? _value.transitionId
          : transitionId // ignore: cast_nullable_to_non_nullable
              as String?,
      endTrack: null == endTrack
          ? _value.endTrack
          : endTrack // ignore: cast_nullable_to_non_nullable
              as bool,
      clues: null == clues
          ? _value._clues
          : clues // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScenarioMechanismImpl extends _ScenarioMechanism
    with DiagnosticableTreeMixin {
  const _$ScenarioMechanismImpl(
      {required this.id,
      required this.name,
      this.description,
      this.image,
      required this.solving,
      this.transitionId,
      this.endTrack = false,
      final List<String> clues = const []})
      : _clues = clues,
        super._();

  factory _$ScenarioMechanismImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScenarioMechanismImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? image;
  @override
  final MechanismSolving solving;
  @override
  final String? transitionId;
  @override
  @JsonKey()
  final bool endTrack;
  final List<String> _clues;
  @override
  @JsonKey()
  List<String> get clues {
    if (_clues is EqualUnmodifiableListView) return _clues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clues);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScenarioMechanism(id: $id, name: $name, description: $description, image: $image, solving: $solving, transitionId: $transitionId, endTrack: $endTrack, clues: $clues)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScenarioMechanism'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('solving', solving))
      ..add(DiagnosticsProperty('transitionId', transitionId))
      ..add(DiagnosticsProperty('endTrack', endTrack))
      ..add(DiagnosticsProperty('clues', clues));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScenarioMechanismImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.solving, solving) || other.solving == solving) &&
            (identical(other.transitionId, transitionId) ||
                other.transitionId == transitionId) &&
            (identical(other.endTrack, endTrack) ||
                other.endTrack == endTrack) &&
            const DeepCollectionEquality().equals(other._clues, _clues));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      image,
      solving,
      transitionId,
      endTrack,
      const DeepCollectionEquality().hash(_clues));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScenarioMechanismImplCopyWith<_$ScenarioMechanismImpl> get copyWith =>
      __$$ScenarioMechanismImplCopyWithImpl<_$ScenarioMechanismImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScenarioMechanismImplToJson(
      this,
    );
  }
}

abstract class _ScenarioMechanism extends ScenarioMechanism {
  const factory _ScenarioMechanism(
      {required final String id,
      required final String name,
      final String? description,
      final String? image,
      required final MechanismSolving solving,
      final String? transitionId,
      final bool endTrack,
      final List<String> clues}) = _$ScenarioMechanismImpl;
  const _ScenarioMechanism._() : super._();

  factory _ScenarioMechanism.fromJson(Map<String, dynamic> json) =
      _$ScenarioMechanismImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get image;
  @override
  MechanismSolving get solving;
  @override
  String? get transitionId;
  @override
  bool get endTrack;
  @override
  List<String> get clues;
  @override
  @JsonKey(ignore: true)
  _$$ScenarioMechanismImplCopyWith<_$ScenarioMechanismImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MechanismClue _$MechanismClueFromJson(Map<String, dynamic> json) {
  return _MechanismClue.fromJson(json);
}

/// @nodoc
mixin _$MechanismClue {
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MechanismClueCopyWith<MechanismClue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MechanismClueCopyWith<$Res> {
  factory $MechanismClueCopyWith(
          MechanismClue value, $Res Function(MechanismClue) then) =
      _$MechanismClueCopyWithImpl<$Res, MechanismClue>;
  @useResult
  $Res call({String id, String description});
}

/// @nodoc
class _$MechanismClueCopyWithImpl<$Res, $Val extends MechanismClue>
    implements $MechanismClueCopyWith<$Res> {
  _$MechanismClueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MechanismClueImplCopyWith<$Res>
    implements $MechanismClueCopyWith<$Res> {
  factory _$$MechanismClueImplCopyWith(
          _$MechanismClueImpl value, $Res Function(_$MechanismClueImpl) then) =
      __$$MechanismClueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String description});
}

/// @nodoc
class __$$MechanismClueImplCopyWithImpl<$Res>
    extends _$MechanismClueCopyWithImpl<$Res, _$MechanismClueImpl>
    implements _$$MechanismClueImplCopyWith<$Res> {
  __$$MechanismClueImplCopyWithImpl(
      _$MechanismClueImpl _value, $Res Function(_$MechanismClueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
  }) {
    return _then(_$MechanismClueImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MechanismClueImpl extends _MechanismClue with DiagnosticableTreeMixin {
  const _$MechanismClueImpl({required this.id, required this.description})
      : super._();

  factory _$MechanismClueImpl.fromJson(Map<String, dynamic> json) =>
      _$$MechanismClueImplFromJson(json);

  @override
  final String id;
  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MechanismClue(id: $id, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MechanismClue'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MechanismClueImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MechanismClueImplCopyWith<_$MechanismClueImpl> get copyWith =>
      __$$MechanismClueImplCopyWithImpl<_$MechanismClueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MechanismClueImplToJson(
      this,
    );
  }
}

abstract class _MechanismClue extends MechanismClue {
  const factory _MechanismClue(
      {required final String id,
      required final String description}) = _$MechanismClueImpl;
  const _MechanismClue._() : super._();

  factory _MechanismClue.fromJson(Map<String, dynamic> json) =
      _$MechanismClueImpl.fromJson;

  @override
  String get id;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$MechanismClueImplCopyWith<_$MechanismClueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
