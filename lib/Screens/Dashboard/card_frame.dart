import 'package:flutter/material.dart';

class DashboardCardFrame extends StatelessWidget {
  final Size size;
  final Widget body;
  final String title;
  DashboardCardFrame(this.size, this.body, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.only(right: 5),
      child: Card(
          child: InkWell(
        onTap: () => {print("xxx")},
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
                  alignment: Alignment.center,
                  height: size.height * 0.125,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
