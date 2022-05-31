// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'scenario_reference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScenarioReference _$ScenarioReferenceFromJson(Map<String, dynamic> json) {
  return _ScenarioReference.fromJson(json);
}

/// @nodoc
class _$ScenarioReferenceTearOff {
  const _$ScenarioReferenceTearOff();

  _ScenarioReference call(
      {required String id,
      required String name,
      String? image,
      required String code,
      String? linkedFile,
      required String description}) {
    return _ScenarioReference(
      id: id,
      name: name,
      image: image,
      code: code,
      linkedFile: linkedFile,
      description: description,
    );
  }

  ScenarioReference fromJson(Map<String, Object?> json) {
    return ScenarioReference.fromJson(json);
  }
}

/// @nodoc
const $ScenarioReference = _$ScenarioReferenceTearOff();

/// @nodoc
mixin _$ScenarioReference {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String? get linkedFile => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScenarioReferenceCopyWith<ScenarioReference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScenarioReferenceCopyWith<$Res> {
  factory $ScenarioReferenceCopyWith(
          ScenarioReference value, $Res Function(ScenarioReference) then) =
      _$ScenarioReferenceCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String? image,
      String code,
      String? linkedFile,
      String description});
}

/// @nodoc
class _$ScenarioReferenceCopyWithImpl<$Res>
    implements $ScenarioReferenceCopyWith<$Res> {
  _$ScenarioReferenceCopyWithImpl(this._value, this._then);

  final ScenarioReference _value;
  // ignore: unused_field
  final $Res Function(ScenarioReference) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? code = freezed,
    Object? linkedFile = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      linkedFile: linkedFile == freezed
          ? _value.linkedFile
          : linkedFile // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ScenarioReferenceCopyWith<$Res>
    implements $ScenarioReferenceCopyWith<$Res> {
  factory _$ScenarioReferenceCopyWith(
          _ScenarioReference value, $Res Function(_ScenarioReference) then) =
      __$ScenarioReferenceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String? image,
      String code,
      String? linkedFile,
      String description});
}

/// @nodoc
class __$ScenarioReferenceCopyWithImpl<$Res>
    extends _$ScenarioReferenceCopyWithImpl<$Res>
    implements _$ScenarioReferenceCopyWith<$Res> {
  __$ScenarioReferenceCopyWithImpl(
      _ScenarioReference _value, $Res Function(_ScenarioReference) _then)
      : super(_value, (v) => _then(v as _ScenarioReference));

  @override
  _ScenarioReference get _value => super._value as _ScenarioReference;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? code = freezed,
    Object? linkedFile = freezed,
    Object? description = freezed,
  }) {
    return _then(_ScenarioReference(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      linkedFile: linkedFile == freezed
          ? _value.linkedFile
          : linkedFile // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScenarioReference extends _ScenarioReference
    with DiagnosticableTreeMixin {
  const _$_ScenarioReference(
      {required this.id,
      required this.name,
      this.image,
      required this.code,
      this.linkedFile,
      required this.description})
      : super._();

  factory _$_ScenarioReference.fromJson(Map<String, dynamic> json) =>
      _$$_ScenarioReferenceFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? image;
  @override
  final String code;
  @override
  final String? linkedFile;
  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScenarioReference(id: $id, name: $name, image: $image, code: $code, linkedFile: $linkedFile, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScenarioReference'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('linkedFile', linkedFile))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScenarioReference &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other.linkedFile, linkedFile) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(linkedFile),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$ScenarioReferenceCopyWith<_ScenarioReference> get copyWith =>
      __$ScenarioReferenceCopyWithImpl<_ScenarioReference>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScenarioReferenceToJson(this);
  }
}

abstract class _ScenarioReference extends ScenarioReference {
  const factory _ScenarioReference(
      {required String id,
      required String name,
      String? image,
      required String code,
      String? linkedFile,
      required String description}) = _$_ScenarioReference;
  const _ScenarioReference._() : super._();

  factory _ScenarioReference.fromJson(Map<String, dynamic> json) =
      _$_ScenarioReference.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get image;
  @override
  String get code;
  @override
  String? get linkedFile;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$ScenarioReferenceCopyWith<_ScenarioReference> get copyWith =>
      throw _privateConstructorUsedError;
}
