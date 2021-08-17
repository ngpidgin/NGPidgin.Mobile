import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String placeholder;
  late final String? requiredValidationMessage;
  final int? lines;
  late final EdgeInsets? padding;
  late final TextInputAction? inputAction;

  FormInput(this.placeholder,
      {this.requiredValidationMessage,
      this.lines,
      this.padding,
      this.inputAction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        maxLines: lines ?? 1,
        textInputAction: inputAction ?? TextInputAction.next,
        decoration: InputDecoration(
            isDense: true,
            contentPadding: padding ?? EdgeInsets.all(12),
            border: OutlineInputBorder(),
            hintStyle: TextStyle(fontSize: 12, color: Color(0xFFC4C4C4)),
            hintText: placeholder),
        validator: (value) {
          if (requiredValidationMessage!.isEmpty == false &&
              (value == null || value.isEmpty)) {
            return requiredValidationMessage;
          }
          return null;
        });
  }
}
