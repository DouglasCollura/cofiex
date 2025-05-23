import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextFormField extends StatefulWidget {

  final String? label;
  final bool readOnly;
  final String? hint;
  final String? initialValue;
  final String? errorMessage;
  final bool obscureText;
  final bool clearText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool onlyLetters;
  final bool onlyNumbers;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key, 
    this.label, 
    this.hint, 
    this.errorMessage, 
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged, 
    this.validator, 
    this.initialValue,
    this.readOnly = false,
    this.clearText = false,
    this.onlyLetters = false,
    this.onlyNumbers = false,
    this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  bool passwordVisible = false;
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    if(widget.initialValue != null){
      _controller.text = widget.initialValue!;
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final formatterLetters= FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"));
    final formatterNumbers= FilteringTextInputFormatter.allow(RegExp("[0-9]"));
      
    if(widget.clearText){
      _controller.clear();
    }

    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color:  Color(0xff92a0a9)),
      borderRadius: BorderRadius.circular(20)
    );

    // const borderRadius = Radius.circular(15);
    final InputDecoration inputDecoration = InputDecoration(
          filled: true,
          fillColor: const Color(0xfff1f1f1),
          floatingLabelStyle: const TextStyle(color: Color(0xff92a0a9), fontWeight: FontWeight.bold, fontSize: 18),
          enabledBorder: border,
          focusedBorder: border,
          errorBorder: border,
          // errorBorder: border.copyWith( borderSide: const BorderSide( color: Colors.transparent )),
          focusedErrorBorder: border.copyWith( borderSide: const BorderSide( color: Colors.transparent )),
          isDense: true,
          label: widget.label != null ? Text(widget.label!) : null,
          hintText: widget.hint,
          hintStyle: const TextStyle(color: Color(0xff92a0a9), fontWeight: FontWeight.bold, fontSize: 15),
          errorText: widget.errorMessage,
          focusColor: colors.primary,
          suffixIcon: widget.obscureText ?
            IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                passwordVisible
                ? Icons.visibility
                : Icons.visibility_off,
                color: Colors.black87,
                ),
              onPressed: () {
                //Toggle the state of passwordVisible variable
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
            ) :
            const SizedBox(),
          // icon: Icon( Icons.supervised_user_circle_outlined, color: colors.primary, )
        );

    return Container(
      // padding: const EdgeInsets.only(bottom: 0, top: 15),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0,5)
          )
        ]
      ),
      child: TextFormField(
        controller: _controller,
        readOnly: widget.readOnly,
        onChanged: (data){ widget.onChanged!(data); _controller.text = data;},
        validator: widget.validator,
        obscureText: widget.obscureText && !passwordVisible,
        keyboardType: widget.keyboardType,
        style: const TextStyle( fontSize: 20, color: Colors.black54 ),
        decoration:inputDecoration,
        inputFormatters: [
          if(widget.onlyLetters) formatterLetters,
          if(widget.onlyNumbers) formatterNumbers,
        ],
        // initialValue: widget.initialValue ?? '',
      ),
    );
  }
}