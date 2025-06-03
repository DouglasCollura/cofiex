import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:cofiex/src/modules/layout/layout_bottom_navigation.dart';
import 'package:cofiex/src/shared/widgets/inputs/custom_filled_button.dart';
import 'package:cofiex/src/shared/widgets/inputs/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitud General'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Form(
              key: _formKey,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(2.w),
                              decoration: BoxDecoration(
                                color: AppTheme.appBlue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.description_outlined,
                                size: 32.px,
                                color: AppTheme.appBlue,
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Expanded(
                              child: Text(
                                'Solicitud General',
                                style: TextStyle(
                                  fontSize: 24.px,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.appBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        CustomTextFormField(
                          label: 'Título de la solicitud *',
                          hint: 'Título de la solicitud',
                          errorMessage: null,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese un título';
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
                            fontSize: 14.px,
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
          ),
        ),
      ),
      bottomNavigationBar: const LayoutBottomNavigation(),
    );
  }
}
