import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:cofiex/src/modules/layout/layout_bottom_navigation.dart';
import 'package:cofiex/src/shared/widgets/inputs/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:go_router/go_router.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Empresa'),
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
                  // Panel izquierdo - Información de la empresa actual
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 80.px,
                                    height: 80.px,
                                    decoration: BoxDecoration(
                                      color: AppTheme.appBlue.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(
                                      Icons.business,
                                      color: AppTheme.appBlue,
                                      size: 40.px,
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Empresa Actual',
                                          style: TextStyle(
                                            fontSize: 14.px,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          'Tech Solutions S.A.',
                                          style: TextStyle(
                                            fontSize: 18.px,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 3.h),
                              _buildInfoRow(Icons.email, 'contacto@techsolutions.com'),
                              SizedBox(height: 1.h),
                              _buildInfoRow(Icons.phone, '+1 234 567 890'),
                              SizedBox(height: 1.h),
                              _buildInfoRow(Icons.location_on, 'Av. Principal 123, Ciudad'),
                              SizedBox(height: 1.h),
                              _buildInfoRow(Icons.person, 'Juan Pérez - Administrador'),
                            ],
                          ),
                        ),
                        
                        SizedBox(height: 3.h),
                        
                        // Opciones de cuenta
                        Text(
                          'Opciones de Cuenta',
                          style: TextStyle(
                            fontSize: 20.px,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        CustomFilledButton(
                          onPressed: () {
                            context.replace('/');
                          },
                          text: 'Cerrar Sesión',
                          buttonColor: AppTheme.appLightBlue,
                          icon: Icons.logout,
                        ),
                        SizedBox(height: 1.h),
                        CustomFilledButton(
                          onPressed: () {
                            // TODO: Implementar eliminación de cuenta
                          },
                          text: 'Eliminar Cuenta',
                          buttonColor: Colors.red.shade900,
                          icon: Icons.delete_forever,
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(width: 4.w),
                  
                  // Panel derecho - Lista de otras empresas
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Otras Empresas',
                          style: TextStyle(
                            fontSize: 20.px,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        _buildCompanyList(),
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

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.appBlue, size: 20.px),
        SizedBox(width: 2.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 16.px,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildCompanyList() {
    final companies = [
      {'name': 'Digital Innovations', 'role': 'Colaborador'},
      {'name': 'Global Tech', 'role': 'Administrador'},
      {'name': 'Smart Solutions', 'role': 'Colaborador'},
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
        children: companies.map((company) {
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
                  Icons.business,
                  color: AppTheme.appBlue,
                  size: 24.px,
                ),
              ),
              title: Text(
                company['name']!,
                style: TextStyle(
                  fontSize: 16.px,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                company['role']!,
                style: TextStyle(
                  fontSize: 14.px,
                  color: Colors.grey,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // TODO: Implementar cambio de empresa
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
