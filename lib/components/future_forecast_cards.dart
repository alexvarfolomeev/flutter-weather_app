import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FutureForecastCards {

  static Widget getForecastCard(String day, String image, String temp) {
    return Card(
      borderOnForeground: true,
      shadowColor: Colors.black,
      margin: EdgeInsets.only(top: 100, left: 20),
      elevation: 8,
      shape:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey)
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image(image: AssetImage(image), width: 30, height: 30),
          ),
          Text(temp, style: TextStyle(fontSize: 20, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.black),),
          SizedBox(
            width: 75,
            height: 25,
          ),
        ],
      ),
    );
  }
}