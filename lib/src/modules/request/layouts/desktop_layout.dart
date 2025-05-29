import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:cofiex/src/modules/layout/layout_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitudes'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Selecciona el tipo de solicitud',
                    style: TextStyle(
                      fontSize: 24.px,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.appBlue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4.h),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: _buildRequestButton(
                            context,
                            title: 'Alta de Trabajador',
                            description: 'Solicitar el registro de un nuevo trabajador',
                            icon: Icons.person_add_outlined,
                            onPressed: () {
                              context.push('/request/up-form');
                            },
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: _buildRequestButton(
                            context,
                            title: 'Baja de Trabajador',
                            description: 'Solicitar la baja de un trabajador',
                            icon: Icons.person_remove_outlined,
                            onPressed: () {
                              context.push('/request/down-form');
                            },
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: _buildRequestButton(
                            context,
                            title: 'Solicitud General',
                            description: 'Otras solicitudes o consultas',
                            icon: Icons.description_outlined,
                            onPressed: () {
                              context.push('/request/general-form');
                            },
                          ),
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
          padding: EdgeInsets.all(3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80.px,
                height: 80.px,
                decoration: BoxDecoration(
                  color: AppTheme.appBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: AppTheme.appBlue,
                  size: 40.px,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.px,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.appBlue,
                ),
              ),
              SizedBox(height: 0.5.h),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14.px,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppTheme.appBlue,
                    size: 16.px,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
