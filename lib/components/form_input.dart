import 'package:flutter/material.dart';
import 'package:ngpidgin/constants.dart';

class FormInput extends StatelessWidget {
  final String? placeholder;
  late final String? requiredValidationMessage;
  final String? label;
  final bool required;
  final int? lines;
  final Color? bgColor;
  late final EdgeInsets? padding;
  late final TextInputAction? inputAction;
  late final TextEditingController? controller;

  FormInput(
      {this.placeholder,
      this.requiredValidationMessage = "This field is required",
      this.label,
      this.required = true,
      this.lines,
      this.bgColor = Colors.white,
      this.padding,
      this.inputAction,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: label != null ? 5 : 10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            label != null
                ? Text(label!, style: TextStyle(color: Palette.Pale))
                : SizedBox(height: 0),
            SizedBox(height: label != null ? 5 : 0),
            TextFormField(
                maxLines: lines ?? 1,
                textInputAction: inputAction ?? TextInputAction.next,
                controller: controller!,
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: padding ?? EdgeInsets.all(12),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    filled: true,
                    fillColor: bgColor,
                    hintStyle: TextStyle(color: Color(0xFFC4C4C4)),
                    hintText: placeholder!),
                validator: (value) {
                  if (required && (value == null || value.isEmpty)) {
                    return requiredValidationMessage;
                  }
                  return null;
                }),
          ]),
    );
  }
}
