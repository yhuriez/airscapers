// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'navigation_intent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NavigationIntentTearOff {
  const _$NavigationIntentTearOff();

  _NavigationIntentSuccess success() {
    return const _NavigationIntentSuccess();
  }

  _NavigationIntentMechanism mechanism({required ScenarioMechanism mechanism}) {
    return _NavigationIntentMechanism(
      mechanism: mechanism,
    );
  }

  _NavigationIntentItemDetails itemDetails(
      {required ScenarioItem item, bool found = false}) {
    return _NavigationIntentItemDetails(
      item: item,
      found: found,
    );
  }

  _NavigationIntentDialog dialog({required DialogArguments arguments}) {
    return _NavigationIntentDialog(
      arguments: arguments,
    );
  }
}

/// @nodoc
const $NavigationIntent = _$NavigationIntentTearOff();

/// @nodoc
mixin _$NavigationIntent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(ScenarioMechanism mechanism) mechanism,
    required TResult Function(ScenarioItem item, bool found) itemDetails,
    required TResult Function(DialogArguments arguments) dialog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(ScenarioMechanism mechanism)? mechanism,
    TResult Function(ScenarioItem item, bool found)? itemDetails,
    TResult Function(DialogArguments arguments)? dialog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(ScenarioMechanism mechanism)? mechanism,
    TResult Function(ScenarioItem item, bool found)? itemDetails,
    TResult Function(DialogArguments arguments)? dialog,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NavigationIntentSuccess value) success,
    required TResult Function(_NavigationIntentMechanism value) mechanism,
    required TResult Function(_NavigationIntentItemDetails value) itemDetails,
    required TResult Function(_NavigationIntentDialog value) dialog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NavigationIntentSuccess value)? success,
    TResult Function(_NavigationIntentMechanism value)? mechanism,
    TResult Function(_NavigationIntentItemDetails value)? itemDetails,
    TResult Function(_NavigationIntentDialog value)? dialog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NavigationIntentSuccess value)? success,
    TResult Function(_NavigationIntentMechanism value)? mechanism,
    TResult Function(_NavigationIntentItemDetails value)? itemDetails,
    TResult Function(_NavigationIntentDialog value)? dialog,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationIntentCopyWith<$Res> {
  factory $NavigationIntentCopyWith(
          NavigationIntent value, $Res Function(NavigationIntent) then) =
      _$NavigationIntentCopyWithImpl<$Res>;
}

/// @nodoc
class _$NavigationIntentCopyWithImpl<$Res>
    implements $NavigationIntentCopyWith<$Res> {
  _$NavigationIntentCopyWithImpl(this._value, this._then);

  final NavigationIntent _value;
  // ignore: unused_field
  final $Res Function(NavigationIntent) _then;
}

/// @nodoc
abstract class _$NavigationIntentSuccessCopyWith<$Res> {
  factory _$NavigationIntentSuccessCopyWith(_NavigationIntentSuccess value,
          $Res Function(_NavigationIntentSuccess) then) =
      __$NavigationIntentSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$NavigationIntentSuccessCopyWithImpl<$Res>
    extends _$NavigationIntentCopyWithImpl<$Res>
    implements _$NavigationIntentSuccessCopyWith<$Res> {
  __$NavigationIntentSuccessCopyWithImpl(_NavigationIntentSuccess _value,
      $Res Function(_NavigationIntentSuccess) _then)
      : super(_value, (v) => _then(v as _NavigationIntentSuccess));

  @override
  _NavigationIntentSuccess get _value =>
      super._value as _NavigationIntentSuccess;
}

/// @nodoc

class _$_NavigationIntentSuccess extends _NavigationIntentSuccess
    with DiagnosticableTreeMixin {
  const _$_NavigationIntentSuccess() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NavigationIntent.success()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'NavigationIntent.success'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NavigationIntentSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(ScenarioMechanism mechanism) mechanism,
    required TResult Function(ScenarioItem item, bool found) itemDetails,
    required TResult Function(DialogArguments arguments) dialog,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(ScenarioMechanism mechanism)? mechanism,
    TResult Function(ScenarioItem item, bool found)? itemDetails,
    TResult Function(DialogArguments arguments)? dialog,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(ScenarioMechanism mechanism)? mechanism,
    TResult Function(ScenarioItem item, bool found)? itemDetails,
    TResult Function(DialogArguments arguments)? dialog,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NavigationIntentSuccess value) success,
    required TResult Function(_NavigationIntentMechanism value) mechanism,
    required TResult Function(_NavigationIntentItemDetails value) itemDetails,
    required TResult Function(_NavigationIntentDialog value) dialog,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NavigationIntentSuccess value)? success,
    TResult Function(_NavigationIntentMechanism value)? mechanism,
    TResult Function(_NavigationIntentItemDetails value)? itemDetails,
    TResult Function(_NavigationIntentDialog value)? dialog,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NavigationIntentSuccess value)? success,
    TResult Function(_NavigationIntentMechanism value)? mechanism,
    TResult Function(_NavigationIntentItemDetails value)? itemDetails,
    TResult Function(_NavigationIntentDialog value)? dialog,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _NavigationIntentSuccess extends NavigationIntent {
  const factory _NavigationIntentSuccess() = _$_NavigationIntentSuccess;
  const _NavigationIntentSuccess._() : super._();
}

/// @nodoc
abstract class _$NavigationIntentMechanismCopyWith<$Res> {
  factory _$NavigationIntentMechanismCopyWith(_NavigationIntentMechanism value,
          $Res Function(_NavigationIntentMechanism) then) =
      __$NavigationIntentMechanismCopyWithImpl<$Res>;
  $Res call({ScenarioMechanism mechanism});

  $ScenarioMechanismCopyWith<$Res> get mechanism;
}

/// @nodoc
class __$NavigationIntentMechanismCopyWithImpl<$Res>
    extends _$NavigationIntentCopyWithImpl<$Res>
    implements _$NavigationIntentMechanismCopyWith<$Res> {
  __$NavigationIntentMechanismCopyWithImpl(_NavigationIntentMechanism _value,
      $Res Function(_NavigationIntentMechanism) _then)
      : super(_value, (v) => _then(v as _NavigationIntentMechanism));

  @override
  _NavigationIntentMechanism get _value =>
      super._value as _NavigationIntentMechanism;

  @override
  $Res call({
    Object? mechanism = freezed,
  }) {
    return _then(_NavigationIntentMechanism(
      mechanism: mechanism == freezed
          ? _value.mechanism
          : mechanism // ignore: cast_nullable_to_non_nullable
              as ScenarioMechanism,
    ));
  }

  @override
  $ScenarioMechanismCopyWith<$Res> get mechanism {
    return $ScenarioMechanismCopyWith<$Res>(_value.mechanism, (value) {
      return _then(_value.copyWith(mechanism: value));
    });
  }
}

/// @nodoc

class _$_NavigationIntentMechanism extends _NavigationIntentMechanism
    with DiagnosticableTreeMixin {
  const _$_NavigationIntentMechanism({required this.mechanism}) : super._();

  @override
  final ScenarioMechanism mechanism;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NavigationIntent.mechanism(mechanism: $mechanism)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NavigationIntent.mechanism'))
      ..add(DiagnosticsProperty('mechanism', mechanism));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NavigationIntentMechanism &&
            const DeepCollectionEquality().equals(other.mechanism, mechanism));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(mechanism));

  @JsonKey(ignore: true)
  @override
  _$NavigationIntentMechanismCopyWith<_NavigationIntentMechanism>
      get copyWith =>
          __$NavigationIntentMechanismCopyWithImpl<_NavigationIntentMechanism>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(ScenarioMechanism mechanism) mechanism,
    required TResult Function(ScenarioItem item, bool found) itemDetails,
    required TResult Function(DialogArguments arguments) dialog,
  }) {
    return mechanism(this.mechanism);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(ScenarioMechanism mechanism)? mechanism,
    TResult Function(ScenarioItem item, bool found)? itemDetails,
    TResult Function(DialogArguments arguments)? dialog,
  }) {
    return mechanism?.call(this.mechanism);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(ScenarioMechanism mechanism)? mechanism,
    TResult Function(ScenarioItem item, bool found)? itemDetails,
    TResult Function(DialogArguments arguments)? dialog,
    required TResult orElse(),
  }) {
    if (mechanism != null) {
      return mechanism(this.mechanism);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NavigationIntentSuccess value) success,
    required TResult Function(_NavigationIntentMechanism value) mechanism,
    required TResult Function(_NavigationIntentItemDetails value) itemDetails,
    required TResult Function(_NavigationIntentDialog value) dialog,
  }) {
    return mechanism(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NavigationIntentSuccess value)? success,
    TResult Function(_NavigationIntentMechanism value)? mechanism,
    TResult Function(_NavigationIntentItemDetails value)? itemDetails,
    TResult Function(_NavigationIntentDialog value)? dialog,
  }) {
    return mechanism?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NavigationIntentSuccess value)? success,
    TResult Function(_NavigationIntentMechanism value)? mechanism,
    TResult Function(_NavigationIntentItemDetails value)? itemDetails,
    TResult Function(_NavigationIntentDialog value)? dialog,
    required TResult orElse(),
  }) {
    if (mechanism != null) {
      return mechanism(this);
    }
    return orElse();
  }
}

abstract class _NavigationIntentMechanism extends NavigationIntent {
  const factory _NavigationIntentMechanism(
      {required ScenarioMechanism mechanism}) = _$_NavigationIntentMechanism;
  const _NavigationIntentMechanism._() : super._();

  ScenarioMechanism get mechanism;
  @JsonKey(ignore: true)
  _$NavigationIntentMechanismCopyWith<_NavigationIntentMechanism>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NavigationIntentItemDetailsCopyWith<$Res> {
  factory _$NavigationIntentItemDetailsCopyWith(
          _NavigationIntentItemDetails value,
          $Res Function(_NavigationIntentItemDetails) then) =
      __$NavigationIntentItemDetailsCopyWithImpl<$Res>;
  $Res call({ScenarioItem item, bool found});

  $ScenarioItemCopyWith<$Res> get item;
}

/// @nodoc
class __$NavigationIntentItemDetailsCopyWithImpl<$Res>
    extends _$NavigationIntentCopyWithImpl<$Res>
    implements _$NavigationIntentItemDetailsCopyWith<$Res> {
  __$NavigationIntentItemDetailsCopyWithImpl(
      _NavigationIntentItemDetails _value,
      $Res Function(_NavigationIntentItemDetails) _then)
      : super(_value, (v) => _then(v as _NavigationIntentItemDetails));

  @override
  _NavigationIntentItemDetails get _value =>
      super._value as _NavigationIntentItemDetails;

  @override
  $Res call({
    Object? item = freezed,
    Object? found = freezed,
  }) {
    return _then(_NavigationIntentItemDetails(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ScenarioItem,
      found: found == freezed
          ? _value.found
          : found // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $ScenarioItemCopyWith<$Res> get item {
    return $ScenarioItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$_NavigationIntentItemDetails extends _NavigationIntentItemDetails
    with DiagnosticableTreeMixin {
  const _$_NavigationIntentItemDetails({required this.item, this.found = false})
      : super._();

  @override
  final ScenarioItem item;
  @JsonKey()
  @override
  final bool found;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NavigationIntent.itemDetails(item: $item, found: $found)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NavigationIntent.itemDetails'))
      ..add(DiagnosticsProperty('item', item))
      ..add(DiagnosticsProperty('found', found));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NavigationIntentItemDetails &&
            const DeepCollectionEquality().equals(other.item, item) &&
            const DeepCollectionEquality().equals(other.found, found));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(item),
      const DeepCollectionEquality().hash(found));

  @JsonKey(ignore: true)
  @override
  _$NavigationIntentItemDetailsCopyWith<_NavigationIntentItemDetails>
      get copyWith => __$NavigationIntentItemDetailsCopyWithImpl<
          _NavigationIntentItemDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(ScenarioMechanism mechanism) mechanism,
    required TResult Function(ScenarioItem item, bool found) itemDetails,
    required TResult Function(DialogArguments arguments) dialog,
  }) {
    return itemDetails(item, found);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(ScenarioMechanism mechanism)? mechanism,
    TResult Function(ScenarioItem item, bool found)? itemDetails,
    TResult Function(DialogArguments arguments)? dialog,
  }) {
    return itemDetails?.call(item, found);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(ScenarioMechanism mechanism)? mechanism,
    TResult Function(ScenarioItem item, bool found)? itemDetails,
    TResult Function(DialogArguments arguments)? dialog,
    required TResult orElse(),
  }) {
    if (itemDetails != null) {
      return itemDetails(item, found);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NavigationIntentSuccess value) success,
    required TResult Function(_NavigationIntentMechanism value) mechanism,
    required TResult Function(_NavigationIntentItemDetails value) itemDetails,
    required TResult Function(_NavigationIntentDialog value) dialog,
  }) {
    return itemDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NavigationIntentSuccess value)? success,
    TResult Function(_NavigationIntentMechanism value)? mechanism,
    TResult Function(_NavigationIntentItemDetails value)? itemDetails,
    TResult Function(_NavigationIntentDialog value)? dialog,
  }) {
    return itemDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NavigationIntentSuccess value)? success,
    TResult Function(_NavigationIntentMechanism value)? mechanism,
    TResult Function(_NavigationIntentItemDetails value)? itemDetails,
    TResult Function(_NavigationIntentDialog value)? dialog,
    required TResult orElse(),
  }) {
    if (itemDetails != null) {
      return itemDetails(this);
    }
    return orElse();
  }
}

abstract class _NavigationIntentItemDetails extends NavigationIntent {
  const factory _NavigationIntentItemDetails(
      {required ScenarioItem item,
      bool found}) = _$_NavigationIntentItemDetails;
  const _NavigationIntentItemDetails._() : super._();

  ScenarioItem get item;
  bool get found;
  @JsonKey(ignore: true)
  _$NavigationIntentItemDetailsCopyWith<_NavigationIntentItemDetails>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NavigationIntentDialogCopyWith<$Res> {
  factory _$NavigationIntentDialogCopyWith(_NavigationIntentDialog value,
          $Res Function(_NavigationIntentDialog) then) =
      __$NavigationIntentDialogCopyWithImpl<$Res>;
  $Res call({DialogArguments arguments});
}

/// @nodoc
class __$NavigationIntentDialogCopyWithImpl<$Res>
    extends _$NavigationIntentCopyWithImpl<$Res>
    implements _$NavigationIntentDialogCopyWith<$Res> {
  __$NavigationIntentDialogCopyWithImpl(_NavigationIntentDialog _value,
      $Res Function(_NavigationIntentDialog) _then)
      : super(_value, (v) => _then(v as _NavigationIntentDialog));

  @override
  _NavigationIntentDialog get _value => super._value as _NavigationIntentDialog;

  @override
  $Res call({
    Object? arguments = freezed,
  }) {
    return _then(_NavigationIntentDialog(
      arguments: arguments == freezed
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as DialogArguments,
    ));
  }
}

/// @nodoc

class _$_NavigationIntentDialog extends _NavigationIntentDialog
    with DiagnosticableTreeMixin {
  const _$_NavigationIntentDialog({required this.arguments}) : super._();

  @override
  final DialogArguments arguments;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NavigationIntent.dialog(arguments: $arguments)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NavigationIntent.dialog'))
      ..add(DiagnosticsProperty('arguments', arguments));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NavigationIntentDialog &&
            const DeepCollectionEquality().equals(other.arguments, arguments));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(arguments));

  @JsonKey(ignore: true)
  @override
  _$NavigationIntentDialogCopyWith<_NavigationIntentDialog> get copyWith =>
      __$NavigationIntentDialogCopyWithImpl<_NavigationIntentDialog>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(ScenarioMechanism mechanism) mechanism,
    required TResult Function(ScenarioItem item, bool found) itemDetails,
    required TResult Function(DialogArguments arguments) dialog,
  }) {
    return dialog(arguments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(ScenarioMechanism mechanism)? mechanism,
    TResult Function(ScenarioItem item, bool found)? itemDetails,
    TResult Function(DialogArguments arguments)? dialog,
  }) {
    return dialog?.call(arguments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(ScenarioMechanism mechanism)? mechanism,
    TResult Function(ScenarioItem item, bool found)? itemDetails,
    TResult Function(DialogArguments arguments)? dialog,
    required TResult orElse(),
  }) {
    if (dialog != null) {
      return dialog(arguments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NavigationIntentSuccess value) success,
    required TResult Function(_NavigationIntentMechanism value) mechanism,
    required TResult Function(_NavigationIntentItemDetails value) itemDetails,
    required TResult Function(_NavigationIntentDialog value) dialog,
  }) {
    return dialog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NavigationIntentSuccess value)? success,
    TResult Function(_NavigationIntentMechanism value)? mechanism,
    TResult Function(_NavigationIntentItemDetails value)? itemDetails,
    TResult Function(_NavigationIntentDialog value)? dialog,
  }) {
    return dialog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NavigationIntentSuccess value)? success,
    TResult Function(_NavigationIntentMechanism value)? mechanism,
    TResult Function(_NavigationIntentItemDetails value)? itemDetails,
    TResult Function(_NavigationIntentDialog value)? dialog,
    required TResult orElse(),
  }) {
    if (dialog != null) {
      return dialog(this);
    }
    return orElse();
  }
}

abstract class _NavigationIntentDialog extends NavigationIntent {
  const factory _NavigationIntentDialog({required DialogArguments arguments}) =
      _$_NavigationIntentDialog;
  const _NavigationIntentDialog._() : super._();

  DialogArguments get arguments;
  @JsonKey(ignore: true)
  _$NavigationIntentDialogCopyWith<_NavigationIntentDialog> get copyWith =>
      throw _privateConstructorUsedError;
}
