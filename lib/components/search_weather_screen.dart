import 'package:flutter/material.dart';

class SearchWeather extends StatefulWidget{

  const SearchWeather({Key? key}) : super(key: key);

  @override
  State createState() => _SearchWeatherState();

}

class _SearchWeatherState extends State<SearchWeather>{

  late TextEditingController _controller;
  String city = '';

  @override
  void initState(){
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void despose(){
    _controller.dispose();
    super.dispose();
  }

  void _onSubmitted(String txt) {
    city = _controller.text;
    Navigator.pop(context, city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search weather"),),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(5.0),
          margin: EdgeInsets.all(5.0),
          child: TextField(
            controller: _controller,
            onSubmitted: _onSubmitted,
          ),
        )
      ],),
    );
  }
}