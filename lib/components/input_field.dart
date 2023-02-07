import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    this.controller,
    this.validator,
    this.hintText,
    TextInputType? keyboardType,
    bool obscureText = false,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final InputDecoration? decoration = const InputDecoration();
  final String? hintText;
  final bool readOnly;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      validator: validator,
      readOnly: readOnly,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.all(12),
      ),
    );
  }
}
