import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cofiex/src/modules/request/layouts/desktop_layout.dart';
import 'package:cofiex/src/modules/request/layouts/mobile_layout.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

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