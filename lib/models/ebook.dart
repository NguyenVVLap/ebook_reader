import 'package:freezed_annotation/freezed_annotation.dart';

part 'ebook.freezed.dart';
part 'ebook.g.dart';

@freezed
class Ebook with _$Ebook {
  const factory Ebook({
    required String id,
    required String name,
    required String filePath,
    required int fileSize,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDeleted,
    String? title,
    String? author,
    String? coverImagePath,
    int? totalPages,
    int? currentPage,
  }) = _Ebook;

  factory Ebook.fromJson(Map<String, dynamic> json) => _$EbookFromJson(json);
}
