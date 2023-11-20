// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scenario_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScenarioItem _$ScenarioItemFromJson(Map<String, dynamic> json) {
  return _ScenarioItem.fromJson(json);
}

/// @nodoc
mixin _$ScenarioItem {
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get hasQrCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScenarioItemCopyWith<ScenarioItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScenarioItemCopyWith<$Res> {
  factory $ScenarioItemCopyWith(
          ScenarioItem value, $Res Function(ScenarioItem) then) =
      _$ScenarioItemCopyWithImpl<$Res, ScenarioItem>;
  @useResult
  $Res call(
      {String id,
      String description,
      String image,
      String title,
      bool hasQrCode});
}

/// @nodoc
class _$ScenarioItemCopyWithImpl<$Res, $Val extends ScenarioItem>
    implements $ScenarioItemCopyWith<$Res> {
  _$ScenarioItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? image = null,
    Object? title = null,
    Object? hasQrCode = null,
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
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      hasQrCode: null == hasQrCode
          ? _value.hasQrCode
          : hasQrCode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScenarioItemImplCopyWith<$Res>
    implements $ScenarioItemCopyWith<$Res> {
  factory _$$ScenarioItemImplCopyWith(
          _$ScenarioItemImpl value, $Res Function(_$ScenarioItemImpl) then) =
      __$$ScenarioItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String description,
      String image,
      String title,
      bool hasQrCode});
}

/// @nodoc
class __$$ScenarioItemImplCopyWithImpl<$Res>
    extends _$ScenarioItemCopyWithImpl<$Res, _$ScenarioItemImpl>
    implements _$$ScenarioItemImplCopyWith<$Res> {
  __$$ScenarioItemImplCopyWithImpl(
      _$ScenarioItemImpl _value, $Res Function(_$ScenarioItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? image = null,
    Object? title = null,
    Object? hasQrCode = null,
  }) {
    return _then(_$ScenarioItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      hasQrCode: null == hasQrCode
          ? _value.hasQrCode
          : hasQrCode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScenarioItemImpl extends _ScenarioItem with DiagnosticableTreeMixin {
  const _$ScenarioItemImpl(
      {required this.id,
      required this.description,
      required this.image,
      required this.title,
      this.hasQrCode = false})
      : super._();

  factory _$ScenarioItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScenarioItemImplFromJson(json);

  @override
  final String id;
  @override
  final String description;
  @override
  final String image;
  @override
  final String title;
  @override
  @JsonKey()
  final bool hasQrCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScenarioItem(id: $id, description: $description, image: $image, title: $title, hasQrCode: $hasQrCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScenarioItem'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('hasQrCode', hasQrCode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScenarioItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.hasQrCode, hasQrCode) ||
                other.hasQrCode == hasQrCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, description, image, title, hasQrCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScenarioItemImplCopyWith<_$ScenarioItemImpl> get copyWith =>
      __$$ScenarioItemImplCopyWithImpl<_$ScenarioItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScenarioItemImplToJson(
      this,
    );
  }
}

abstract class _ScenarioItem extends ScenarioItem {
  const factory _ScenarioItem(
      {required final String id,
      required final String description,
      required final String image,
      required final String title,
      final bool hasQrCode}) = _$ScenarioItemImpl;
  const _ScenarioItem._() : super._();

  factory _ScenarioItem.fromJson(Map<String, dynamic> json) =
      _$ScenarioItemImpl.fromJson;

  @override
  String get id;
  @override
  String get description;
  @override
  String get image;
  @override
  String get title;
  @override
  bool get hasQrCode;
  @override
  @JsonKey(ignore: true)
  _$$ScenarioItemImplCopyWith<_$ScenarioItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
