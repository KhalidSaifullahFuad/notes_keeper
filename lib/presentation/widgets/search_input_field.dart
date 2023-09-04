import 'package:flutter/material.dart';

class SearchInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool isListLayout;
  final void Function(String)? onChanged;
  final void Function() onLayoutChanged;
  final String? errorText;

  const SearchInputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.isListLayout,
    required this.onLayoutChanged,
    this.onChanged,
    this.errorText,
  });

  @override
  SearchInputFieldState createState() => SearchInputFieldState();
}

class SearchInputFieldState extends State<SearchInputField> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      controller: widget.controller,
      keyboardAppearance: Theme.of(context).brightness,
      textAlignVertical: TextAlignVertical.center,
      onChanged: widget.onChanged,
      style: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
      keyboardType: TextInputType.text,
      cursorColor: colorScheme.primary,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 50),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: colorScheme.primary,
          size: 20.0,
        ),
        suffixIconConstraints: const BoxConstraints(minWidth: 50),
        suffixIcon: IconButton(
          onPressed: widget.onLayoutChanged,
          icon: Icon(
            widget.isListLayout
                ? Icons.grid_view_outlined
                : Icons.list_outlined,
            color: colorScheme.primary,
            size: 22.0,
          ),
          splashRadius: 25.0,
        ),
        hintText: widget.hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: colorScheme.primary,
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
        filled: true,
        fillColor: colorScheme.surface,
        hoverColor: colorScheme.surface,
      ),
    );
  }
}
