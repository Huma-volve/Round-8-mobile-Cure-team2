import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

enum TextFieldBorderType {
  filled,
  outlined,
  underlined,
  none,
}

class AppTextField extends StatelessWidget {
  final TextFieldBorderType borderType;
  final TextEditingController? controller;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextStyle? style;
  final bool autofocus;
  final bool readOnly;
  final bool? showCursor;
  final AutovalidateMode? autoValidateMode;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final String? helperText;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? helperStyle;
  final Widget? suffix;
  final List<TextInputFormatter>? formatter;
  final Widget? prefix;
  final Color? filledColor;
  final Color? borderColor;
  final double borderRadius;
  final double borderWidth;

  const AppTextField({
    super.key,
    this.autofocus = false,
    this.borderType = TextFieldBorderType.filled,
    this.readOnly = false,
    this.smartDashesType,
    this.filledColor,
    this.helperText,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.labelStyle,
    this.helperStyle,
    this.formatter,
    this.keyboardType,
    this.showCursor,
    this.obscuringCharacter = '*',
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.style,
    this.validator,
    this.controller,
    this.initialValue,
    this.suffix,
    this.prefix,
    this.autocorrect = true,
    this.borderColor,
    this.borderRadius = 10,
    this.borderWidth = 1.5,
  });

  InputBorder _getBorder() {
    switch (borderType) {
      case TextFieldBorderType.filled:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        );
      case TextFieldBorderType.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.grey300,
            width: borderWidth,
          ),
        );
      case TextFieldBorderType.underlined:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? AppColors.grey300,
            width: borderWidth,
          ),
        );
      case TextFieldBorderType.none:
        return InputBorder.none;
    }
  }

  InputBorder _getFocusedBorder() {
    switch (borderType) {
      case TextFieldBorderType.filled:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        );
      case TextFieldBorderType.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.primary,
            width: borderWidth,
          ),
        );
      case TextFieldBorderType.underlined:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? AppColors.primary,
            width: borderWidth,
          ),
        );
      case TextFieldBorderType.none:
        return InputBorder.none;
    }
  }

  InputBorder _getErrorBorder() {
    switch (borderType) {
      case TextFieldBorderType.filled:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: AppColors.error,
            width: borderWidth,
          ),
        );
      case TextFieldBorderType.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: AppColors.error,
            width: borderWidth,
          ),
        );
      case TextFieldBorderType.underlined:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.error,
            width: borderWidth,
          ),
        );
      case TextFieldBorderType.none:
        return InputBorder.none;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      keyboardType: keyboardType,
      inputFormatters: formatter,
      controller: controller,
      initialValue: initialValue,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      validator: validator,
      autofocus: autofocus,
      readOnly: readOnly,
      showCursor: showCursor,
      autocorrect: autocorrect,
      smartDashesType: smartDashesType,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      maxLength: maxLength,
      style: style ?? AppTextStyles.montserratButton,
      cursorColor: AppColors.primary,
      autovalidateMode: autoValidateMode,
      decoration: InputDecoration(
        prefixIconColor: AppColors.grey300,
        contentPadding: EdgeInsets.zero,
        suffixIconColor: AppColors.grey300,
        filled: borderType == TextFieldBorderType.filled,
        fillColor: filledColor ??
            (borderType == TextFieldBorderType.filled
                ? AppColors.grey50
                : null),
        prefixIcon: prefix,
        suffixIcon: suffix,
        helperText: helperText,
        hintText: hintText,

        helperStyle: helperStyle,
        hintStyle: hintStyle ??
            AppTextStyles.montserratButton.copyWith(color: AppColors.grey400),
        labelStyle: labelStyle,
        labelText: labelText,
        border: _getBorder(),
        enabledBorder: _getBorder(),
        focusedBorder: _getFocusedBorder(),
        errorBorder: _getErrorBorder(),
        focusedErrorBorder: _getErrorBorder(),
      ),
    );
  }
}
