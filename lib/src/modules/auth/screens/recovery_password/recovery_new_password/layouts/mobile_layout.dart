import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../components/recovery_new_password_form.dart';

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
            Padding(
              padding: EdgeInsets.only(bottom: 30.sp),
              child: SizedBox(
                width: 40.w,
                height: 45.sp,
                child: Center(child: Image.asset('assets/logo_second.png')),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: RecoveryNewPasswordForm(),
            ),
          ],
        ),
      ),
    );
  }
} 