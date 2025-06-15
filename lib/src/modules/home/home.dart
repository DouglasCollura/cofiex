import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'layouts/mobile_layout.dart';
import 'layouts/desktop_layout.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: kIsWeb  ? _WebLayout() : MobileLayout(),
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