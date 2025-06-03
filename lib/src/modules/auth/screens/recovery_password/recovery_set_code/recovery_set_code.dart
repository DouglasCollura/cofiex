import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:sizer/sizer.dart';
import 'layouts/desktop_layout.dart';
import 'layouts/mobile_layout.dart';

class RecoverySetCode extends StatelessWidget {
  const RecoverySetCode({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: kIsWeb ? null : AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Ingresar código',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppTheme.appBlue
            )
          ),
        ),
        body: kIsWeb ? _WebLayout() : const MobileLayout(),
      ),
    );
  }
}


class _WebLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return const DesktopLayout();
        }
        return const MobileLayout();
      },
    );
  }
} 