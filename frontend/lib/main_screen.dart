import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_svg/svg.dart';

class MyMainScreen extends StatefulWidget {
  const MyMainScreen({Key? key}) : super(key: key);

  @override
  _MyMainScreen createState() => _MyMainScreen();
}

class _MyMainScreen extends State<MyMainScreen> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator IphonexWidget - FRAME

    return Container(
        width: 375,
        height: 812,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 4),
                blurRadius: 4)
          ],
        ),
        child: Stack(children: <Widget>[
          //Positioned(top: 0, left: 0, child: null),
          Positioned(
              top: -239,
              left: -145,
              child: Container(
                  width: 1040,
                  height: 1300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/111.png'),
                        fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: 453,
              left: 209,
              child: Container(
                  width: 107,
                  height: 101,
                  decoration: BoxDecoration(),
                  child: Stack(children: <Widget>[
                    Positioned(
                      top: 16.83333396911621,
                      left: 17.83333396911621,
                      child: SvgPicture.asset('assets/images/vector.svg',
                          semanticsLabel: 'vector'),
                    ),
                  ]))),
          //Positioned(top: 0, left: 0, child: null),
          //Positioned(top: 44, left: 0, child: null),
          //Positioned(top: 778, left: 0, child: null),
          Positioned(
              top: 330,
              left: 16,
              child: Container(
                  width: 285.75726318359375,
                  height: 143.27587890625,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 2.107978343963623,
                        child: Transform.rotate(
                          angle: -1.4640931606798049 * (math.pi / 180),
                          child: Text(
                            'BOOK WITH US ANYWHERE ANYTIME',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Montserrat',
                                fontSize: 36,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        )),
                  ]))),
        ]));
  }
}
