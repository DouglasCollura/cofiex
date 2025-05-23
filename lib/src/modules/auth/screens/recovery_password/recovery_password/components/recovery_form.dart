import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:cofiex/src/shared/widgets/inputs/custom_filled_button.dart';
import 'package:cofiex/src/shared/widgets/inputs/custom_text_form_field.dart';

class RecoveryForm extends StatefulWidget {
  const RecoveryForm({super.key});

  @override
  State<RecoveryForm> createState() => _RecoveryFormState();
}

class _RecoveryFormState extends State<RecoveryForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  String? _emailError;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            label: 'Email',
            hint: 'Email',
            errorMessage: _emailError,
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            controller: kIsWeb ? _emailController : null,
            onChanged: (data){},
            validator: (data){},
          ),
          SizedBox(height: 20.sp),
          Text(
            'Ingresa tu correo electrónico, te enviaremos un código para crear una nueva contraseña',
            style: TextStyle(
              fontSize: kIsWeb ? 12.px : 16.sp,
              fontWeight: FontWeight.bold,
              color: AppTheme.appGray
            ),
          ),
          SizedBox(height: 20.sp),
          CustomFilledButton(
            buttonColor: AppTheme.appBlue,
            onPressed: () {
                context.push('/recovery_password/set-code');
            },
            text: 'ENVIAR CÓDIGO',
          ),
        ],
      ),
    );
  }
} 