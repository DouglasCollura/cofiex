import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cofiex/src/modules/company/layouts/desktop_layout.dart';
import 'package:cofiex/src/modules/company/layouts/mobile_layout.dart';

class CompanyScreen extends StatelessWidget {
  const CompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: kIsWeb ? _WebLayout() : MobileLayout(),
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