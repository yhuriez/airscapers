// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'scenario_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScenarioItem _$ScenarioItemFromJson(Map<String, dynamic> json) {
  return _ScenarioItem.fromJson(json);
}

/// @nodoc
class _$ScenarioItemTearOff {
  const _$ScenarioItemTearOff();

  _ScenarioItem call(
      {required int id,
      required String description,
      required String image,
      required String title,
      String? foundDescription,
      List<ScenarioLoot> loots = const [],
      bool isPickedUp = false,
      bool isZoomable = false,
      bool endTrack = false,
      bool hasQrCode = false}) {
    return _ScenarioItem(
      id: id,
      description: description,
      image: image,
      title: title,
      foundDescription: foundDescription,
      loots: loots,
      isPickedUp: isPickedUp,
      isZoomable: isZoomable,
      endTrack: endTrack,
      hasQrCode: hasQrCode,
    );
  }

  ScenarioItem fromJson(Map<String, Object?> json) {
    return ScenarioItem.fromJson(json);
  }
}

/// @nodoc
const $ScenarioItem = _$ScenarioItemTearOff();

/// @nodoc
mixin _$ScenarioItem {
  int get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get foundDescription => throw _privateConstructorUsedError;
  List<ScenarioLoot> get loots => throw _privateConstructorUsedError;
  bool get isPickedUp => throw _privateConstructorUsedError;
  bool get isZoomable => throw _privateConstructorUsedError;
  bool get endTrack => throw _privateConstructorUsedError;
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
      _$ScenarioItemCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String description,
      String image,
      String title,
      String? foundDescription,
      List<ScenarioLoot> loots,
      bool isPickedUp,
      bool isZoomable,
      bool endTrack,
      bool hasQrCode});
}

/// @nodoc
class _$ScenarioItemCopyWithImpl<$Res> implements $ScenarioItemCopyWith<$Res> {
  _$ScenarioItemCopyWithImpl(this._value, this._then);

  final ScenarioItem _value;
  // ignore: unused_field
  final $Res Function(ScenarioItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? title = freezed,
    Object? foundDescription = freezed,
    Object? loots = freezed,
    Object? isPickedUp = freezed,
    Object? isZoomable = freezed,
    Object? endTrack = freezed,
    Object? hasQrCode = freezed,
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
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      foundDescription: foundDescription == freezed
          ? _value.foundDescription
          : foundDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      loots: loots == freezed
          ? _value.loots
          : loots // ignore: cast_nullable_to_non_nullable
              as List<ScenarioLoot>,
      isPickedUp: isPickedUp == freezed
          ? _value.isPickedUp
          : isPickedUp // ignore: cast_nullable_to_non_nullable
              as bool,
      isZoomable: isZoomable == freezed
          ? _value.isZoomable
          : isZoomable // ignore: cast_nullable_to_non_nullable
              as bool,
      endTrack: endTrack == freezed
          ? _value.endTrack
          : endTrack // ignore: cast_nullable_to_non_nullable
              as bool,
      hasQrCode: hasQrCode == freezed
          ? _value.hasQrCode
          : hasQrCode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ScenarioItemCopyWith<$Res>
    implements $ScenarioItemCopyWith<$Res> {
  factory _$ScenarioItemCopyWith(
          _ScenarioItem value, $Res Function(_ScenarioItem) then) =
      __$ScenarioItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String description,
      String image,
      String title,
      String? foundDescription,
      List<ScenarioLoot> loots,
      bool isPickedUp,
      bool isZoomable,
      bool endTrack,
      bool hasQrCode});
}

/// @nodoc
class __$ScenarioItemCopyWithImpl<$Res> extends _$ScenarioItemCopyWithImpl<$Res>
    implements _$ScenarioItemCopyWith<$Res> {
  __$ScenarioItemCopyWithImpl(
      _ScenarioItem _value, $Res Function(_ScenarioItem) _then)
      : super(_value, (v) => _then(v as _ScenarioItem));

  @override
  _ScenarioItem get _value => super._value as _ScenarioItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? title = freezed,
    Object? foundDescription = freezed,
    Object? loots = freezed,
    Object? isPickedUp = freezed,
    Object? isZoomable = freezed,
    Object? endTrack = freezed,
    Object? hasQrCode = freezed,
  }) {
    return _then(_ScenarioItem(
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
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      foundDescription: foundDescription == freezed
          ? _value.foundDescription
          : foundDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      loots: loots == freezed
          ? _value.loots
          : loots // ignore: cast_nullable_to_non_nullable
              as List<ScenarioLoot>,
      isPickedUp: isPickedUp == freezed
          ? _value.isPickedUp
          : isPickedUp // ignore: cast_nullable_to_non_nullable
              as bool,
      isZoomable: isZoomable == freezed
          ? _value.isZoomable
          : isZoomable // ignore: cast_nullable_to_non_nullable
              as bool,
      endTrack: endTrack == freezed
          ? _value.endTrack
          : endTrack // ignore: cast_nullable_to_non_nullable
              as bool,
      hasQrCode: hasQrCode == freezed
          ? _value.hasQrCode
          : hasQrCode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScenarioItem extends _ScenarioItem with DiagnosticableTreeMixin {
  const _$_ScenarioItem(
      {required this.id,
      required this.description,
      required this.image,
      required this.title,
      this.foundDescription,
      this.loots = const [],
      this.isPickedUp = false,
      this.isZoomable = false,
      this.endTrack = false,
      this.hasQrCode = false})
      : super._();

  factory _$_ScenarioItem.fromJson(Map<String, dynamic> json) =>
      _$$_ScenarioItemFromJson(json);

  @override
  final int id;
  @override
  final String description;
  @override
  final String image;
  @override
  final String title;
  @override
  final String? foundDescription;
  @JsonKey()
  @override
  final List<ScenarioLoot> loots;
  @JsonKey()
  @override
  final bool isPickedUp;
  @JsonKey()
  @override
  final bool isZoomable;
  @JsonKey()
  @override
  final bool endTrack;
  @JsonKey()
  @override
  final bool hasQrCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScenarioItem(id: $id, description: $description, image: $image, title: $title, foundDescription: $foundDescription, loots: $loots, isPickedUp: $isPickedUp, isZoomable: $isZoomable, endTrack: $endTrack, hasQrCode: $hasQrCode)';
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
      ..add(DiagnosticsProperty('foundDescription', foundDescription))
      ..add(DiagnosticsProperty('loots', loots))
      ..add(DiagnosticsProperty('isPickedUp', isPickedUp))
      ..add(DiagnosticsProperty('isZoomable', isZoomable))
      ..add(DiagnosticsProperty('endTrack', endTrack))
      ..add(DiagnosticsProperty('hasQrCode', hasQrCode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScenarioItem &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.foundDescription, foundDescription) &&
            const DeepCollectionEquality().equals(other.loots, loots) &&
            const DeepCollectionEquality()
                .equals(other.isPickedUp, isPickedUp) &&
            const DeepCollectionEquality()
                .equals(other.isZoomable, isZoomable) &&
            const DeepCollectionEquality().equals(other.endTrack, endTrack) &&
            const DeepCollectionEquality().equals(other.hasQrCode, hasQrCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(foundDescription),
      const DeepCollectionEquality().hash(loots),
      const DeepCollectionEquality().hash(isPickedUp),
      const DeepCollectionEquality().hash(isZoomable),
      const DeepCollectionEquality().hash(endTrack),
      const DeepCollectionEquality().hash(hasQrCode));

  @JsonKey(ignore: true)
  @override
  _$ScenarioItemCopyWith<_ScenarioItem> get copyWith =>
      __$ScenarioItemCopyWithImpl<_ScenarioItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScenarioItemToJson(this);
  }
}

abstract class _ScenarioItem extends ScenarioItem {
  const factory _ScenarioItem(
      {required int id,
      required String description,
      required String image,
      required String title,
      String? foundDescription,
      List<ScenarioLoot> loots,
      bool isPickedUp,
      bool isZoomable,
      bool endTrack,
      bool hasQrCode}) = _$_ScenarioItem;
  const _ScenarioItem._() : super._();

  factory _ScenarioItem.fromJson(Map<String, dynamic> json) =
      _$_ScenarioItem.fromJson;

  @override
  int get id;
  @override
  String get description;
  @override
  String get image;
  @override
  String get title;
  @override
  String? get foundDescription;
  @override
  List<ScenarioLoot> get loots;
  @override
  bool get isPickedUp;
  @override
  bool get isZoomable;
  @override
  bool get endTrack;
  @override
  bool get hasQrCode;
  @override
  @JsonKey(ignore: true)
  _$ScenarioItemCopyWith<_ScenarioItem> get copyWith =>
      throw _privateConstructorUsedError;
}
