import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cofiex/src/config/theme/app_theme.dart';
import '../login_components/form_login.dart';

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
                  const Text(
                    'Bienvenido a Cofiex',
                    style: TextStyle(
                      fontSize: 24,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 400,
                  child: const FormLogin(),
                ),
                const SizedBox(height: 20),
                const Text('¿No recuerdas tu contraseña?'),
                TextButton(
                  onPressed: () {
                    context.push('/recovery_password');
                  },
                  child: const Text(
                    'Haz click aqui para recuperar tu contraseña',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
} 