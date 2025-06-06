import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:cofiex/src/modules/layout/layout_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
          title: const Text('Solicitudes'),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Selecciona el tipo de solicitud',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.appBlue,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4.h),
              _buildRequestButton(
                context,
                title: 'Alta de Trabajador',
                description: 'Solicitar el registro de un nuevo trabajador',
                icon: Icons.person_add_outlined,
                onPressed: () {
                  context.push('/request/up-form');
                },
              ),
              SizedBox(height: 2.h),
              _buildRequestButton(
                context,
                title: 'Baja de Trabajador',
                description: 'Solicitar la baja de un trabajador',
                icon: Icons.person_remove_outlined,
                onPressed: () {
                  context.push('/request/down-form');
                },
              ),
              SizedBox(height: 2.h),
              _buildRequestButton(
                context,
                title: 'Solicitud General',
                description: 'Otras solicitudes o consultas',
                icon: Icons.description_outlined,
                onPressed: () {
                  context.push('/request/general-form');
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: const LayoutBottomNavigation(),
      );
  }

  
  Widget _buildRequestButton(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Card(
      elevation: 2,
      color: AppTheme.appLightBlueWidget,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Row(
            children: [
              Container(
                width: 15.w,
                height: 15.w,
                decoration: BoxDecoration(
                  color: AppTheme.appBlue.withValues( alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: AppTheme.appBlue,
                  size: 8.w,
                ),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.appBlue,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppTheme.appBlue,
                size: 6.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}