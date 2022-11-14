
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(1.0, 6.0),
                  blurRadius: 10.0,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(1.0, 6.0),
                  blurRadius: 10.0,
                ),
              ],
              /* gradient: LinearGradient(
                    colors: [
                     // gradientStartColor,
                     // gradientEndColor
                    ],
                    begin: const FractionalOffset(0.2, 0.2),
                    end: const FractionalOffset(1.0, 1.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),*/
            ),
            child: Center(
              child: Image(
                image: AssetImage('lib/assets/images/csc.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      );
  }
}
