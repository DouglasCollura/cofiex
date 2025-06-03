import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:cofiex/src/shared/widgets/inputs/custom_filled_button.dart';
import 'package:cofiex/src/shared/widgets/inputs/custom_text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class RecoverySetCodeForm extends StatelessWidget {
  const RecoverySetCodeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextFormField(
          label: 'Código',
          hint: 'Código',
          errorMessage: null,
          obscureText: false,
          keyboardType: TextInputType.number,
          onChanged: (value) {},
          validator: (value) {},
        ),
        SizedBox(height: 20.px),
        Text(
          'Ingresa el código que te enviamos a tu correo electrónico',
          style: TextStyle(
            fontSize:  kIsWeb ? 12.px : 16.sp,
            fontWeight: FontWeight.bold,
            color: AppTheme.appGray,
          ),
        ),
        SizedBox(height: 20.px),
        CustomFilledButton(
          buttonColor: AppTheme.appBlue,
          onPressed: () {
            context.push('/recovery_password/new-password');
          },
          text: 'INGRESAR CÓDIGO',
        ),
        SizedBox(height: 20.px),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¿No recibiste el código?',
              style: TextStyle(
                fontSize:  kIsWeb ? 12.px : 16.sp,
                fontWeight: FontWeight.bold,
                color: AppTheme.appGray,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Reenviar código'),
            ),
          ],
        ),
      ],
    );
  }
} 