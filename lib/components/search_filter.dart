import 'package:flutter/material.dart';

class SearchFilterInput extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onChange;
  final bool isTransparent;
  final bool setBoxModel;

  const SearchFilterInput(
      {this.hintText,
      this.controller,
      this.focusNode,
      this.onChange,
      this.isTransparent = false,
      this.setBoxModel = true});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
        margin: setBoxModel ? EdgeInsets.only(bottom: 20) : EdgeInsets.zero,
        padding: setBoxModel
            ? EdgeInsets.only(left: 15, right: 10)
            : EdgeInsets.zero,
        width: size.width * 0.9,
        decoration: !isTransparent
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)))
            : BoxDecoration(),
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
              hintText: hintText,
              border: InputBorder.none,
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              )),
          onChanged: onChange,
        ));
  }
}
