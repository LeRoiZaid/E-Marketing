import 'package:flutter/material.dart';

class EsmailTextField extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;
  final bool obscureText;
  final String obscuringCharacter = '✦';
  int? maxLines;
  bool? expands;

  EsmailTextField({
    this.controller,
    this.decoration,
    this.keyboardType,
    this.validator,
    this.autovalidateMode,
    this.maxLines,
    this.expands,
    this.obscureText = false,
  });

  @override
  _EsmailTextFieldState createState() => _EsmailTextFieldState();
}

class _EsmailTextFieldState extends State<EsmailTextField> {
  FocusNode _focusNode = FocusNode();
  Color _fillColor = Color.fromARGB(255, 176, 222, 240);

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _fillColor = _focusNode.hasFocus
            ? Color.fromARGB(255, 255, 255, 255)
            : Color.fromARGB(255, 176, 222, 240);
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      autovalidateMode:
          widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
      keyboardType: widget.keyboardType ?? TextInputType.name,
      validator: widget.validator, // Use directly, no need for ?.validator
      obscureText: widget.obscureText,
      obscuringCharacter: widget.obscuringCharacter,
      decoration: widget.decoration?.copyWith(
        fillColor: _fillColor,
        filled: true,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 80, 117, 146),
          fontStyle: FontStyle.italic,
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 243, 2, 2),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.all(20),
      ),
    );
  }
}
