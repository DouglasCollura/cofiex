import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:cofiex/src/shared/widgets/inputs/custom_filled_button.dart';
import 'package:cofiex/src/modules/layout/layout_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(12.sp),
            child: Image.asset('assets/logo_second.png'),
          ), 
          title: const Text('Subir Documento'),
          centerTitle: true,
          automaticallyImplyLeading: false,

        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Mensaje de tipos de archivo aceptados
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: AppTheme.appBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: AppTheme.appBlue,
                      size: 24,
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: Text(
                        'Formatos aceptados: PDF y JPG',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppTheme.appBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 4.h),
              
              // Área de arrastrar y soltar
              Container(
                width: double.infinity,
                height: 20.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: AppTheme.appBlue.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.cloud_upload_outlined,
                    size: 50.sp,
                    color: AppTheme.appBlue,
                  ),
                ),
              ),
              
              SizedBox(height: 4.h),
              
              // Botones de acción
              CustomFilledButton(
                onPressed: () {
                  // TODO: Implementar selección desde galería
                },
                text: 'Seleccionar desde Galería',
                buttonColor: AppTheme.appBlue,
                icon: Icons.photo_library,
              ),
              
              SizedBox(height: 2.h),
              
              CustomFilledButton(
                onPressed: () {
                  // TODO: Implementar captura con cámara
                },
                text: 'Tomar Foto',
                buttonColor: AppTheme.appLightBlue,
                icon: Icons.camera_alt,
              ),
              
              SizedBox(height: 3.h),
              
              // Lista de archivos subidos (ejemplo)
              Text(
                'Archivos Subidos',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 1.h),
              _buildUploadedFileList(),
              
              SizedBox(height: 3.h),
              
              // Botón de subida
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
        bottomNavigationBar: const LayoutBottomNavigation(),
      );
  }
}

Widget _buildUploadedFileList() {
    final files = [
      {'name': 'documento1.pdf', 'size': '2.5 MB', 'date': '2024-03-20'},
      {'name': 'foto1.jpg', 'size': '1.8 MB', 'date': '2024-03-19'},
    ];

    return Column(
      children: files.map((file) {
        return Container(
          margin: EdgeInsets.only(bottom: 1.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            leading: Container(
              width: 10.w,
              height: 10.w,
              decoration: BoxDecoration(
                color: AppTheme.appBlue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                file['name']!.endsWith('.pdf') ? Icons.picture_as_pdf : Icons.image,
                color: AppTheme.appBlue,
                size: 20,
              ),
            ),
            title: Text(
              file['name']!,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              '${file['size']!} • ${file['date']!}',
              style: TextStyle(
                fontSize: 12.sp,
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
    );
  }