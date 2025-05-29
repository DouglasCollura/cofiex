import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:cofiex/src/modules/layout/layout_bottom_navigation.dart';
import 'package:cofiex/src/shared/widgets/inputs/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subir Documento'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Panel izquierdo - Área de subida
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Mensaje de tipos de archivo aceptados
                        Container(
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            color: AppTheme.appBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: AppTheme.appBlue,
                                size: 20.px,
                              ),
                              SizedBox(width: 1.w),
                              Expanded(
                                child: Text(
                                  'Formatos aceptados: PDF y JPG',
                                  style: TextStyle(
                                    fontSize: 14.px,
                                    color: AppTheme.appBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        SizedBox(height: 3.h),
                        
                        // Área de arrastrar y soltar
                        Container(
                          width: double.infinity,
                          height: 200.px,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: AppTheme.appBlue.withOpacity(0.3),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.cloud_upload_outlined,
                                  size: 50.px,
                                  color: AppTheme.appBlue,
                                ),
                                SizedBox(height: 10.px),
                                Text(
                                  'Carga tus documentos',
                                  style: TextStyle(
                                    fontSize: 16.px,
                                    color: AppTheme.appBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                        SizedBox(height: 3.h),
                        
                        // Botones de acción
                        Row(
                          children: [
                            Expanded(
                              child: CustomFilledButton(
                                onPressed: () {
                                  // TODO: Implementar selección desde galería
                                },
                                text: 'Seleccionar desde Galería',
                                buttonColor: AppTheme.appBlue,
                                icon: Icons.photo_library,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(width: 4.w),
                  
                  // Panel derecho - Lista de archivos
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Archivos Subidos',
                          style: TextStyle(
                            fontSize: 24.px,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        _buildUploadedFileList(),
                        SizedBox(height: 3.h),
                        CustomFilledButton(
                          onPressed: () {
                            // TODO: Implementar subida de archivos
                          },
                          text: 'Subir Archivos',
                          buttonColor: AppTheme.appBlue,
                          icon: Icons.upload_file,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const LayoutBottomNavigation(),
    );
  }

  Widget _buildUploadedFileList() {
    final files = [
      {'name': 'documento1.pdf', 'size': '2.5 MB', 'date': '2024-03-20'},
      {'name': 'foto1.jpg', 'size': '1.8 MB', 'date': '2024-03-19'},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: files.map((file) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 1,
                ),
              ),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              leading: Container(
                width: 60.px,
                height: 60.px,
                decoration: BoxDecoration(
                  color: AppTheme.appBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  file['name']!.endsWith('.pdf') ? Icons.picture_as_pdf : Icons.image,
                  color: AppTheme.appBlue,
                  size: 20.px,
                ),
              ),
              title: Text(
                file['name']!,
                style: TextStyle(
                  fontSize: 14.px,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                '${file['size']!} • ${file['date']!}',
                style: TextStyle(
                  fontSize: 12.px,
                  color: Colors.grey,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () {
                  // TODO: Implementar eliminación de archivo
                },
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
