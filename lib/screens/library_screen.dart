import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/ebook.dart';
import '../providers/ebook_provider.dart';
import '../constants/app_colors.dart';

class LibraryScreen extends HookConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ebookListAsync = ref.watch(ebookListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              await ref.read(ebookListProvider.notifier).addEbookFromFile();
            },
            tooltip: 'Add Ebook',
          ),
        ],
      ),
      body: ebookListAsync.when(
        data: (ebooks) => _buildContent(context, ref, ebooks),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => _ErrorState(
          error: error,
          onRetry: () => ref.refresh(ebookListProvider),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    List<Ebook> ebooks,
  ) {
    if (ebooks.isEmpty) {
      return _EmptyState(
        onAddEbook: () async {
          await ref.read(ebookListProvider.notifier).addEbookFromFile();
        },
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(ebookListProvider.notifier).refresh();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: ebooks.length,
        itemBuilder: (context, index) {
          return _EbookListItem(
            ebook: ebooks[index],
            onDelete: () async {
              await ref
                  .read(ebookListProvider.notifier)
                  .deleteEbook(ebooks[index]);
            },
          );
        },
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onAddEbook});

  final VoidCallback onAddEbook;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.library_books,
            size: 64,
            color: AppColors.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text('No ebooks yet', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            'Tap the + button to add ebooks from your device',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: onAddEbook,
            icon: const Icon(Icons.add),
            label: const Text('Add Ebook'),
          ),
        ],
      ),
    );
  }
}

class _EbookListItem extends StatelessWidget {
  const _EbookListItem({required this.ebook, required this.onDelete});

  final Ebook ebook;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final displayTitle = ebook.title ?? ebook.name;
    final hasCover =
        ebook.coverImagePath != null &&
        File(ebook.coverImagePath!).existsSync();

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: InkWell(
        onTap: () {
          // TODO: Navigate to ebook reader
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              _buildCoverImage(hasCover),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      displayTitle,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (ebook.author != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        ebook.author!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    const SizedBox(height: 4),
                    Text(
                      '${_formatFileSize(ebook.fileSize)} • '
                      '${_formatDate(ebook.updatedAt)}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: const Row(
                      children: [
                        Icon(Icons.delete, color: AppColors.error),
                        SizedBox(width: 8),
                        Text('Delete'),
                      ],
                    ),
                    onTap: () {
                      Future.delayed(
                        const Duration(milliseconds: 100),
                        onDelete,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoverImage(bool hasCover) {
    if (hasCover && ebook.coverImagePath != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.file(
          File(ebook.coverImagePath!),
          width: 60,
          height: 90,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildPlaceholderIcon();
          },
        ),
      );
    }
    return _buildPlaceholderIcon();
  }

  Widget _buildPlaceholderIcon() {
    return Container(
      width: 60,
      height: 90,
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(
        _getEbookIcon(ebook.name),
        color: AppColors.primary,
        size: 32,
      ),
    );
  }

  IconData _getEbookIcon(String fileName) {
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'epub':
        return Icons.menu_book;
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'mobi':
        return Icons.book;
      case 'fb2':
        return Icons.library_books;
      case 'txt':
        return Icons.text_snippet;
      default:
        return Icons.insert_drive_file;
    }
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    }
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.error, required this.onRetry});

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: AppColors.error),
            const SizedBox(height: 16),
            SelectableText.rich(
              TextSpan(
                text: 'Error loading ebooks:\n',
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: error.toString(),
                    style: TextStyle(color: AppColors.error, fontSize: 12),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
