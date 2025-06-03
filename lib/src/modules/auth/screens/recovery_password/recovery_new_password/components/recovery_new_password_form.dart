import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:cofiex/src/shared/widgets/inputs/custom_filled_button.dart';
import 'package:cofiex/src/shared/widgets/inputs/custom_text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class RecoveryNewPasswordForm extends StatelessWidget {
  const RecoveryNewPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextFormField(
          label: 'Nueva contraseña',
          hint: 'Nueva contraseña',
          errorMessage: null,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          onChanged: (value) {},
          validator: (value) {},
        ),
        SizedBox(height: 20.px),
        CustomTextFormField(
          label: 'Confirmar contraseña',
          hint: 'Confirmar contraseña',
          errorMessage: null,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          onChanged: (value) {},
          validator: (value) {},
        ),
        SizedBox(height: 20.px),
        Text(
          'Ingresa tu nueva contraseña',
          style: TextStyle(
            fontSize: kIsWeb ? 12.px : 16.sp,
            fontWeight: FontWeight.bold,
            color: AppTheme.appGray,
          ),
        ),
        SizedBox(height: 20.px),
        CustomFilledButton(
          buttonColor: AppTheme.appBlue,
          onPressed: () {
            context.push('/');
          },
          text: 'CAMBIAR CONTRASEÑA',
        ),
      ],
    );
  }
} 