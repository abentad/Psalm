import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Color borderColor;
  final Widget child;

  MyContainer({this.borderColor, this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          Container(
            height: 120.0,
            width: 10.0,
            decoration: BoxDecoration(
              color: borderColor,
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          Expanded(
            child: Container(
              height: 120.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: child,
            ),
          )
        ],
      ),
    );
  }
}
