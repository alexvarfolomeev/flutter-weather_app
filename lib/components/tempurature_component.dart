import 'package:flutter/material.dart';

class TempuratureWidget extends StatelessWidget {
  final String imageName;
  final String text;

  TempuratureWidget(this.imageName, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 240,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Image(image: AssetImage(imageName), width: 75, height: 75,),
          Text(text + '°C', style: TextStyle(fontSize: 90, fontFamily: 'Montserrat', fontWeight: FontWeight.normal),)
        ],
      ),
    );
  }
}
