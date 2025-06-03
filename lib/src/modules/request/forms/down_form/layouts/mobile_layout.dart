import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:cofiex/src/modules/layout/layout_bottom_navigation.dart';
import 'package:cofiex/src/modules/request/forms/down_form/layouts/desktop_layout.dart';
import 'package:cofiex/src/shared/widgets/inputs/custom_filled_button.dart';
import 'package:cofiex/src/shared/widgets/inputs/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  List<String> _attachments = [];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implementar envío del formulario
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Solicitud enviada correctamente'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _handleFileSelection() {
    // TODO: Implementar selección de archivos
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Funcionalidad en desarrollo'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Solicitud'),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Form(
              key: _formKey,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Baja de Trabajador',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.appBlue,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 3.h),
                    CustomTextFormField(
                      label: 'Nombre del trabajador *',
                      hint: 'Nombre del trabajador',
                      errorMessage: null,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese un nombre';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 2.h),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Motivo *',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignLabelWithHint: true,
                      ),
                      maxLines: 5,
                      maxLength: 500,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese un motivo';
                        }
                        if (value.length < 20) {
                          return 'El motivo debe tener al menos 20 caracteres';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Adjuntos (opcional, máximo 5 archivos, 50MB cada uno)',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.appBlue,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    CustomFilledButton(
                      onPressed: _handleFileSelection,
                      buttonColor: AppTheme.appBlue,
                      text: 'Seleccionar archivos',
                      icon: Icons.upload_file,
                    ),
                    SizedBox(height: 3.h),
                    CustomFilledButton(
                      onPressed: _handleSubmit,
                      text: 'Enviar Solicitud',
                      buttonColor: AppTheme.appBlue,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: const LayoutBottomNavigation(),
      ),
    );
  }
}