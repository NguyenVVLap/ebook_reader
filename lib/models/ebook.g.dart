// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ebook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EbookImpl _$$EbookImplFromJson(Map<String, dynamic> json) => _$EbookImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  filePath: json['filePath'] as String,
  fileSize: (json['fileSize'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  isDeleted: json['isDeleted'] as bool? ?? false,
  title: json['title'] as String?,
  author: json['author'] as String?,
  coverImagePath: json['coverImagePath'] as String?,
  totalPages: (json['totalPages'] as num?)?.toInt(),
  currentPage: (json['currentPage'] as num?)?.toInt(),
);

Map<String, dynamic> _$$EbookImplToJson(_$EbookImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'filePath': instance.filePath,
      'fileSize': instance.fileSize,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'title': instance.title,
      'author': instance.author,
      'coverImagePath': instance.coverImagePath,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
    };
