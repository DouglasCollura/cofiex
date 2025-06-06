import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../components/recovery_form.dart';

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
            Padding(
              padding: EdgeInsets.only(bottom: 30.sp),
              child: SizedBox(
                width: 40.w,
                height: 45.sp,
                child: Center(child: Image.asset('assets/logo_second.png')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: SizedBox(
                width: 90.w,
                child: const RecoveryForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 