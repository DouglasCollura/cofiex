import 'package:cofiex/src/modules/layout/layout_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotificationModel {
  final String message;
  final String fileName;
  final DateTime timestamp;
  final bool isRead;

  NotificationModel({
    required this.message,
    required this.fileName,
    required this.timestamp,
    this.isRead = false,
  });
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de ejemplo de notificaciones
    final List<NotificationModel> notifications = [
      NotificationModel(
        message: 'Nuevo archivo disponible',
        fileName: 'documento_fiscal_2024.pdf',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      NotificationModel(
        message: 'Se ha recibido un archivo',
        fileName: 'factura_enero_2024.pdf',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      ),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(12.sp),
            child: Image.asset('assets/logo_second.png'),
          ), 
          title: const Text('Notificaciones'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: notifications.isEmpty
            ? const Center(
                child: Text('No hay notificaciones'),
              )
            : ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                padding: const EdgeInsets.all(16),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: const Icon(
                          Icons.file_present,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        notification.message,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            notification.fileName,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _formatTimestamp(notification.timestamp),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      trailing: !notification.isRead
                          ? Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                              ),
                            )
                          : null,
                    ),
                  );
                },
              ),
        bottomNavigationBar: const LayoutBottomNavigation(),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 60) {
      return 'Hace ${difference.inMinutes} minutos';
    } else if (difference.inHours < 24) {
      return 'Hace ${difference.inHours} horas';
    } else {
      return 'Hace ${difference.inDays} días';
    }
  }
}

class FileModel {
  final String fileName;
  final String fileType;
  final DateTime uploadDate;
  final bool isReceived;
  final String fileSize;

  FileModel({
    required this.fileName,
    required this.fileType,
    required this.uploadDate,
    required this.isReceived,
    required this.fileSize,
  });
}

class FilesScreen extends StatefulWidget {
  const FilesScreen({super.key});

  @override
  State<FilesScreen> createState() => _FilesScreenState();
}

class _FilesScreenState extends State<FilesScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<FileModel> _files = [];
  bool _isLoading = false;
  bool _hasMoreData = true;
  int _currentPage = 1;
  static const int _itemsPerPage = 20;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadInitialData() async {
    await _loadMoreData();
  }

  Future<void> _loadMoreData() async {
    if (_isLoading || !_hasMoreData) return;

    setState(() {
      _isLoading = true;
    });

    // Simulación de carga de datos
    await Future.delayed(const Duration(seconds: 1));
    
    // Aquí iría tu llamada real a la API
    final newFiles = List.generate(
      _itemsPerPage,
      (index) => FileModel(
        fileName: 'archivo_${_currentPage}_$index.pdf',
        fileType: 'PDF',
        uploadDate: DateTime.now().subtract(Duration(days: index)),
        isReceived: index % 2 == 0,
        fileSize: '${(index + 1) * 100} KB',
      ),
    );

    setState(() {
      _files.addAll(newFiles);
      _currentPage++;
      _isLoading = false;
      // Simulamos que no hay más datos después de la página 3
      if (_currentPage > 3) {
        _hasMoreData = false;
      }
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadMoreData();
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Archivos'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: _files.isEmpty && _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                padding: const EdgeInsets.all(16),
                itemCount: _files.length + (_hasMoreData ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == _files.length) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  final file = _files[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: CircleAvatar(
                        backgroundColor: file.isReceived
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
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
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
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${file.isReceived ? "Recibido" : "Enviado"} el ${_formatDate(file.uploadDate)}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () {
                          // Aquí irían las acciones del menú contextual
                        },
                      ),
                    ),
                  );
                },
              ),
        bottomNavigationBar: const LayoutBottomNavigation(),
      ),
    );
  }
}