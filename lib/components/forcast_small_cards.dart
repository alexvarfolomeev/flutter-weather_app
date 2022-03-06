import 'package:flutter/material.dart';
import 'package:weather_app/components/tempurature_component.dart';

class ForcastCard extends StatelessWidget {
  final String dayOfTheWeek;
  final String image;
  final String temp;

  ForcastCard(this.dayOfTheWeek, this.image, this.temp);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Day of the week', style: TextStyle(fontSize: 10, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.black),),
          ),
          Container(
            width: 70,
            height: 93,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Column(
              children: <Widget>[
                SizedBox(width: 20, height: 15,),
                Image(image: AssetImage(image), width: 30, height: 30),
                Text(temp, style: TextStyle(fontSize: 12, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.black),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
