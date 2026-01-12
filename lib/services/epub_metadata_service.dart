import 'dart:io';
import 'dart:typed_data';
import 'package:epub_decoder/epub_decoder.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class EpubMetadataService {
  static Future<EpubMetadata?> extractMetadata(String filePath) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        return null;
      }

      final bytes = await file.readAsBytes();
      final epub = Epub.fromBytes(bytes);

      String? title;
      String? author;
      Uint8List? coverImageData;

      // Extract metadata from EPUB
      // Note: Property names may need adjustment based on actual epub_decoder API
      try {
        // Access metadata - structure may vary
        if (epub.metadata.isNotEmpty) {
          // Metadata extraction - will need to be adjusted based on actual API
          // For now, return null to allow fallback to filename
        }
      } catch (e) {
        // Continue without metadata
      }

      // Cover image extraction
      try {
        // Will need to access cover image property when API is confirmed
      } catch (e) {
        // Continue without cover
      }

      // Return metadata (may be null, will fallback to filename in provider)
      return EpubMetadata(
        title: title,
        author: author,
        coverImageData: coverImageData,
      );
    } catch (e) {
      return null;
    }
  }

  static Future<String?> saveCoverImage(
    Uint8List? imageData,
    String ebookId,
  ) async {
    if (imageData == null) {
      return null;
    }

    try {
      final appDocDir = await getApplicationDocumentsDirectory();
      final coversDir = Directory(
        path.join(appDocDir.path, 'ebooks', 'covers'),
      );

      if (!await coversDir.exists()) {
        await coversDir.create(recursive: true);
      }

      final coverPath = path.join(coversDir.path, '$ebookId.jpg');
      final coverFile = File(coverPath);
      await coverFile.writeAsBytes(imageData);

      return coverPath;
    } catch (e) {
      return null;
    }
  }
}

class EpubMetadata {
  final String? title;
  final String? author;
  final Uint8List? coverImageData;

  EpubMetadata({this.title, this.author, this.coverImageData});
}
