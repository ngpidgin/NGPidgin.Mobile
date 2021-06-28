import 'package:flutter/material.dart';

class ItemRow extends StatelessWidget {
  final String text;
  final Widget widget;
  const ItemRow(this.text, this.widget);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(text), widget],
        ));
  }
}
