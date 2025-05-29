import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:cofiex/src/modules/layout/layout_bottom_navigation.dart';
import 'package:cofiex/src/shared/widgets/inputs/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mi Empresa'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Información de la empresa actual
              Container(
                padding: EdgeInsets.all(4.w),
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
                          width: 15.w,
                          height: 15.w,
                          decoration: BoxDecoration(
                            color: AppTheme.appBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.business,
                            color: AppTheme.appBlue,
                            size: 30,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Empresa Actual',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Tech Solutions S.A.',
                                style: TextStyle(
                                  fontSize: 16.sp,
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
              
              // Lista de otras empresas
              Text(
                'Otras Empresas',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 1.h),
              _buildCompanyList(),
              
              SizedBox(height: 3.h),
              
              // Opciones de cuenta
              Text(
                'Opciones de Cuenta',
                style: TextStyle(
                  fontSize: 16.sp,
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
        bottomNavigationBar: const LayoutBottomNavigation(),
      ),
    );
  }

  
  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.appBlue, size: 20),
        SizedBox(width: 2.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
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

    return Column(
      children: companies.map((company) {
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
              child: const Icon(
                Icons.business,
                color: AppTheme.appBlue,
                size: 20,
              ),
            ),
            title: Text(
              company['name']!,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              company['role']!,
              style: TextStyle(
                fontSize: 12.sp,
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
    );
  }
}