import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:cofiex/src/shared/helpers/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class LayoutBottomNavigationWeb extends StatelessWidget {
  const LayoutBottomNavigationWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(
                context,
                icon: Icons.home_outlined,
                label: 'Inicio',
                path: '/base',
              ),
              _buildNavItem(
                context,
                icon: Icons.folder_outlined,
                label: 'Archivos',
                path: '/upload-doc',
              ),
              _buildNavItem(
                context,
                icon: Icons.description_outlined,
                label: 'Solicitudes',
                path: '/request',
              ),
              _buildNavItem(
                context,
                icon: Icons.person_outline,
                label: 'Perfil',
                path: '/company',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String path,
  }) {
    final isSelected = GoRouterState.of(context).matchedLocation == path;

    return InkWell(
      onTap: () {
        if(kIsWeb){
          NavigationHelper.replaceWithUrl(context, path);
        }else{
          context.go(path);
        }
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.appBlue.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppTheme.appBlue : AppTheme.appGray,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppTheme.appBlue : AppTheme.appGray,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 