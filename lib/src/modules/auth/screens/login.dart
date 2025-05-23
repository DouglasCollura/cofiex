import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'login_layouts/mobile_layout.dart';
import 'login_layouts/desktop_layout.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
