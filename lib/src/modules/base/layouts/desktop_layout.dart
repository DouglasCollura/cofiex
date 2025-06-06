import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:cofiex/src/modules/base/base.dart';
import 'package:cofiex/src/modules/layout/layout_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DesktopLayout extends StatelessWidget {
  final List<FileModel> files;
  final bool isLoading;
  final bool hasMoreData;
  final ScrollController scrollController;
  final Function(String) onDownload;

  const DesktopLayout({
    super.key,
    required this.files,
    required this.isLoading,
    required this.hasMoreData,
    required this.scrollController,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archivos'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child:
                files.isEmpty && isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                      controller: scrollController,
                      physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      padding: const EdgeInsets.all(24),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 2.5,
                          ),
                      itemCount: files.length + (hasMoreData ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == files.length) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }

                        final file = files[index];
                        return Card(
                          color: AppTheme.appLightBlueWidget,
                          child: InkWell(
                            onTap: () => onDownload(file.fileName),
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.px,
                                vertical: 10.px,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            file.isReceived
                                                ? Colors.green
                                                : Theme.of(
                                                  context,
                                                ).primaryColor,
                                        child: Icon(
                                          file.isReceived
                                              ? Icons.download_done
                                              : Icons.upload_file,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          file.fileName,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      PopupMenuButton<String>(
                                        icon: const Icon(Icons.more_vert),
                                        onSelected: (value) {
                                          if (value == 'download') {
                                            onDownload(file.fileName);
                                          }
                                        },
                                        itemBuilder:
                                            (BuildContext context) => [
                                              const PopupMenuItem<String>(
                                                value: 'download',
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.download,
                                                      color: Colors.blue,
                                                    ),
                                                    SizedBox(width: 8),
                                                    Text('Descargar'),
                                                  ],
                                                ),
                                              ),
                                            ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppTheme.appBlue.withOpacity(
                                            0.1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Text(
                                          file.fileType,
                                          style: TextStyle(
                                            color: AppTheme.appBlue,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        file.fileSize,
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _formatDate(file.uploadDate),
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ),
      ),
      bottomNavigationBar: const LayoutBottomNavigation(),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
