import './layouts/layouts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SelectCompanyScreen extends StatelessWidget {
  const SelectCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de ejemplo de empresas - Esto debería venir de tu backend
    final List<Map<String, dynamic>> companies = [
      {
        'id': '1',
        'name': 'Empresa A',
        'description': 'Descripción de la Empresa A',
        'logo': 'assets/images/company_a.png',
      },
      {
        'id': '2',
        'name': 'Empresa B',
        'description': 'Descripción de la Empresa B',
        'logo': 'assets/images/company_b.png',
      },
      {
        'id': '3',
        'name': 'Empresa C',
        'description': 'Descripción de la Empresa C',
        'logo': 'assets/images/company_c.png',
      },
    ];

    return SafeArea(
      child: Scaffold(
        body: kIsWeb ? _WebLayout(companies: companies) : MobileLayout(companies: companies),
      ),
    );
  }
}

class _WebLayout extends StatelessWidget {
  final List<Map<String, dynamic>> companies;
  const _WebLayout({required this.companies});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return DesktopLayout(companies: companies);
        }
        return MobileLayout(companies: companies);
      },
    );
  }
} 
 
