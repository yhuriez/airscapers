// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mechanism_solving.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MechanismSolving _$MechanismSolvingFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'pick':
      return MechanismSolvingPick.fromJson(json);
    case 'search':
      return MechanismSolvingSearch.fromJson(json);
    case 'visual':
      return MechanismSolvingVisual.fromJson(json);
    case 'code':
      return MechanismSolvingCode.fromJson(json);
    case 'use':
      return MechanismSolvingUse.fromJson(json);
    case 'combine':
      return MechanismSolvingCombine.fromJson(json);
    case 'activation':
      return MechanismSolvingActivation.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'MechanismSolving',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$MechanismSolving {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String newItem) pick,
    required TResult Function(List<ScenarioLoot> loots) search,
    required TResult Function() visual,
    required TResult Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)
        code,
    required TResult Function(String expectedItem, List<String> removedItems)
        use,
    required TResult Function(
            List<String> expectedItemList, List<String> removedItems)
        combine,
    required TResult Function(List<String> mechanismIds) activation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String newItem)? pick,
    TResult? Function(List<ScenarioLoot> loots)? search,
    TResult? Function()? visual,
    TResult? Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)?
        code,
    TResult? Function(String expectedItem, List<String> removedItems)? use,
    TResult? Function(List<String> expectedItemList, List<String> removedItems)?
        combine,
    TResult? Function(List<String> mechanismIds)? activation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String newItem)? pick,
    TResult Function(List<ScenarioLoot> loots)? search,
    TResult Function()? visual,
    TResult Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)?
        code,
    TResult Function(String expectedItem, List<String> removedItems)? use,
    TResult Function(List<String> expectedItemList, List<String> removedItems)?
        combine,
    TResult Function(List<String> mechanismIds)? activation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MechanismSolvingPick value) pick,
    required TResult Function(MechanismSolvingSearch value) search,
    required TResult Function(MechanismSolvingVisual value) visual,
    required TResult Function(MechanismSolvingCode value) code,
    required TResult Function(MechanismSolvingUse value) use,
    required TResult Function(MechanismSolvingCombine value) combine,
    required TResult Function(MechanismSolvingActivation value) activation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MechanismSolvingPick value)? pick,
    TResult? Function(MechanismSolvingSearch value)? search,
    TResult? Function(MechanismSolvingVisual value)? visual,
    TResult? Function(MechanismSolvingCode value)? code,
    TResult? Function(MechanismSolvingUse value)? use,
    TResult? Function(MechanismSolvingCombine value)? combine,
    TResult? Function(MechanismSolvingActivation value)? activation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MechanismSolvingPick value)? pick,
    TResult Function(MechanismSolvingSearch value)? search,
    TResult Function(MechanismSolvingVisual value)? visual,
    TResult Function(MechanismSolvingCode value)? code,
    TResult Function(MechanismSolvingUse value)? use,
    TResult Function(MechanismSolvingCombine value)? combine,
    TResult Function(MechanismSolvingActivation value)? activation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MechanismSolvingCopyWith<$Res> {
  factory $MechanismSolvingCopyWith(
          MechanismSolving value, $Res Function(MechanismSolving) then) =
      _$MechanismSolvingCopyWithImpl<$Res, MechanismSolving>;
}

/// @nodoc
class _$MechanismSolvingCopyWithImpl<$Res, $Val extends MechanismSolving>
    implements $MechanismSolvingCopyWith<$Res> {
  _$MechanismSolvingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MechanismSolvingPickImplCopyWith<$Res> {
  factory _$$MechanismSolvingPickImplCopyWith(_$MechanismSolvingPickImpl value,
          $Res Function(_$MechanismSolvingPickImpl) then) =
      __$$MechanismSolvingPickImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String newItem});
}

/// @nodoc
class __$$MechanismSolvingPickImplCopyWithImpl<$Res>
    extends _$MechanismSolvingCopyWithImpl<$Res, _$MechanismSolvingPickImpl>
    implements _$$MechanismSolvingPickImplCopyWith<$Res> {
  __$$MechanismSolvingPickImplCopyWithImpl(_$MechanismSolvingPickImpl _value,
      $Res Function(_$MechanismSolvingPickImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newItem = null,
  }) {
    return _then(_$MechanismSolvingPickImpl(
      null == newItem
          ? _value.newItem
          : newItem // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MechanismSolvingPickImpl
    with DiagnosticableTreeMixin
    implements MechanismSolvingPick {
  const _$MechanismSolvingPickImpl(this.newItem, {final String? $type})
      : $type = $type ?? 'pick';

  factory _$MechanismSolvingPickImpl.fromJson(Map<String, dynamic> json) =>
      _$$MechanismSolvingPickImplFromJson(json);

  @override
  final String newItem;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MechanismSolving.pick(newItem: $newItem)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MechanismSolving.pick'))
      ..add(DiagnosticsProperty('newItem', newItem));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MechanismSolvingPickImpl &&
            (identical(other.newItem, newItem) || other.newItem == newItem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, newItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MechanismSolvingPickImplCopyWith<_$MechanismSolvingPickImpl>
      get copyWith =>
          __$$MechanismSolvingPickImplCopyWithImpl<_$MechanismSolvingPickImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String newItem) pick,
    required TResult Function(List<ScenarioLoot> loots) search,
    required TResult Function() visual,
    required TResult Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)
        code,
    required TResult Function(String expectedItem, List<String> removedItems)
        use,
    required TResult Function(
            List<String> expectedItemList, List<String> removedItems)
        combine,
    required TResult Function(List<String> mechanismIds) activation,
  }) {
    return pick(newItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String newItem)? pick,
    TResult? Function(List<ScenarioLoot> loots)? search,
    TResult? Function()? visual,
    TResult? Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)?
        code,
    TResult? Function(String expectedItem, List<String> removedItems)? use,
    TResult? Function(List<String> expectedItemList, List<String> removedItems)?
        combine,
    TResult? Function(List<String> mechanismIds)? activation,
  }) {
    return pick?.call(newItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String newItem)? pick,
    TResult Function(List<ScenarioLoot> loots)? search,
    TResult Function()? visual,
    TResult Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)?
        code,
    TResult Function(String expectedItem, List<String> removedItems)? use,
    TResult Function(List<String> expectedItemList, List<String> removedItems)?
        combine,
    TResult Function(List<String> mechanismIds)? activation,
    required TResult orElse(),
  }) {
    if (pick != null) {
      return pick(newItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MechanismSolvingPick value) pick,
    required TResult Function(MechanismSolvingSearch value) search,
    required TResult Function(MechanismSolvingVisual value) visual,
    required TResult Function(MechanismSolvingCode value) code,
    required TResult Function(MechanismSolvingUse value) use,
    required TResult Function(MechanismSolvingCombine value) combine,
    required TResult Function(MechanismSolvingActivation value) activation,
  }) {
    return pick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MechanismSolvingPick value)? pick,
    TResult? Function(MechanismSolvingSearch value)? search,
    TResult? Function(MechanismSolvingVisual value)? visual,
    TResult? Function(MechanismSolvingCode value)? code,
    TResult? Function(MechanismSolvingUse value)? use,
    TResult? Function(MechanismSolvingCombine value)? combine,
    TResult? Function(MechanismSolvingActivation value)? activation,
  }) {
    return pick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MechanismSolvingPick value)? pick,
    TResult Function(MechanismSolvingSearch value)? search,
    TResult Function(MechanismSolvingVisual value)? visual,
    TResult Function(MechanismSolvingCode value)? code,
    TResult Function(MechanismSolvingUse value)? use,
    TResult Function(MechanismSolvingCombine value)? combine,
    TResult Function(MechanismSolvingActivation value)? activation,
    required TResult orElse(),
  }) {
    if (pick != null) {
      return pick(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MechanismSolvingPickImplToJson(
      this,
    );
  }
}

abstract class MechanismSolvingPick implements MechanismSolving {
  const factory MechanismSolvingPick(final String newItem) =
      _$MechanismSolvingPickImpl;

  factory MechanismSolvingPick.fromJson(Map<String, dynamic> json) =
      _$MechanismSolvingPickImpl.fromJson;

  String get newItem;
  @JsonKey(ignore: true)
  _$$MechanismSolvingPickImplCopyWith<_$MechanismSolvingPickImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MechanismSolvingSearchImplCopyWith<$Res> {
  factory _$$MechanismSolvingSearchImplCopyWith(
          _$MechanismSolvingSearchImpl value,
          $Res Function(_$MechanismSolvingSearchImpl) then) =
      __$$MechanismSolvingSearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ScenarioLoot> loots});
}

/// @nodoc
class __$$MechanismSolvingSearchImplCopyWithImpl<$Res>
    extends _$MechanismSolvingCopyWithImpl<$Res, _$MechanismSolvingSearchImpl>
    implements _$$MechanismSolvingSearchImplCopyWith<$Res> {
  __$$MechanismSolvingSearchImplCopyWithImpl(
      _$MechanismSolvingSearchImpl _value,
      $Res Function(_$MechanismSolvingSearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loots = null,
  }) {
    return _then(_$MechanismSolvingSearchImpl(
      null == loots
          ? _value._loots
          : loots // ignore: cast_nullable_to_non_nullable
              as List<ScenarioLoot>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MechanismSolvingSearchImpl
    with DiagnosticableTreeMixin
    implements MechanismSolvingSearch {
  const _$MechanismSolvingSearchImpl(final List<ScenarioLoot> loots,
      {final String? $type})
      : _loots = loots,
        $type = $type ?? 'search';

  factory _$MechanismSolvingSearchImpl.fromJson(Map<String, dynamic> json) =>
      _$$MechanismSolvingSearchImplFromJson(json);

  final List<ScenarioLoot> _loots;
  @override
  List<ScenarioLoot> get loots {
    if (_loots is EqualUnmodifiableListView) return _loots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loots);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MechanismSolving.search(loots: $loots)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MechanismSolving.search'))
      ..add(DiagnosticsProperty('loots', loots));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MechanismSolvingSearchImpl &&
            const DeepCollectionEquality().equals(other._loots, _loots));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_loots));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MechanismSolvingSearchImplCopyWith<_$MechanismSolvingSearchImpl>
      get copyWith => __$$MechanismSolvingSearchImplCopyWithImpl<
          _$MechanismSolvingSearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String newItem) pick,
    required TResult Function(List<ScenarioLoot> loots) search,
    required TResult Function() visual,
    required TResult Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)
        code,
    required TResult Function(String expectedItem, List<String> removedItems)
        use,
    required TResult Function(
            List<String> expectedItemList, List<String> removedItems)
        combine,
    required TResult Function(List<String> mechanismIds) activation,
  }) {
    return search(loots);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String newItem)? pick,
    TResult? Function(List<ScenarioLoot> loots)? search,
    TResult? Function()? visual,
    TResult? Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)?
        code,
    TResult? Function(String expectedItem, List<String> removedItems)? use,
    TResult? Function(List<String> expectedItemList, List<String> removedItems)?
        combine,
    TResult? Function(List<String> mechanismIds)? activation,
  }) {
    return search?.call(loots);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String newItem)? pick,
    TResult Function(List<ScenarioLoot> loots)? search,
    TResult Function()? visual,
    TResult Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)?
        code,
    TResult Function(String expectedItem, List<String> removedItems)? use,
    TResult Function(List<String> expectedItemList, List<String> removedItems)?
        combine,
    TResult Function(List<String> mechanismIds)? activation,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(loots);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MechanismSolvingPick value) pick,
    required TResult Function(MechanismSolvingSearch value) search,
    required TResult Function(MechanismSolvingVisual value) visual,
    required TResult Function(MechanismSolvingCode value) code,
    required TResult Function(MechanismSolvingUse value) use,
    required TResult Function(MechanismSolvingCombine value) combine,
    required TResult Function(MechanismSolvingActivation value) activation,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MechanismSolvingPick value)? pick,
    TResult? Function(MechanismSolvingSearch value)? search,
    TResult? Function(MechanismSolvingVisual value)? visual,
    TResult? Function(MechanismSolvingCode value)? code,
    TResult? Function(MechanismSolvingUse value)? use,
    TResult? Function(MechanismSolvingCombine value)? combine,
    TResult? Function(MechanismSolvingActivation value)? activation,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MechanismSolvingPick value)? pick,
    TResult Function(MechanismSolvingSearch value)? search,
    TResult Function(MechanismSolvingVisual value)? visual,
    TResult Function(MechanismSolvingCode value)? code,
    TResult Function(MechanismSolvingUse value)? use,
    TResult Function(MechanismSolvingCombine value)? combine,
    TResult Function(MechanismSolvingActivation value)? activation,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MechanismSolvingSearchImplToJson(
      this,
    );
  }
}

abstract class MechanismSolvingSearch implements MechanismSolving {
  const factory MechanismSolvingSearch(final List<ScenarioLoot> loots) =
      _$MechanismSolvingSearchImpl;

  factory MechanismSolvingSearch.fromJson(Map<String, dynamic> json) =
      _$MechanismSolvingSearchImpl.fromJson;

  List<ScenarioLoot> get loots;
  @JsonKey(ignore: true)
  _$$MechanismSolvingSearchImplCopyWith<_$MechanismSolvingSearchImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MechanismSolvingVisualImplCopyWith<$Res> {
  factory _$$MechanismSolvingVisualImplCopyWith(
          _$MechanismSolvingVisualImpl value,
          $Res Function(_$MechanismSolvingVisualImpl) then) =
      __$$MechanismSolvingVisualImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MechanismSolvingVisualImplCopyWithImpl<$Res>
    extends _$MechanismSolvingCopyWithImpl<$Res, _$MechanismSolvingVisualImpl>
    implements _$$MechanismSolvingVisualImplCopyWith<$Res> {
  __$$MechanismSolvingVisualImplCopyWithImpl(
      _$MechanismSolvingVisualImpl _value,
      $Res Function(_$MechanismSolvingVisualImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$MechanismSolvingVisualImpl
    with DiagnosticableTreeMixin
    implements MechanismSolvingVisual {
  const _$MechanismSolvingVisualImpl({final String? $type})
      : $type = $type ?? 'visual';

  factory _$MechanismSolvingVisualImpl.fromJson(Map<String, dynamic> json) =>
      _$$MechanismSolvingVisualImplFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MechanismSolving.visual()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'MechanismSolving.visual'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MechanismSolvingVisualImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String newItem) pick,
    required TResult Function(List<ScenarioLoot> loots) search,
    required TResult Function() visual,
    required TResult Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)
        code,
    required TResult Function(String expectedItem, List<String> removedItems)
        use,
    required TResult Function(
            List<String> expectedItemList, List<String> removedItems)
        combine,
    required TResult Function(List<String> mechanismIds) activation,
  }) {
    return visual();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String newItem)? pick,
    TResult? Function(List<ScenarioLoot> loots)? search,
    TResult? Function()? visual,
    TResult? Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)?
        code,
    TResult? Function(String expectedItem, List<String> removedItems)? use,
    TResult? Function(List<String> expectedItemList, List<String> removedItems)?
        combine,
    TResult? Function(List<String> mechanismIds)? activation,
  }) {
    return visual?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String newItem)? pick,
    TResult Function(List<ScenarioLoot> loots)? search,
    TResult Function()? visual,
    TResult Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)?
        code,
    TResult Function(String expectedItem, List<String> removedItems)? use,
    TResult Function(List<String> expectedItemList, List<String> removedItems)?
        combine,
    TResult Function(List<String> mechanismIds)? activation,
    required TResult orElse(),
  }) {
    if (visual != null) {
      return visual();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MechanismSolvingPick value) pick,
    required TResult Function(MechanismSolvingSearch value) search,
    required TResult Function(MechanismSolvingVisual value) visual,
    required TResult Function(MechanismSolvingCode value) code,
    required TResult Function(MechanismSolvingUse value) use,
    required TResult Function(MechanismSolvingCombine value) combine,
    required TResult Function(MechanismSolvingActivation value) activation,
  }) {
    return visual(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MechanismSolvingPick value)? pick,
    TResult? Function(MechanismSolvingSearch value)? search,
    TResult? Function(MechanismSolvingVisual value)? visual,
    TResult? Function(MechanismSolvingCode value)? code,
    TResult? Function(MechanismSolvingUse value)? use,
    TResult? Function(MechanismSolvingCombine value)? combine,
    TResult? Function(MechanismSolvingActivation value)? activation,
  }) {
    return visual?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MechanismSolvingPick value)? pick,
    TResult Function(MechanismSolvingSearch value)? search,
    TResult Function(MechanismSolvingVisual value)? visual,
    TResult Function(MechanismSolvingCode value)? code,
    TResult Function(MechanismSolvingUse value)? use,
    TResult Function(MechanismSolvingCombine value)? combine,
    TResult Function(MechanismSolvingActivation value)? activation,
    required TResult orElse(),
  }) {
    if (visual != null) {
      return visual(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MechanismSolvingVisualImplToJson(
      this,
    );
  }
}

abstract class MechanismSolvingVisual implements MechanismSolving {
  const factory MechanismSolvingVisual() = _$MechanismSolvingVisualImpl;

  factory MechanismSolvingVisual.fromJson(Map<String, dynamic> json) =
      _$MechanismSolvingVisualImpl.fromJson;
}

/// @nodoc
abstract class _$$MechanismSolvingCodeImplCopyWith<$Res> {
  factory _$$MechanismSolvingCodeImplCopyWith(_$MechanismSolvingCodeImpl value,
          $Res Function(_$MechanismSolvingCodeImpl) then) =
      __$$MechanismSolvingCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<String> expectedCodes,
      String? codeHint,
      List<String> removedItems});
}

/// @nodoc
class __$$MechanismSolvingCodeImplCopyWithImpl<$Res>
    extends _$MechanismSolvingCopyWithImpl<$Res, _$MechanismSolvingCodeImpl>
    implements _$$MechanismSolvingCodeImplCopyWith<$Res> {
  __$$MechanismSolvingCodeImplCopyWithImpl(_$MechanismSolvingCodeImpl _value,
      $Res Function(_$MechanismSolvingCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expectedCodes = null,
    Object? codeHint = freezed,
    Object? removedItems = null,
  }) {
    return _then(_$MechanismSolvingCodeImpl(
      null == expectedCodes
          ? _value._expectedCodes
          : expectedCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      freezed == codeHint
          ? _value.codeHint
          : codeHint // ignore: cast_nullable_to_non_nullable
              as String?,
      null == removedItems
          ? _value._removedItems
          : removedItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MechanismSolvingCodeImpl
    with DiagnosticableTreeMixin
    implements MechanismSolvingCode {
  const _$MechanismSolvingCodeImpl(final List<String> expectedCodes,
      this.codeHint, final List<String> removedItems,
      {final String? $type})
      : _expectedCodes = expectedCodes,
        _removedItems = removedItems,
        $type = $type ?? 'code';

  factory _$MechanismSolvingCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$MechanismSolvingCodeImplFromJson(json);

  final List<String> _expectedCodes;
  @override
  List<String> get expectedCodes {
    if (_expectedCodes is EqualUnmodifiableListView) return _expectedCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expectedCodes);
  }

  @override
  final String? codeHint;
  final List<String> _removedItems;
  @override
  List<String> get removedItems {
    if (_removedItems is EqualUnmodifiableListView) return _removedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_removedItems);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MechanismSolving.code(expectedCodes: $expectedCodes, codeHint: $codeHint, removedItems: $removedItems)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MechanismSolving.code'))
      ..add(DiagnosticsProperty('expectedCodes', expectedCodes))
      ..add(DiagnosticsProperty('codeHint', codeHint))
      ..add(DiagnosticsProperty('removedItems', removedItems));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MechanismSolvingCodeImpl &&
            const DeepCollectionEquality()
                .equals(other._expectedCodes, _expectedCodes) &&
            (identical(other.codeHint, codeHint) ||
                other.codeHint == codeHint) &&
            const DeepCollectionEquality()
                .equals(other._removedItems, _removedItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_expectedCodes),
      codeHint,
      const DeepCollectionEquality().hash(_removedItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MechanismSolvingCodeImplCopyWith<_$MechanismSolvingCodeImpl>
      get copyWith =>
          __$$MechanismSolvingCodeImplCopyWithImpl<_$MechanismSolvingCodeImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String newItem) pick,
    required TResult Function(List<ScenarioLoot> loots) search,
    required TResult Function() visual,
    required TResult Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)
        code,
    required TResult Function(String expectedItem, List<String> removedItems)
        use,
    required TResult Function(
            List<String> expectedItemList, List<String> removedItems)
        combine,
    required TResult Function(List<String> mechanismIds) activation,
  }) {
    return code(expectedCodes, codeHint, removedItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String newItem)? pick,
    TResult? Function(List<ScenarioLoot> loots)? search,
    TResult? Function()? visual,
    TResult? Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)?
        code,
    TResult? Function(String expectedItem, List<String> removedItems)? use,
    TResult? Function(List<String> expectedItemList, List<String> removedItems)?
        combine,
    TResult? Function(List<String> mechanismIds)? activation,
  }) {
    return code?.call(expectedCodes, codeHint, removedItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String newItem)? pick,
    TResult Function(List<ScenarioLoot> loots)? search,
    TResult Function()? visual,
    TResult Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)?
        code,
    TResult Function(String expectedItem, List<String> removedItems)? use,
    TResult Function(List<String> expectedItemList, List<String> removedItems)?
        combine,
    TResult Function(List<String> mechanismIds)? activation,
    required TResult orElse(),
  }) {
    if (code != null) {
      return code(expectedCodes, codeHint, removedItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MechanismSolvingPick value) pick,
    required TResult Function(MechanismSolvingSearch value) search,
    required TResult Function(MechanismSolvingVisual value) visual,
    required TResult Function(MechanismSolvingCode value) code,
    required TResult Function(MechanismSolvingUse value) use,
    required TResult Function(MechanismSolvingCombine value) combine,
    required TResult Function(MechanismSolvingActivation value) activation,
  }) {
    return code(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MechanismSolvingPick value)? pick,
    TResult? Function(MechanismSolvingSearch value)? search,
    TResult? Function(MechanismSolvingVisual value)? visual,
    TResult? Function(MechanismSolvingCode value)? code,
    TResult? Function(MechanismSolvingUse value)? use,
    TResult? Function(MechanismSolvingCombine value)? combine,
    TResult? Function(MechanismSolvingActivation value)? activation,
  }) {
    return code?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MechanismSolvingPick value)? pick,
    TResult Function(MechanismSolvingSearch value)? search,
    TResult Function(MechanismSolvingVisual value)? visual,
    TResult Function(MechanismSolvingCode value)? code,
    TResult Function(MechanismSolvingUse value)? use,
    TResult Function(MechanismSolvingCombine value)? combine,
    TResult Function(MechanismSolvingActivation value)? activation,
    required TResult orElse(),
  }) {
    if (code != null) {
      return code(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MechanismSolvingCodeImplToJson(
      this,
    );
  }
}

abstract class MechanismSolvingCode implements MechanismSolving {
  const factory MechanismSolvingCode(
      final List<String> expectedCodes,
      final String? codeHint,
      final List<String> removedItems) = _$MechanismSolvingCodeImpl;

  factory MechanismSolvingCode.fromJson(Map<String, dynamic> json) =
      _$MechanismSolvingCodeImpl.fromJson;

  List<String> get expectedCodes;
  String? get codeHint;
  List<String> get removedItems;
  @JsonKey(ignore: true)
  _$$MechanismSolvingCodeImplCopyWith<_$MechanismSolvingCodeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MechanismSolvingUseImplCopyWith<$Res> {
  factory _$$MechanismSolvingUseImplCopyWith(_$MechanismSolvingUseImpl value,
          $Res Function(_$MechanismSolvingUseImpl) then) =
      __$$MechanismSolvingUseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String expectedItem, List<String> removedItems});
}

/// @nodoc
class __$$MechanismSolvingUseImplCopyWithImpl<$Res>
    extends _$MechanismSolvingCopyWithImpl<$Res, _$MechanismSolvingUseImpl>
    implements _$$MechanismSolvingUseImplCopyWith<$Res> {
  __$$MechanismSolvingUseImplCopyWithImpl(_$MechanismSolvingUseImpl _value,
      $Res Function(_$MechanismSolvingUseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expectedItem = null,
    Object? removedItems = null,
  }) {
    return _then(_$MechanismSolvingUseImpl(
      null == expectedItem
          ? _value.expectedItem
          : expectedItem // ignore: cast_nullable_to_non_nullable
              as String,
      null == removedItems
          ? _value._removedItems
          : removedItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MechanismSolvingUseImpl
    with DiagnosticableTreeMixin
    implements MechanismSolvingUse {
  const _$MechanismSolvingUseImpl(
      this.expectedItem, final List<String> removedItems,
      {final String? $type})
      : _removedItems = removedItems,
        $type = $type ?? 'use';

  factory _$MechanismSolvingUseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MechanismSolvingUseImplFromJson(json);

  @override
  final String expectedItem;
  final List<String> _removedItems;
  @override
  List<String> get removedItems {
    if (_removedItems is EqualUnmodifiableListView) return _removedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_removedItems);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MechanismSolving.use(expectedItem: $expectedItem, removedItems: $removedItems)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MechanismSolving.use'))
      ..add(DiagnosticsProperty('expectedItem', expectedItem))
      ..add(DiagnosticsProperty('removedItems', removedItems));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MechanismSolvingUseImpl &&
            (identical(other.expectedItem, expectedItem) ||
                other.expectedItem == expectedItem) &&
            const DeepCollectionEquality()
                .equals(other._removedItems, _removedItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, expectedItem,
      const DeepCollectionEquality().hash(_removedItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MechanismSolvingUseImplCopyWith<_$MechanismSolvingUseImpl> get copyWith =>
      __$$MechanismSolvingUseImplCopyWithImpl<_$MechanismSolvingUseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String newItem) pick,
    required TResult Function(List<ScenarioLoot> loots) search,
    required TResult Function() visual,
    required TResult Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)
        code,
    required TResult Function(String expectedItem, List<String> removedItems)
        use,
    required TResult Function(
            List<String> expectedItemList, List<String> removedItems)
        combine,
    required TResult Function(List<String> mechanismIds) activation,
  }) {
    return use(expectedItem, removedItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String newItem)? pick,
    TResult? Function(List<ScenarioLoot> loots)? search,
    TResult? Function()? visual,
    TResult? Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)?
        code,
    TResult? Function(String expectedItem, List<String> removedItems)? use,
    TResult? Function(List<String> expectedItemList, List<String> removedItems)?
        combine,
    TResult? Function(List<String> mechanismIds)? activation,
  }) {
    return use?.call(expectedItem, removedItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String newItem)? pick,
    TResult Function(List<ScenarioLoot> loots)? search,
    TResult Function()? visual,
    TResult Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)?
        code,
    TResult Function(String expectedItem, List<String> removedItems)? use,
    TResult Function(List<String> expectedItemList, List<String> removedItems)?
        combine,
    TResult Function(List<String> mechanismIds)? activation,
    required TResult orElse(),
  }) {
    if (use != null) {
      return use(expectedItem, removedItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MechanismSolvingPick value) pick,
    required TResult Function(MechanismSolvingSearch value) search,
    required TResult Function(MechanismSolvingVisual value) visual,
    required TResult Function(MechanismSolvingCode value) code,
    required TResult Function(MechanismSolvingUse value) use,
    required TResult Function(MechanismSolvingCombine value) combine,
    required TResult Function(MechanismSolvingActivation value) activation,
  }) {
    return use(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MechanismSolvingPick value)? pick,
    TResult? Function(MechanismSolvingSearch value)? search,
    TResult? Function(MechanismSolvingVisual value)? visual,
    TResult? Function(MechanismSolvingCode value)? code,
    TResult? Function(MechanismSolvingUse value)? use,
    TResult? Function(MechanismSolvingCombine value)? combine,
    TResult? Function(MechanismSolvingActivation value)? activation,
  }) {
    return use?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MechanismSolvingPick value)? pick,
    TResult Function(MechanismSolvingSearch value)? search,
    TResult Function(MechanismSolvingVisual value)? visual,
    TResult Function(MechanismSolvingCode value)? code,
    TResult Function(MechanismSolvingUse value)? use,
    TResult Function(MechanismSolvingCombine value)? combine,
    TResult Function(MechanismSolvingActivation value)? activation,
    required TResult orElse(),
  }) {
    if (use != null) {
      return use(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MechanismSolvingUseImplToJson(
      this,
    );
  }
}

abstract class MechanismSolvingUse implements MechanismSolving {
  const factory MechanismSolvingUse(
          final String expectedItem, final List<String> removedItems) =
      _$MechanismSolvingUseImpl;

  factory MechanismSolvingUse.fromJson(Map<String, dynamic> json) =
      _$MechanismSolvingUseImpl.fromJson;

  String get expectedItem;
  List<String> get removedItems;
  @JsonKey(ignore: true)
  _$$MechanismSolvingUseImplCopyWith<_$MechanismSolvingUseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MechanismSolvingCombineImplCopyWith<$Res> {
  factory _$$MechanismSolvingCombineImplCopyWith(
          _$MechanismSolvingCombineImpl value,
          $Res Function(_$MechanismSolvingCombineImpl) then) =
      __$$MechanismSolvingCombineImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> expectedItemList, List<String> removedItems});
}

/// @nodoc
class __$$MechanismSolvingCombineImplCopyWithImpl<$Res>
    extends _$MechanismSolvingCopyWithImpl<$Res, _$MechanismSolvingCombineImpl>
    implements _$$MechanismSolvingCombineImplCopyWith<$Res> {
  __$$MechanismSolvingCombineImplCopyWithImpl(
      _$MechanismSolvingCombineImpl _value,
      $Res Function(_$MechanismSolvingCombineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expectedItemList = null,
    Object? removedItems = null,
  }) {
    return _then(_$MechanismSolvingCombineImpl(
      null == expectedItemList
          ? _value._expectedItemList
          : expectedItemList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == removedItems
          ? _value._removedItems
          : removedItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MechanismSolvingCombineImpl
    with DiagnosticableTreeMixin
    implements MechanismSolvingCombine {
  const _$MechanismSolvingCombineImpl(
      final List<String> expectedItemList, final List<String> removedItems,
      {final String? $type})
      : _expectedItemList = expectedItemList,
        _removedItems = removedItems,
        $type = $type ?? 'combine';

  factory _$MechanismSolvingCombineImpl.fromJson(Map<String, dynamic> json) =>
      _$$MechanismSolvingCombineImplFromJson(json);

  final List<String> _expectedItemList;
  @override
  List<String> get expectedItemList {
    if (_expectedItemList is EqualUnmodifiableListView)
      return _expectedItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expectedItemList);
  }

  final List<String> _removedItems;
  @override
  List<String> get removedItems {
    if (_removedItems is EqualUnmodifiableListView) return _removedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_removedItems);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MechanismSolving.combine(expectedItemList: $expectedItemList, removedItems: $removedItems)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MechanismSolving.combine'))
      ..add(DiagnosticsProperty('expectedItemList', expectedItemList))
      ..add(DiagnosticsProperty('removedItems', removedItems));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MechanismSolvingCombineImpl &&
            const DeepCollectionEquality()
                .equals(other._expectedItemList, _expectedItemList) &&
            const DeepCollectionEquality()
                .equals(other._removedItems, _removedItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_expectedItemList),
      const DeepCollectionEquality().hash(_removedItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MechanismSolvingCombineImplCopyWith<_$MechanismSolvingCombineImpl>
      get copyWith => __$$MechanismSolvingCombineImplCopyWithImpl<
          _$MechanismSolvingCombineImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String newItem) pick,
    required TResult Function(List<ScenarioLoot> loots) search,
    required TResult Function() visual,
    required TResult Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)
        code,
    required TResult Function(String expectedItem, List<String> removedItems)
        use,
    required TResult Function(
            List<String> expectedItemList, List<String> removedItems)
        combine,
    required TResult Function(List<String> mechanismIds) activation,
  }) {
    return combine(expectedItemList, removedItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String newItem)? pick,
    TResult? Function(List<ScenarioLoot> loots)? search,
    TResult? Function()? visual,
    TResult? Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)?
        code,
    TResult? Function(String expectedItem, List<String> removedItems)? use,
    TResult? Function(List<String> expectedItemList, List<String> removedItems)?
        combine,
    TResult? Function(List<String> mechanismIds)? activation,
  }) {
    return combine?.call(expectedItemList, removedItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String newItem)? pick,
    TResult Function(List<ScenarioLoot> loots)? search,
    TResult Function()? visual,
    TResult Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)?
        code,
    TResult Function(String expectedItem, List<String> removedItems)? use,
    TResult Function(List<String> expectedItemList, List<String> removedItems)?
        combine,
    TResult Function(List<String> mechanismIds)? activation,
    required TResult orElse(),
  }) {
    if (combine != null) {
      return combine(expectedItemList, removedItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MechanismSolvingPick value) pick,
    required TResult Function(MechanismSolvingSearch value) search,
    required TResult Function(MechanismSolvingVisual value) visual,
    required TResult Function(MechanismSolvingCode value) code,
    required TResult Function(MechanismSolvingUse value) use,
    required TResult Function(MechanismSolvingCombine value) combine,
    required TResult Function(MechanismSolvingActivation value) activation,
  }) {
    return combine(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MechanismSolvingPick value)? pick,
    TResult? Function(MechanismSolvingSearch value)? search,
    TResult? Function(MechanismSolvingVisual value)? visual,
    TResult? Function(MechanismSolvingCode value)? code,
    TResult? Function(MechanismSolvingUse value)? use,
    TResult? Function(MechanismSolvingCombine value)? combine,
    TResult? Function(MechanismSolvingActivation value)? activation,
  }) {
    return combine?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MechanismSolvingPick value)? pick,
    TResult Function(MechanismSolvingSearch value)? search,
    TResult Function(MechanismSolvingVisual value)? visual,
    TResult Function(MechanismSolvingCode value)? code,
    TResult Function(MechanismSolvingUse value)? use,
    TResult Function(MechanismSolvingCombine value)? combine,
    TResult Function(MechanismSolvingActivation value)? activation,
    required TResult orElse(),
  }) {
    if (combine != null) {
      return combine(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MechanismSolvingCombineImplToJson(
      this,
    );
  }
}

abstract class MechanismSolvingCombine implements MechanismSolving {
  const factory MechanismSolvingCombine(final List<String> expectedItemList,
      final List<String> removedItems) = _$MechanismSolvingCombineImpl;

  factory MechanismSolvingCombine.fromJson(Map<String, dynamic> json) =
      _$MechanismSolvingCombineImpl.fromJson;

  List<String> get expectedItemList;
  List<String> get removedItems;
  @JsonKey(ignore: true)
  _$$MechanismSolvingCombineImplCopyWith<_$MechanismSolvingCombineImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MechanismSolvingActivationImplCopyWith<$Res> {
  factory _$$MechanismSolvingActivationImplCopyWith(
          _$MechanismSolvingActivationImpl value,
          $Res Function(_$MechanismSolvingActivationImpl) then) =
      __$$MechanismSolvingActivationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> mechanismIds});
}

/// @nodoc
class __$$MechanismSolvingActivationImplCopyWithImpl<$Res>
    extends _$MechanismSolvingCopyWithImpl<$Res,
        _$MechanismSolvingActivationImpl>
    implements _$$MechanismSolvingActivationImplCopyWith<$Res> {
  __$$MechanismSolvingActivationImplCopyWithImpl(
      _$MechanismSolvingActivationImpl _value,
      $Res Function(_$MechanismSolvingActivationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mechanismIds = null,
  }) {
    return _then(_$MechanismSolvingActivationImpl(
      null == mechanismIds
          ? _value._mechanismIds
          : mechanismIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MechanismSolvingActivationImpl
    with DiagnosticableTreeMixin
    implements MechanismSolvingActivation {
  const _$MechanismSolvingActivationImpl(final List<String> mechanismIds,
      {final String? $type})
      : _mechanismIds = mechanismIds,
        $type = $type ?? 'activation';

  factory _$MechanismSolvingActivationImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MechanismSolvingActivationImplFromJson(json);

  final List<String> _mechanismIds;
  @override
  List<String> get mechanismIds {
    if (_mechanismIds is EqualUnmodifiableListView) return _mechanismIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mechanismIds);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MechanismSolving.activation(mechanismIds: $mechanismIds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MechanismSolving.activation'))
      ..add(DiagnosticsProperty('mechanismIds', mechanismIds));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MechanismSolvingActivationImpl &&
            const DeepCollectionEquality()
                .equals(other._mechanismIds, _mechanismIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_mechanismIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MechanismSolvingActivationImplCopyWith<_$MechanismSolvingActivationImpl>
      get copyWith => __$$MechanismSolvingActivationImplCopyWithImpl<
          _$MechanismSolvingActivationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String newItem) pick,
    required TResult Function(List<ScenarioLoot> loots) search,
    required TResult Function() visual,
    required TResult Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)
        code,
    required TResult Function(String expectedItem, List<String> removedItems)
        use,
    required TResult Function(
            List<String> expectedItemList, List<String> removedItems)
        combine,
    required TResult Function(List<String> mechanismIds) activation,
  }) {
    return activation(mechanismIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String newItem)? pick,
    TResult? Function(List<ScenarioLoot> loots)? search,
    TResult? Function()? visual,
    TResult? Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)?
        code,
    TResult? Function(String expectedItem, List<String> removedItems)? use,
    TResult? Function(List<String> expectedItemList, List<String> removedItems)?
        combine,
    TResult? Function(List<String> mechanismIds)? activation,
  }) {
    return activation?.call(mechanismIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String newItem)? pick,
    TResult Function(List<ScenarioLoot> loots)? search,
    TResult Function()? visual,
    TResult Function(List<String> expectedCodes, String? codeHint,
            List<String> removedItems)?
        code,
    TResult Function(String expectedItem, List<String> removedItems)? use,
    TResult Function(List<String> expectedItemList, List<String> removedItems)?
        combine,
    TResult Function(List<String> mechanismIds)? activation,
    required TResult orElse(),
  }) {
    if (activation != null) {
      return activation(mechanismIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MechanismSolvingPick value) pick,
    required TResult Function(MechanismSolvingSearch value) search,
    required TResult Function(MechanismSolvingVisual value) visual,
    required TResult Function(MechanismSolvingCode value) code,
    required TResult Function(MechanismSolvingUse value) use,
    required TResult Function(MechanismSolvingCombine value) combine,
    required TResult Function(MechanismSolvingActivation value) activation,
  }) {
    return activation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MechanismSolvingPick value)? pick,
    TResult? Function(MechanismSolvingSearch value)? search,
    TResult? Function(MechanismSolvingVisual value)? visual,
    TResult? Function(MechanismSolvingCode value)? code,
    TResult? Function(MechanismSolvingUse value)? use,
    TResult? Function(MechanismSolvingCombine value)? combine,
    TResult? Function(MechanismSolvingActivation value)? activation,
  }) {
    return activation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MechanismSolvingPick value)? pick,
    TResult Function(MechanismSolvingSearch value)? search,
    TResult Function(MechanismSolvingVisual value)? visual,
    TResult Function(MechanismSolvingCode value)? code,
    TResult Function(MechanismSolvingUse value)? use,
    TResult Function(MechanismSolvingCombine value)? combine,
    TResult Function(MechanismSolvingActivation value)? activation,
    required TResult orElse(),
  }) {
    if (activation != null) {
      return activation(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MechanismSolvingActivationImplToJson(
      this,
    );
  }
}

abstract class MechanismSolvingActivation implements MechanismSolving {
  const factory MechanismSolvingActivation(final List<String> mechanismIds) =
      _$MechanismSolvingActivationImpl;

  factory MechanismSolvingActivation.fromJson(Map<String, dynamic> json) =
      _$MechanismSolvingActivationImpl.fromJson;

  List<String> get mechanismIds;
  @JsonKey(ignore: true)
  _$$MechanismSolvingActivationImplCopyWith<_$MechanismSolvingActivationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
