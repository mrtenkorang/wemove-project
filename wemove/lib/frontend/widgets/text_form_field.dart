import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController fieldController;
  final String fieldLabelText;
  final String? hintText;
  final int maxLines;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  final IconData? icon;
  final Color? iconColor;
  final Function()? onTap;
  final bool obscure;
  const CustomTextField({
    Key? key,
    required this.fieldController,
    required this.fieldLabelText,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.obscure = false,
    this.onTap,
    this.icon,
    this.iconColor,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextFormField(
        onTap: onTap,
        cursorColor: Colors.green,
        obscureText: obscure,
        validator: validator,
        textCapitalization: textCapitalization,
        maxLines: maxLines,
        controller: fieldController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.green),
          icon: Icon(
            icon,
            color: iconColor,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
            ), // Set the desired active color
          ),
          labelText: fieldLabelText,
          labelStyle: const TextStyle(color: Colors.green),
        ),
      ),
    );
  }
}
