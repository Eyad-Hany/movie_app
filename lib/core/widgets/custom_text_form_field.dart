import 'package:flutter/material.dart';

import '../theme_manager/collor_pallete.dart';

class CustomTextFormField extends StatefulWidget {

  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final int? maxLines;
  final int? minLines;
  final bool isPassword;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  const CustomTextFormField({super.key, this.controller, this.hintText, this.prefixIcon, this.maxLines=1, this.minLines, this.isPassword=false, this.onChanged, this.onFieldSubmitted, this.validator,});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      obscureText: widget.isPassword ? obscureText : false,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validator,
      style: TextStyle(
        color: ColorPallete.white,
        fontSize: 16,
        height: 2,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: ColorPallete.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: widget.isPassword ? GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: ColorPallete.white,
            size: 30,
          )
        ):null,
        filled: true,
        fillColor: ColorPallete.generalTextColor,

        prefixIcon: widget.prefixIcon,
        prefixIconColor: ColorPallete.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: ColorPallete.generalTextColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: ColorPallete.generalTextColor,
            width: 1.5,
          ),
          ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: ColorPallete.generalTextColor,
            width: 1.5,
        ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: ColorPallete.generalTextColor,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: ColorPallete.generalTextColor,
            width: 1.5,
      ),
    ),
      ),
    );
  }
}
