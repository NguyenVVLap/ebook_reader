import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/ebook.dart';
import '../services/epub_metadata_service.dart';

part 'ebook_provider.g.dart';

@riverpod
class EbookList extends _$EbookList {
  @override
  Future<List<Ebook>> build() async {
    return _loadEbooks();
  }

  Future<List<Ebook>> _loadEbooks() async {
    try {
      final appDir = await _getAppDirectory();
      if (!await appDir.exists()) {
        return [];
      }

      final files = appDir.listSync();
      final ebooks = <Ebook>[];

      for (final file in files) {
        if (file is File) {
          final extension = path.extension(file.path).toLowerCase();
          if (_isEbookExtension(extension)) {
            final stat = await file.stat();
            final ebookId = path.basenameWithoutExtension(file.path);
            final fileName = path.basename(file.path);

            // Extract metadata for EPUB files
            String? title;
            String? author;
            String? coverImagePath;

            if (extension == '.epub') {
              final metadata = await EpubMetadataService.extractMetadata(
                file.path,
              );
              if (metadata != null) {
                title = metadata.title ?? fileName;
                author = metadata.author;

                // Save cover image if available
                if (metadata.coverImageData != null) {
                  coverImagePath = await EpubMetadataService.saveCoverImage(
                    metadata.coverImageData,
                    ebookId,
                  );
                }
              }
            }

            ebooks.add(
              Ebook(
                id: ebookId,
                name: fileName,
                filePath: file.path,
                fileSize: stat.size,
                createdAt: stat.modified,
                updatedAt: stat.modified,
                title: title ?? fileName,
                author: author,
                coverImagePath: coverImagePath,
              ),
            );
          }
        }
      }

      return ebooks..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    } catch (e) {
      throw Exception('Failed to load ebooks: $e');
    }
  }

  Future<void> addEbookFromFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['epub', 'pdf', 'mobi', 'fb2', 'txt'],
        allowMultiple: true,
      );

      if (result == null || result.files.isEmpty) {
        return;
      }

      final appDir = await _getAppDirectory();
      if (!await appDir.exists()) {
        await appDir.create(recursive: true);
      }

      for (final platformFile in result.files) {
        if (platformFile.path != null) {
          final sourceFile = File(platformFile.path!);
          final fileName = path.basename(platformFile.path!);
          final destFile = File(path.join(appDir.path, fileName));

          await sourceFile.copy(destFile.path);
        }
      }

      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() => _loadEbooks());
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> deleteEbook(Ebook ebook) async {
    try {
      final file = File(ebook.filePath);
      if (await file.exists()) {
        await file.delete();
      }

      // Delete cover image if exists
      if (ebook.coverImagePath != null) {
        final coverFile = File(ebook.coverImagePath!);
        if (await coverFile.exists()) {
          await coverFile.delete();
        }
      }

      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() => _loadEbooks());
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadEbooks());
  }

  Future<Directory> _getAppDirectory() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    return Directory(path.join(appDocDir.path, 'ebooks'));
  }

  bool _isEbookExtension(String extension) {
    const ebookExtensions = ['.epub', '.pdf', '.mobi', '.fb2', '.txt'];
    return ebookExtensions.contains(extension);
  }
}
