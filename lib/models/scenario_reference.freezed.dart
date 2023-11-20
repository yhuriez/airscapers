// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scenario_reference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScenarioReference _$ScenarioReferenceFromJson(Map<String, dynamic> json) {
  return _ScenarioReference.fromJson(json);
}

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
      _$ScenarioReferenceCopyWithImpl<$Res, ScenarioReference>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? image,
      String code,
      String? linkedFile,
      String description});
}

/// @nodoc
class _$ScenarioReferenceCopyWithImpl<$Res, $Val extends ScenarioReference>
    implements $ScenarioReferenceCopyWith<$Res> {
  _$ScenarioReferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = freezed,
    Object? code = null,
    Object? linkedFile = freezed,
    Object? description = null,
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
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      linkedFile: freezed == linkedFile
          ? _value.linkedFile
          : linkedFile // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScenarioReferenceImplCopyWith<$Res>
    implements $ScenarioReferenceCopyWith<$Res> {
  factory _$$ScenarioReferenceImplCopyWith(_$ScenarioReferenceImpl value,
          $Res Function(_$ScenarioReferenceImpl) then) =
      __$$ScenarioReferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? image,
      String code,
      String? linkedFile,
      String description});
}

/// @nodoc
class __$$ScenarioReferenceImplCopyWithImpl<$Res>
    extends _$ScenarioReferenceCopyWithImpl<$Res, _$ScenarioReferenceImpl>
    implements _$$ScenarioReferenceImplCopyWith<$Res> {
  __$$ScenarioReferenceImplCopyWithImpl(_$ScenarioReferenceImpl _value,
      $Res Function(_$ScenarioReferenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = freezed,
    Object? code = null,
    Object? linkedFile = freezed,
    Object? description = null,
  }) {
    return _then(_$ScenarioReferenceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      linkedFile: freezed == linkedFile
          ? _value.linkedFile
          : linkedFile // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScenarioReferenceImpl extends _ScenarioReference
    with DiagnosticableTreeMixin {
  const _$ScenarioReferenceImpl(
      {required this.id,
      required this.name,
      this.image,
      required this.code,
      this.linkedFile,
      required this.description})
      : super._();

  factory _$ScenarioReferenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScenarioReferenceImplFromJson(json);

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
            other is _$ScenarioReferenceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.linkedFile, linkedFile) ||
                other.linkedFile == linkedFile) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, image, code, linkedFile, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScenarioReferenceImplCopyWith<_$ScenarioReferenceImpl> get copyWith =>
      __$$ScenarioReferenceImplCopyWithImpl<_$ScenarioReferenceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScenarioReferenceImplToJson(
      this,
    );
  }
}

abstract class _ScenarioReference extends ScenarioReference {
  const factory _ScenarioReference(
      {required final String id,
      required final String name,
      final String? image,
      required final String code,
      final String? linkedFile,
      required final String description}) = _$ScenarioReferenceImpl;
  const _ScenarioReference._() : super._();

  factory _ScenarioReference.fromJson(Map<String, dynamic> json) =
      _$ScenarioReferenceImpl.fromJson;

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
  _$$ScenarioReferenceImplCopyWith<_$ScenarioReferenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
