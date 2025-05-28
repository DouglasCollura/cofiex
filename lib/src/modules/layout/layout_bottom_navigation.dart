import 'package:cofiex/src/modules/layout/layout_bottom_navigation_mobile.dart';
import 'package:cofiex/src/modules/layout/layout_bottom_navigation_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LayoutBottomNavigation extends StatelessWidget {
  const LayoutBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 900) {
            return LayoutBottomNavigationWeb();
          }
          return LayoutBottomNavigationMobile();
        },
      );
    }
    return const LayoutBottomNavigationMobile();
  }
}