import 'package:flutter/material.dart';

class DashboardCardFrame extends StatelessWidget {
  final Size size;
  final Widget body;
  final String title;
  final Alignment? titleAlignment;
  final Function()? onPressed;
  DashboardCardFrame(this.size, this.body, this.title,
      {this.titleAlignment, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.only(right: 5),
      child: Card(
          child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.center,
                  height: size.height * 0.6,
                  child: body),
              Container(
                  alignment: titleAlignment ?? Alignment.center,
                  height: size.height * 0.130,
                  child: Text(title,
                      style: Theme.of(context).textTheme.titleLarge!))
            ],
          ),
        ),
      )),
    );
  }
}
