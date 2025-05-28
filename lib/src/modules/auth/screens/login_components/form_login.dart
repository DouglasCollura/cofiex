import 'package:cofiex/src/shared/helpers/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:cofiex/src/shared/widgets/widgets.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
          // Versión para móvil
          Column(
            children: [
              CustomTextFormField(
                label: 'Email',
                hint: 'Email',
                controller: kIsWeb ? _emailController : null,
                errorMessage: null,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
                validator: (value) {},
              ),
              SizedBox(height: 15.sp),
              CustomTextFormField(
                label: 'Password',
                hint: 'Password',
                errorMessage: null,
                controller: kIsWeb ? _passwordController : null,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {},
              ),
            ],
          ),
        SizedBox(height: 15.sp),

        CustomFilledButton(
          buttonColor: AppTheme.appBlue,
          onPressed: () {
           if(kIsWeb){
            context.go('/select-company');
           }else{
            NavigationHelper.replaceWithUrl(context, '/select-company');
           }
          },
          text: 'INICIAR SESIÓN',
        ),
      ],
    );
  }
} 