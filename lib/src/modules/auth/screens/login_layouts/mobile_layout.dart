import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../login_components/form_login.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(
              width: 50.w,
              height: 100.w,
              child: Center(child: Image.asset('assets/logo.jpg')),
            ),
      
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: SizedBox(width: 90.w, child: const FormLogin()),
            ),
      
            Expanded(
              child: SizedBox(
                width: 100.w,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('¿No recuerdas tu contraseña?'),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
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
            ),
          ],
        ),
      ),
    );
  }
} 