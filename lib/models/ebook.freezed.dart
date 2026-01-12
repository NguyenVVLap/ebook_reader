// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ebook.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Ebook _$EbookFromJson(Map<String, dynamic> json) {
  return _Ebook.fromJson(json);
}

/// @nodoc
mixin _$Ebook {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get filePath => throw _privateConstructorUsedError;
  int get fileSize => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  String? get coverImagePath => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  int? get currentPage => throw _privateConstructorUsedError;

  /// Serializes this Ebook to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ebook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EbookCopyWith<Ebook> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EbookCopyWith<$Res> {
  factory $EbookCopyWith(Ebook value, $Res Function(Ebook) then) =
      _$EbookCopyWithImpl<$Res, Ebook>;
  @useResult
  $Res call({
    String id,
    String name,
    String filePath,
    int fileSize,
    DateTime createdAt,
    DateTime updatedAt,
    bool isDeleted,
    String? title,
    String? author,
    String? coverImagePath,
    int? totalPages,
    int? currentPage,
  });
}

/// @nodoc
class _$EbookCopyWithImpl<$Res, $Val extends Ebook>
    implements $EbookCopyWith<$Res> {
  _$EbookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ebook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? filePath = null,
    Object? fileSize = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDeleted = null,
    Object? title = freezed,
    Object? author = freezed,
    Object? coverImagePath = freezed,
    Object? totalPages = freezed,
    Object? currentPage = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            filePath: null == filePath
                ? _value.filePath
                : filePath // ignore: cast_nullable_to_non_nullable
                      as String,
            fileSize: null == fileSize
                ? _value.fileSize
                : fileSize // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isDeleted: null == isDeleted
                ? _value.isDeleted
                : isDeleted // ignore: cast_nullable_to_non_nullable
                      as bool,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            author: freezed == author
                ? _value.author
                : author // ignore: cast_nullable_to_non_nullable
                      as String?,
            coverImagePath: freezed == coverImagePath
                ? _value.coverImagePath
                : coverImagePath // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalPages: freezed == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int?,
            currentPage: freezed == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EbookImplCopyWith<$Res> implements $EbookCopyWith<$Res> {
  factory _$$EbookImplCopyWith(
    _$EbookImpl value,
    $Res Function(_$EbookImpl) then,
  ) = __$$EbookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String filePath,
    int fileSize,
    DateTime createdAt,
    DateTime updatedAt,
    bool isDeleted,
    String? title,
    String? author,
    String? coverImagePath,
    int? totalPages,
    int? currentPage,
  });
}

/// @nodoc
class __$$EbookImplCopyWithImpl<$Res>
    extends _$EbookCopyWithImpl<$Res, _$EbookImpl>
    implements _$$EbookImplCopyWith<$Res> {
  __$$EbookImplCopyWithImpl(
    _$EbookImpl _value,
    $Res Function(_$EbookImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Ebook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? filePath = null,
    Object? fileSize = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDeleted = null,
    Object? title = freezed,
    Object? author = freezed,
    Object? coverImagePath = freezed,
    Object? totalPages = freezed,
    Object? currentPage = freezed,
  }) {
    return _then(
      _$EbookImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        filePath: null == filePath
            ? _value.filePath
            : filePath // ignore: cast_nullable_to_non_nullable
                  as String,
        fileSize: null == fileSize
            ? _value.fileSize
            : fileSize // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isDeleted: null == isDeleted
            ? _value.isDeleted
            : isDeleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        author: freezed == author
            ? _value.author
            : author // ignore: cast_nullable_to_non_nullable
                  as String?,
        coverImagePath: freezed == coverImagePath
            ? _value.coverImagePath
            : coverImagePath // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalPages: freezed == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int?,
        currentPage: freezed == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EbookImpl implements _Ebook {
  const _$EbookImpl({
    required this.id,
    required this.name,
    required this.filePath,
    required this.fileSize,
    required this.createdAt,
    required this.updatedAt,
    this.isDeleted = false,
    this.title,
    this.author,
    this.coverImagePath,
    this.totalPages,
    this.currentPage,
  });

  factory _$EbookImpl.fromJson(Map<String, dynamic> json) =>
      _$$EbookImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String filePath;
  @override
  final int fileSize;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final bool isDeleted;
  @override
  final String? title;
  @override
  final String? author;
  @override
  final String? coverImagePath;
  @override
  final int? totalPages;
  @override
  final int? currentPage;

  @override
  String toString() {
    return 'Ebook(id: $id, name: $name, filePath: $filePath, fileSize: $fileSize, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted, title: $title, author: $author, coverImagePath: $coverImagePath, totalPages: $totalPages, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EbookImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.coverImagePath, coverImagePath) ||
                other.coverImagePath == coverImagePath) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    filePath,
    fileSize,
    createdAt,
    updatedAt,
    isDeleted,
    title,
    author,
    coverImagePath,
    totalPages,
    currentPage,
  );

  /// Create a copy of Ebook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EbookImplCopyWith<_$EbookImpl> get copyWith =>
      __$$EbookImplCopyWithImpl<_$EbookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EbookImplToJson(this);
  }
}

abstract class _Ebook implements Ebook {
  const factory _Ebook({
    required final String id,
    required final String name,
    required final String filePath,
    required final int fileSize,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final bool isDeleted,
    final String? title,
    final String? author,
    final String? coverImagePath,
    final int? totalPages,
    final int? currentPage,
  }) = _$EbookImpl;

  factory _Ebook.fromJson(Map<String, dynamic> json) = _$EbookImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get filePath;
  @override
  int get fileSize;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  bool get isDeleted;
  @override
  String? get title;
  @override
  String? get author;
  @override
  String? get coverImagePath;
  @override
  int? get totalPages;
  @override
  int? get currentPage;

  /// Create a copy of Ebook
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EbookImplCopyWith<_$EbookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
