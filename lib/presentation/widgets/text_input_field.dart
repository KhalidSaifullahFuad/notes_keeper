import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isPassword;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;
  final String? errorText;

  const TextInputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.keyboardType,
    this.validator,
    this.isPassword = false,
    this.onChanged,
    this.textInputAction = TextInputAction.done,
    this.errorText,
  });

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardAppearance: Theme.of(context).brightness,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      style: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
      keyboardType: widget.keyboardType,
      obscureText: _isObscure && widget.isPassword,
      cursorColor: Theme.of(context).colorScheme.primary,
      decoration: InputDecoration(
        prefixIconConstraints: const BoxConstraints(minWidth: 50),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Theme.of(context).colorScheme.primary,
          size: 20.0,
        ),
        suffixIconConstraints: const BoxConstraints(minWidth: 50),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: Icon(
                  _isObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20.0,
                ),
                splashRadius: 30.0,
              )
            : null,
        // labelText: widget.hintText,
        hintText: widget.hintText,
        errorText: widget.errorText,
        errorStyle: TextStyle(
          color: Theme.of(context).colorScheme.error,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        hoverColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}
