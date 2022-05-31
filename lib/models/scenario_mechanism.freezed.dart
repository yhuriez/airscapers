// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'scenario_mechanism.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScenarioMechanism _$ScenarioMechanismFromJson(Map<String, dynamic> json) {
  return _ScenarioMechanism.fromJson(json);
}

/// @nodoc
class _$ScenarioMechanismTearOff {
  const _$ScenarioMechanismTearOff();

  _ScenarioMechanism call(
      {required int id,
      required String name,
      List<MechanismState> states = const []}) {
    return _ScenarioMechanism(
      id: id,
      name: name,
      states: states,
    );
  }

  ScenarioMechanism fromJson(Map<String, Object?> json) {
    return ScenarioMechanism.fromJson(json);
  }
}

/// @nodoc
const $ScenarioMechanism = _$ScenarioMechanismTearOff();

/// @nodoc
mixin _$ScenarioMechanism {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<MechanismState> get states => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScenarioMechanismCopyWith<ScenarioMechanism> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScenarioMechanismCopyWith<$Res> {
  factory $ScenarioMechanismCopyWith(
          ScenarioMechanism value, $Res Function(ScenarioMechanism) then) =
      _$ScenarioMechanismCopyWithImpl<$Res>;
  $Res call({int id, String name, List<MechanismState> states});
}

/// @nodoc
class _$ScenarioMechanismCopyWithImpl<$Res>
    implements $ScenarioMechanismCopyWith<$Res> {
  _$ScenarioMechanismCopyWithImpl(this._value, this._then);

  final ScenarioMechanism _value;
  // ignore: unused_field
  final $Res Function(ScenarioMechanism) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? states = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      states: states == freezed
          ? _value.states
          : states // ignore: cast_nullable_to_non_nullable
              as List<MechanismState>,
    ));
  }
}

/// @nodoc
abstract class _$ScenarioMechanismCopyWith<$Res>
    implements $ScenarioMechanismCopyWith<$Res> {
  factory _$ScenarioMechanismCopyWith(
          _ScenarioMechanism value, $Res Function(_ScenarioMechanism) then) =
      __$ScenarioMechanismCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, List<MechanismState> states});
}

/// @nodoc
class __$ScenarioMechanismCopyWithImpl<$Res>
    extends _$ScenarioMechanismCopyWithImpl<$Res>
    implements _$ScenarioMechanismCopyWith<$Res> {
  __$ScenarioMechanismCopyWithImpl(
      _ScenarioMechanism _value, $Res Function(_ScenarioMechanism) _then)
      : super(_value, (v) => _then(v as _ScenarioMechanism));

  @override
  _ScenarioMechanism get _value => super._value as _ScenarioMechanism;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? states = freezed,
  }) {
    return _then(_ScenarioMechanism(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      states: states == freezed
          ? _value.states
          : states // ignore: cast_nullable_to_non_nullable
              as List<MechanismState>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScenarioMechanism extends _ScenarioMechanism
    with DiagnosticableTreeMixin {
  const _$_ScenarioMechanism(
      {required this.id, required this.name, this.states = const []})
      : super._();

  factory _$_ScenarioMechanism.fromJson(Map<String, dynamic> json) =>
      _$$_ScenarioMechanismFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @JsonKey()
  @override
  final List<MechanismState> states;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScenarioMechanism(id: $id, name: $name, states: $states)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScenarioMechanism'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('states', states));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScenarioMechanism &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.states, states));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(states));

  @JsonKey(ignore: true)
  @override
  _$ScenarioMechanismCopyWith<_ScenarioMechanism> get copyWith =>
      __$ScenarioMechanismCopyWithImpl<_ScenarioMechanism>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScenarioMechanismToJson(this);
  }
}

abstract class _ScenarioMechanism extends ScenarioMechanism {
  const factory _ScenarioMechanism(
      {required int id,
      required String name,
      List<MechanismState> states}) = _$_ScenarioMechanism;
  const _ScenarioMechanism._() : super._();

  factory _ScenarioMechanism.fromJson(Map<String, dynamic> json) =
      _$_ScenarioMechanism.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  List<MechanismState> get states;
  @override
  @JsonKey(ignore: true)
  _$ScenarioMechanismCopyWith<_ScenarioMechanism> get copyWith =>
      throw _privateConstructorUsedError;
}

MechanismState _$MechanismStateFromJson(Map<String, dynamic> json) {
  return _MechanismState.fromJson(json);
}

/// @nodoc
class _$MechanismStateTearOff {
  const _$MechanismStateTearOff();

  _MechanismState call(
      {required int id,
      required String description,
      required String image,
      bool start = false,
      int? endTrack,
      List<MechanismTransition> transitions = const [],
      List<MechanismClue> clues = const [],
      String? codeHint}) {
    return _MechanismState(
      id: id,
      description: description,
      image: image,
      start: start,
      endTrack: endTrack,
      transitions: transitions,
      clues: clues,
      codeHint: codeHint,
    );
  }

  MechanismState fromJson(Map<String, Object?> json) {
    return MechanismState.fromJson(json);
  }
}

/// @nodoc
const $MechanismState = _$MechanismStateTearOff();

/// @nodoc
mixin _$MechanismState {
  int get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  bool get start => throw _privateConstructorUsedError;
  int? get endTrack => throw _privateConstructorUsedError;
  List<MechanismTransition> get transitions =>
      throw _privateConstructorUsedError;
  List<MechanismClue> get clues => throw _privateConstructorUsedError;
  String? get codeHint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MechanismStateCopyWith<MechanismState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MechanismStateCopyWith<$Res> {
  factory $MechanismStateCopyWith(
          MechanismState value, $Res Function(MechanismState) then) =
      _$MechanismStateCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String description,
      String image,
      bool start,
      int? endTrack,
      List<MechanismTransition> transitions,
      List<MechanismClue> clues,
      String? codeHint});
}

/// @nodoc
class _$MechanismStateCopyWithImpl<$Res>
    implements $MechanismStateCopyWith<$Res> {
  _$MechanismStateCopyWithImpl(this._value, this._then);

  final MechanismState _value;
  // ignore: unused_field
  final $Res Function(MechanismState) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? start = freezed,
    Object? endTrack = freezed,
    Object? transitions = freezed,
    Object? clues = freezed,
    Object? codeHint = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as bool,
      endTrack: endTrack == freezed
          ? _value.endTrack
          : endTrack // ignore: cast_nullable_to_non_nullable
              as int?,
      transitions: transitions == freezed
          ? _value.transitions
          : transitions // ignore: cast_nullable_to_non_nullable
              as List<MechanismTransition>,
      clues: clues == freezed
          ? _value.clues
          : clues // ignore: cast_nullable_to_non_nullable
              as List<MechanismClue>,
      codeHint: codeHint == freezed
          ? _value.codeHint
          : codeHint // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MechanismStateCopyWith<$Res>
    implements $MechanismStateCopyWith<$Res> {
  factory _$MechanismStateCopyWith(
          _MechanismState value, $Res Function(_MechanismState) then) =
      __$MechanismStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String description,
      String image,
      bool start,
      int? endTrack,
      List<MechanismTransition> transitions,
      List<MechanismClue> clues,
      String? codeHint});
}

/// @nodoc
class __$MechanismStateCopyWithImpl<$Res>
    extends _$MechanismStateCopyWithImpl<$Res>
    implements _$MechanismStateCopyWith<$Res> {
  __$MechanismStateCopyWithImpl(
      _MechanismState _value, $Res Function(_MechanismState) _then)
      : super(_value, (v) => _then(v as _MechanismState));

  @override
  _MechanismState get _value => super._value as _MechanismState;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? start = freezed,
    Object? endTrack = freezed,
    Object? transitions = freezed,
    Object? clues = freezed,
    Object? codeHint = freezed,
  }) {
    return _then(_MechanismState(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as bool,
      endTrack: endTrack == freezed
          ? _value.endTrack
          : endTrack // ignore: cast_nullable_to_non_nullable
              as int?,
      transitions: transitions == freezed
          ? _value.transitions
          : transitions // ignore: cast_nullable_to_non_nullable
              as List<MechanismTransition>,
      clues: clues == freezed
          ? _value.clues
          : clues // ignore: cast_nullable_to_non_nullable
              as List<MechanismClue>,
      codeHint: codeHint == freezed
          ? _value.codeHint
          : codeHint // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MechanismState extends _MechanismState with DiagnosticableTreeMixin {
  const _$_MechanismState(
      {required this.id,
      required this.description,
      required this.image,
      this.start = false,
      this.endTrack,
      this.transitions = const [],
      this.clues = const [],
      this.codeHint})
      : super._();

  factory _$_MechanismState.fromJson(Map<String, dynamic> json) =>
      _$$_MechanismStateFromJson(json);

  @override
  final int id;
  @override
  final String description;
  @override
  final String image;
  @JsonKey()
  @override
  final bool start;
  @override
  final int? endTrack;
  @JsonKey()
  @override
  final List<MechanismTransition> transitions;
  @JsonKey()
  @override
  final List<MechanismClue> clues;
  @override
  final String? codeHint;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MechanismState(id: $id, description: $description, image: $image, start: $start, endTrack: $endTrack, transitions: $transitions, clues: $clues, codeHint: $codeHint)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MechanismState'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('endTrack', endTrack))
      ..add(DiagnosticsProperty('transitions', transitions))
      ..add(DiagnosticsProperty('clues', clues))
      ..add(DiagnosticsProperty('codeHint', codeHint));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MechanismState &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.endTrack, endTrack) &&
            const DeepCollectionEquality()
                .equals(other.transitions, transitions) &&
            const DeepCollectionEquality().equals(other.clues, clues) &&
            const DeepCollectionEquality().equals(other.codeHint, codeHint));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(endTrack),
      const DeepCollectionEquality().hash(transitions),
      const DeepCollectionEquality().hash(clues),
      const DeepCollectionEquality().hash(codeHint));

  @JsonKey(ignore: true)
  @override
  _$MechanismStateCopyWith<_MechanismState> get copyWith =>
      __$MechanismStateCopyWithImpl<_MechanismState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MechanismStateToJson(this);
  }
}

abstract class _MechanismState extends MechanismState {
  const factory _MechanismState(
      {required int id,
      required String description,
      required String image,
      bool start,
      int? endTrack,
      List<MechanismTransition> transitions,
      List<MechanismClue> clues,
      String? codeHint}) = _$_MechanismState;
  const _MechanismState._() : super._();

  factory _MechanismState.fromJson(Map<String, dynamic> json) =
      _$_MechanismState.fromJson;

  @override
  int get id;
  @override
  String get description;
  @override
  String get image;
  @override
  bool get start;
  @override
  int? get endTrack;
  @override
  List<MechanismTransition> get transitions;
  @override
  List<MechanismClue> get clues;
  @override
  String? get codeHint;
  @override
  @JsonKey(ignore: true)
  _$MechanismStateCopyWith<_MechanismState> get copyWith =>
      throw _privateConstructorUsedError;
}

MechanismTransition _$MechanismTransitionFromJson(Map<String, dynamic> json) {
  return _MechanismTransition.fromJson(json);
}

/// @nodoc
class _$MechanismTransitionTearOff {
  const _$MechanismTransitionTearOff();

  _MechanismTransition call(
      {required int stateId,
      required int transitionTo,
      int? expectedItem,
      List<int> expectedItemList = const [],
      List<String> expectedCodes = const [],
      List<int> removedItems = const []}) {
    return _MechanismTransition(
      stateId: stateId,
      transitionTo: transitionTo,
      expectedItem: expectedItem,
      expectedItemList: expectedItemList,
      expectedCodes: expectedCodes,
      removedItems: removedItems,
    );
  }

  MechanismTransition fromJson(Map<String, Object?> json) {
    return MechanismTransition.fromJson(json);
  }
}

/// @nodoc
const $MechanismTransition = _$MechanismTransitionTearOff();

/// @nodoc
mixin _$MechanismTransition {
  int get stateId => throw _privateConstructorUsedError;
  int get transitionTo => throw _privateConstructorUsedError;
  int? get expectedItem => throw _privateConstructorUsedError;
  List<int> get expectedItemList => throw _privateConstructorUsedError;
  List<String> get expectedCodes => throw _privateConstructorUsedError;
  List<int> get removedItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MechanismTransitionCopyWith<MechanismTransition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MechanismTransitionCopyWith<$Res> {
  factory $MechanismTransitionCopyWith(
          MechanismTransition value, $Res Function(MechanismTransition) then) =
      _$MechanismTransitionCopyWithImpl<$Res>;
  $Res call(
      {int stateId,
      int transitionTo,
      int? expectedItem,
      List<int> expectedItemList,
      List<String> expectedCodes,
      List<int> removedItems});
}

/// @nodoc
class _$MechanismTransitionCopyWithImpl<$Res>
    implements $MechanismTransitionCopyWith<$Res> {
  _$MechanismTransitionCopyWithImpl(this._value, this._then);

  final MechanismTransition _value;
  // ignore: unused_field
  final $Res Function(MechanismTransition) _then;

  @override
  $Res call({
    Object? stateId = freezed,
    Object? transitionTo = freezed,
    Object? expectedItem = freezed,
    Object? expectedItemList = freezed,
    Object? expectedCodes = freezed,
    Object? removedItems = freezed,
  }) {
    return _then(_value.copyWith(
      stateId: stateId == freezed
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int,
      transitionTo: transitionTo == freezed
          ? _value.transitionTo
          : transitionTo // ignore: cast_nullable_to_non_nullable
              as int,
      expectedItem: expectedItem == freezed
          ? _value.expectedItem
          : expectedItem // ignore: cast_nullable_to_non_nullable
              as int?,
      expectedItemList: expectedItemList == freezed
          ? _value.expectedItemList
          : expectedItemList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      expectedCodes: expectedCodes == freezed
          ? _value.expectedCodes
          : expectedCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      removedItems: removedItems == freezed
          ? _value.removedItems
          : removedItems // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
abstract class _$MechanismTransitionCopyWith<$Res>
    implements $MechanismTransitionCopyWith<$Res> {
  factory _$MechanismTransitionCopyWith(_MechanismTransition value,
          $Res Function(_MechanismTransition) then) =
      __$MechanismTransitionCopyWithImpl<$Res>;
  @override
  $Res call(
      {int stateId,
      int transitionTo,
      int? expectedItem,
      List<int> expectedItemList,
      List<String> expectedCodes,
      List<int> removedItems});
}

/// @nodoc
class __$MechanismTransitionCopyWithImpl<$Res>
    extends _$MechanismTransitionCopyWithImpl<$Res>
    implements _$MechanismTransitionCopyWith<$Res> {
  __$MechanismTransitionCopyWithImpl(
      _MechanismTransition _value, $Res Function(_MechanismTransition) _then)
      : super(_value, (v) => _then(v as _MechanismTransition));

  @override
  _MechanismTransition get _value => super._value as _MechanismTransition;

  @override
  $Res call({
    Object? stateId = freezed,
    Object? transitionTo = freezed,
    Object? expectedItem = freezed,
    Object? expectedItemList = freezed,
    Object? expectedCodes = freezed,
    Object? removedItems = freezed,
  }) {
    return _then(_MechanismTransition(
      stateId: stateId == freezed
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int,
      transitionTo: transitionTo == freezed
          ? _value.transitionTo
          : transitionTo // ignore: cast_nullable_to_non_nullable
              as int,
      expectedItem: expectedItem == freezed
          ? _value.expectedItem
          : expectedItem // ignore: cast_nullable_to_non_nullable
              as int?,
      expectedItemList: expectedItemList == freezed
          ? _value.expectedItemList
          : expectedItemList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      expectedCodes: expectedCodes == freezed
          ? _value.expectedCodes
          : expectedCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      removedItems: removedItems == freezed
          ? _value.removedItems
          : removedItems // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MechanismTransition extends _MechanismTransition
    with DiagnosticableTreeMixin {
  const _$_MechanismTransition(
      {required this.stateId,
      required this.transitionTo,
      this.expectedItem,
      this.expectedItemList = const [],
      this.expectedCodes = const [],
      this.removedItems = const []})
      : super._();

  factory _$_MechanismTransition.fromJson(Map<String, dynamic> json) =>
      _$$_MechanismTransitionFromJson(json);

  @override
  final int stateId;
  @override
  final int transitionTo;
  @override
  final int? expectedItem;
  @JsonKey()
  @override
  final List<int> expectedItemList;
  @JsonKey()
  @override
  final List<String> expectedCodes;
  @JsonKey()
  @override
  final List<int> removedItems;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MechanismTransition(stateId: $stateId, transitionTo: $transitionTo, expectedItem: $expectedItem, expectedItemList: $expectedItemList, expectedCodes: $expectedCodes, removedItems: $removedItems)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MechanismTransition'))
      ..add(DiagnosticsProperty('stateId', stateId))
      ..add(DiagnosticsProperty('transitionTo', transitionTo))
      ..add(DiagnosticsProperty('expectedItem', expectedItem))
      ..add(DiagnosticsProperty('expectedItemList', expectedItemList))
      ..add(DiagnosticsProperty('expectedCodes', expectedCodes))
      ..add(DiagnosticsProperty('removedItems', removedItems));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MechanismTransition &&
            const DeepCollectionEquality().equals(other.stateId, stateId) &&
            const DeepCollectionEquality()
                .equals(other.transitionTo, transitionTo) &&
            const DeepCollectionEquality()
                .equals(other.expectedItem, expectedItem) &&
            const DeepCollectionEquality()
                .equals(other.expectedItemList, expectedItemList) &&
            const DeepCollectionEquality()
                .equals(other.expectedCodes, expectedCodes) &&
            const DeepCollectionEquality()
                .equals(other.removedItems, removedItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stateId),
      const DeepCollectionEquality().hash(transitionTo),
      const DeepCollectionEquality().hash(expectedItem),
      const DeepCollectionEquality().hash(expectedItemList),
      const DeepCollectionEquality().hash(expectedCodes),
      const DeepCollectionEquality().hash(removedItems));

  @JsonKey(ignore: true)
  @override
  _$MechanismTransitionCopyWith<_MechanismTransition> get copyWith =>
      __$MechanismTransitionCopyWithImpl<_MechanismTransition>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MechanismTransitionToJson(this);
  }
}

abstract class _MechanismTransition extends MechanismTransition {
  const factory _MechanismTransition(
      {required int stateId,
      required int transitionTo,
      int? expectedItem,
      List<int> expectedItemList,
      List<String> expectedCodes,
      List<int> removedItems}) = _$_MechanismTransition;
  const _MechanismTransition._() : super._();

  factory _MechanismTransition.fromJson(Map<String, dynamic> json) =
      _$_MechanismTransition.fromJson;

  @override
  int get stateId;
  @override
  int get transitionTo;
  @override
  int? get expectedItem;
  @override
  List<int> get expectedItemList;
  @override
  List<String> get expectedCodes;
  @override
  List<int> get removedItems;
  @override
  @JsonKey(ignore: true)
  _$MechanismTransitionCopyWith<_MechanismTransition> get copyWith =>
      throw _privateConstructorUsedError;
}

MechanismClue _$MechanismClueFromJson(Map<String, dynamic> json) {
  return _MechanismClue.fromJson(json);
}

/// @nodoc
class _$MechanismClueTearOff {
  const _$MechanismClueTearOff();

  _MechanismClue call({required int id, required String description}) {
    return _MechanismClue(
      id: id,
      description: description,
    );
  }

  MechanismClue fromJson(Map<String, Object?> json) {
    return MechanismClue.fromJson(json);
  }
}

/// @nodoc
const $MechanismClue = _$MechanismClueTearOff();

/// @nodoc
mixin _$MechanismClue {
  int get id => throw _privateConstructorUsedError;
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
      _$MechanismClueCopyWithImpl<$Res>;
  $Res call({int id, String description});
}

/// @nodoc
class _$MechanismClueCopyWithImpl<$Res>
    implements $MechanismClueCopyWith<$Res> {
  _$MechanismClueCopyWithImpl(this._value, this._then);

  final MechanismClue _value;
  // ignore: unused_field
  final $Res Function(MechanismClue) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MechanismClueCopyWith<$Res>
    implements $MechanismClueCopyWith<$Res> {
  factory _$MechanismClueCopyWith(
          _MechanismClue value, $Res Function(_MechanismClue) then) =
      __$MechanismClueCopyWithImpl<$Res>;
  @override
  $Res call({int id, String description});
}

/// @nodoc
class __$MechanismClueCopyWithImpl<$Res>
    extends _$MechanismClueCopyWithImpl<$Res>
    implements _$MechanismClueCopyWith<$Res> {
  __$MechanismClueCopyWithImpl(
      _MechanismClue _value, $Res Function(_MechanismClue) _then)
      : super(_value, (v) => _then(v as _MechanismClue));

  @override
  _MechanismClue get _value => super._value as _MechanismClue;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
  }) {
    return _then(_MechanismClue(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MechanismClue extends _MechanismClue with DiagnosticableTreeMixin {
  const _$_MechanismClue({required this.id, required this.description})
      : super._();

  factory _$_MechanismClue.fromJson(Map<String, dynamic> json) =>
      _$$_MechanismClueFromJson(json);

  @override
  final int id;
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
            other is _MechanismClue &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$MechanismClueCopyWith<_MechanismClue> get copyWith =>
      __$MechanismClueCopyWithImpl<_MechanismClue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MechanismClueToJson(this);
  }
}

abstract class _MechanismClue extends MechanismClue {
  const factory _MechanismClue({required int id, required String description}) =
      _$_MechanismClue;
  const _MechanismClue._() : super._();

  factory _MechanismClue.fromJson(Map<String, dynamic> json) =
      _$_MechanismClue.fromJson;

  @override
  int get id;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$MechanismClueCopyWith<_MechanismClue> get copyWith =>
      throw _privateConstructorUsedError;
}
