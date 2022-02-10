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
      appBar: AppBar(title: const Text("Search weather"), backgroundColor: Colors.green,),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.green, Colors.white]
          ),
        ),
        child: Column(children: [
          SizedBox(height: 50),
          Container(
            width: 400,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(5.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
                  hintText: 'Введите название города',
                ),
                controller: _controller,
                onSubmitted: _onSubmitted,
              ),
            ),
          )
        ],),
      ),
    );
  }
}