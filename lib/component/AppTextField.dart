import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nfc_task/utils/app_color.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? Function(String?)? validatorFunction;
  final bool isObscure;
  final TextInputType keyboardType;
  final String hintText;
  final Widget? suffixIcon;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? onChangeFunction;

  const AppTextField({
    Key? key,
    required this.textEditingController,
    this.validatorFunction,
    this.onChangeFunction,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.isObscure = false,
    this.suffixIcon,
    required this.hintText,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      cursorColor: Colors.black,
      onChanged: onChangeFunction,
      keyboardType: keyboardType,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      obscureText: isObscure,
      obscuringCharacter: "*",
      textAlignVertical: TextAlignVertical.center,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        errorStyle: const TextStyle(
          fontSize: 14,
        ),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.transparent,
          ),
        ),
        suffixIcon: (suffixIcon == null)
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.only(
                  right: 20.0,
                  top: 16,
                  bottom: 16,
                ),
                child: suffixIcon,
              ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.transparent,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
      inputFormatters: inputFormatters,
      validator: validatorFunction,
      maxLines: maxLines,
    );
  }
}
