import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cofiex/src/modules/request/forms/up_form/layouts/desktop_layout.dart';
import 'package:cofiex/src/modules/request/forms/up_form/layouts/mobile_layout.dart';

class UpFormScreen extends StatelessWidget {
  const UpFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: kIsWeb ? _WebLayout() : const MobileLayout(),
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
