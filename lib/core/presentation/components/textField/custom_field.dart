import 'package:flutter/material.dart';

import '../../../Config/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool obscureText;
  final VoidCallback? onTapSuffix;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.obscureText = false,
    this.onTapSuffix,
    this.keyboardType = TextInputType.text,
    this.validator, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.teal,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.teal),
        prefixIcon: Icon(icon),
        suffixIcon: onTapSuffix != null
            ? GestureDetector(
                onTap: onTapSuffix,
                child:
                    Icon(obscureText ? Icons.visibility : Icons.visibility_off),
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.teal),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onChanged: onChanged,
      validator:validator,

      onTapOutside: (event){
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
