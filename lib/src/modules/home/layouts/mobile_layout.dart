import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:cofiex/src/modules/layout/layout_bottom_navigation.dart';
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
          title: Text('Inicio'),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  'Bienvenido a @empresa',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppTheme.appBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                _buildQuickAccessCard(
                  context,
                  'Ver Archivos',
                  Icons.folder_open,
                  () {
                    context.push('/base');
                  },
                ),
                const SizedBox(height: 16),
                _buildQuickAccessCard(
                  context,
                  'Subir Archivos',
                  Icons.upload_file,
                  () {
                    context.push('/upload-doc');
                  },
                ),
                const SizedBox(height: 16),
                _buildQuickAccessCard(
                  context,
                  'Enviar Solicitud',
                  Icons.send,
                  () {
                    context.push('/request');
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: LayoutBottomNavigation(),
      ),
    );
  }

  Widget _buildQuickAccessCard(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 32,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
