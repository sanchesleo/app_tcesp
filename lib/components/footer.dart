import 'package:flutter/material.dart';

class FooterBuild extends StatelessWidget {
  const FooterBuild({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            padding:EdgeInsets.all(20),
            width: MediaQuery. of(context). size. width,
            decoration: BoxDecoration(
              color: Color.fromRGBO(120, 69, 247, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)
              ),
            ),
            child: Text(
              'Tribunal de contas do estado de São Paulo', 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white
              ),
            ),
    );
  }
}