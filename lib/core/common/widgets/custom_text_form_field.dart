import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final bool isPassword;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final String? labelText;
  final void Function(String)? onchanged;
  final List<String>? autofillHints;
  final double? verticalPadding;
  final double? horizontalPadding;
  final void Function(String)? onFieldSubmitted;
  final bool readOnly;
  final void Function()? onTap;
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.maxLines = 1,
    this.suffixIcon,
    this.fillColor,
    this.prefixIcon,
    this.isPassword = false,
    this.keyboardType,
    this.labelText,
    this.onchanged,
    this.autofillHints,
    this.verticalPadding,
    this.horizontalPadding,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.onTap,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      focusNode: FocusNode()..unfocus(),
      textAlign: TextAlign.right,
      autofillHints: widget.autofillHints,
      controller: widget.controller,
      obscureText: widget.isPassword ? !obscureText : widget.obscureText,
      keyboardType: widget.keyboardType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: widget.verticalPadding ?? 18.0.w,
          horizontal: widget.horizontalPadding ?? 12.0.w,
        ),
        hintText: widget.hintText,

        hintStyle: AppStyles.ts14BlackW500.copyWith(color: AppColors.greyText),
        fillColor: widget.fillColor ?? AppColors.white,
        filled: true,
        labelText: widget.labelText,
        labelStyle: AppStyles.ts12GreyW400.copyWith(color: AppColors.grey),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: Visibility(
                  visible: obscureText,
                  child: const Icon(Icons.visibility_outlined),
                  replacement: const Icon(Icons.visibility_off_outlined),
                ),
                color: AppColors.grey,
              )
            : widget.suffixIcon,

        prefixIcon: widget.prefixIcon,
        border: InputBorder.none,

        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
          borderRadius: BorderRadius.circular(12.0.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
          borderRadius: BorderRadius.circular(12.0.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
          borderRadius: BorderRadius.circular(12.0.r),
        ),
      ),
      validator: widget.validator ?? (value) => null,
      onChanged: widget.onchanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
    );
  }
}
