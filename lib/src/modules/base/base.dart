import 'package:cofiex/src/modules/base/layouts/desktop_layout.dart';
import 'package:cofiex/src/modules/base/layouts/mobile_layout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
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

    if (!mounted) return;
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

    if (!mounted) return;
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
    if (!mounted) return;
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadMoreData();
    }
  }

  void _handleDownload(String fileName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Descargando $fileName...'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          kIsWeb
              ? _WebLayout(
                files: _files,
                isLoading: _isLoading,
                hasMoreData: _hasMoreData,
                scrollController: _scrollController,
                onDownload: _handleDownload,
              )
              : MobileLayout(
                files: _files,
                isLoading: _isLoading,
                hasMoreData: _hasMoreData,
                scrollController: _scrollController,
                onDownload: _handleDownload,
              ),
    );

  }

}

class _WebLayout extends StatelessWidget {
  final List<FileModel> files;
  final bool isLoading;
  final bool hasMoreData;
  final ScrollController scrollController;
  final Function(String) onDownload;
  const _WebLayout({required this.files, required this.isLoading, required this.hasMoreData, required this.scrollController, required this.onDownload});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return DesktopLayout(files: files, isLoading: isLoading, hasMoreData: hasMoreData, scrollController: scrollController, onDownload: onDownload);
        }
        return MobileLayout(files: files, isLoading: isLoading, hasMoreData: hasMoreData, scrollController: scrollController, onDownload: onDownload);
      },
    );
  }
}
