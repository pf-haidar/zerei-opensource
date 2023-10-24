import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final Key? customKey;
  final String? initialValue;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String? labelText;

  const CustomTextFormFieldWidget({
    super.key,
    this.customKey,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: customKey,
      initialValue: initialValue,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white70,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        errorStyle: const TextStyle(color: Colors.red),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
