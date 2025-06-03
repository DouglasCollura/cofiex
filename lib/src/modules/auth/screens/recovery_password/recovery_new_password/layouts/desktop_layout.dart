import 'package:flutter/material.dart';
import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:sizer/sizer.dart';
import '../components/recovery_new_password_form.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Lado izquierdo - Imagen y logo
        Expanded(
          flex: 1,
          child: Container(
            color: AppTheme.appBlue.withOpacity(0.1),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.asset('assets/logo.jpg'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Crea tu nueva contraseña',
                    style: TextStyle(
                      fontSize: 24.px,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Lado derecho - Formulario
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: const Center(
              child: SizedBox(
                width: 400,
                child: RecoveryNewPasswordForm(),
              ),
            ),
          ),
        ),
      ],
    );
  }
} 