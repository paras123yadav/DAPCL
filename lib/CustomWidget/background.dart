import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: -50,
            right: 0,
            child: Image.asset(
                "assets/top1.png",
                width: size.width
            ),
          ),
          Positioned(
            top: -40,
            right: 0,
            child: Image.asset(
                "assets/top2.png",
                width: size.width
            ),
          ),
          Positioned(
              bottom: -60,
              right: 0,
            child: Image.asset(
                "assets/bottom1.png",
                width: size.width
            ),
          ),
          Positioned(
            bottom: -15,
            right: 0,
            child: Image.asset(
                "assets/bottom2.png",
                width: size.width
            ),
          ),

          child
        ],
      ),
    );
  }
}