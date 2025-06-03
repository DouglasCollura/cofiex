import 'package:flutter/material.dart';
import 'package:cofiex/src/config/theme/app_theme.dart';
import '../components/recovery_set_code_form.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Center(child: Image.asset('assets/logo.jpg')),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: RecoverySetCodeForm(),
            ),
          ],
        ),
      ),
    );
  }
} 