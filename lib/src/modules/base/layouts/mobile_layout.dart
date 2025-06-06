import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:cofiex/src/modules/base/base.dart';
import 'package:cofiex/src/modules/layout/layout_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class MobileLayout extends StatelessWidget {
  
  final List<FileModel> files;
  final bool isLoading;
  final bool hasMoreData;
  final ScrollController scrollController;
  final Function(String) onDownload;

  const MobileLayout({super.key, required this.files, required this.isLoading, required this.hasMoreData, required this.scrollController, required this.onDownload});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(12.sp),
            child: Image.asset('assets/logo_second.png'),
          ),          
          title: const Text('Archivos'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body:
            files.isEmpty && isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  padding: const EdgeInsets.all(16),
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
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: CircleAvatar(
                          backgroundColor:
                              file.isReceived
                                  ? Colors.green
                                  : Theme.of(context).primaryColor,
                          child: Icon(
                            file.isReceived
                                ? Icons.download_done
                                : Icons.upload_file,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          file.fileName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  file.fileType,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  file.fileSize,
                                  style: TextStyle(color: Colors.grey[600]),
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
                        trailing: PopupMenuButton<String>(
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
                                      Icon(Icons.download, color: Colors.blue),
                                      SizedBox(width: 8),
                                      Text('Descargar'),
                                    ],
                                  ),
                                ),
                              ],
                        ),
                      ),
                    );
                  },
                ),
        bottomNavigationBar: const LayoutBottomNavigation(),
      );
  }

  
  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}