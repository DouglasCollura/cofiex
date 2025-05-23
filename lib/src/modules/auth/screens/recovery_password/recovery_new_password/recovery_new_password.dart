import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:cofiex/src/shared/widgets/inputs/custom_filled_button.dart';
import 'package:cofiex/src/shared/widgets/inputs/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class RecoveryNewPassword extends StatelessWidget {
  const RecoveryNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Nueva contraseña', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppTheme.appBlue)),
        ),
        body: SingleChildScrollView(
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
                  height: 80.w,
                  child: Center(child: Image.asset('assets/logo.jpg')),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: SizedBox(
                    width: 90.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFormField(
                          label: 'Nueva contraseña',
                          hint: 'Nueva contraseña',
                          errorMessage: null,
                          obscureText: false,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) {},
                          validator: (value) {},
                        ),
                        SizedBox(height: 20.sp),

                        CustomTextFormField(
                          label: 'Confirmar contraseña',
                          hint: 'Confirmar contraseña',
                          errorMessage: null,
                          obscureText: false,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) {},
                          validator: (value) {},
                        ),
                        SizedBox(height: 20.sp),

                        Text('Ingresa tu nueva contraseña', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppTheme.appGray)),
                        SizedBox(height: 20.sp),
                        CustomFilledButton(
                          buttonColor: AppTheme.appBlue,
                          onPressed: () {
                            context.push('/');
                          },
                          text: 'CAMBIAR CONTRASEÑA',
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}