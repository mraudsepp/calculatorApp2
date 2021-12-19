import 'package:flutter/material.dart';


class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {

  final _unitController1 = TextEditingController();
  final _unitController2 = TextEditingController();
  var _tulemus1 = ''; var _tulemus2 = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Km/Miles Converter"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
body:
Column(children: <Widget> [
  SizedBox(
    height: 40,
  ),
  Padding(
    padding: const EdgeInsets.all(10),
    child: Text('Convert km to miles',
    style: TextStyle(fontSize: 20, color: Colors.grey)),
  ),
  Padding(
    padding: const EdgeInsets.all(10),
    child: TextField(
      controller: _unitController1,
      cursorColor: Colors.grey,
      keyboardType: TextInputType.number,
      style: TextStyle(
        color: Colors.grey,
      ),


    ),
  ),

  Padding(
    padding: const EdgeInsets.all(10),
    child: Text('Convert miles to km',
        style: TextStyle(fontSize: 20, color: Colors.grey)),
  ),
  Padding(
    padding: const EdgeInsets.all(10),
    child: TextField(
      controller: _unitController2,
      cursorColor: Colors.grey,
      keyboardType: TextInputType.number,
      style: TextStyle(
        color: Colors.grey,
      ),

    ),
  ),

  ElevatedButton(
      child: Text('Konverteeri'),
      style: ElevatedButton.styleFrom(
          primary: Colors.grey,
          padding:
          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          textStyle:
          TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800])),
      onPressed: (){
    setState(() {
      _tulemus1 = '${int.parse(_unitController1.text) * 0.621371}';
      _tulemus2 = '${int.parse(_unitController2.text) * 1.60934}';
    });

  }
  ),
  SizedBox(height: 40),
  Text(_tulemus1 + ' miles',
  style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.grey
  ),),
  Text(_tulemus2 + ' km',
    style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.grey
    ),),
  SizedBox(height: 20),
  ElevatedButton(child: Text('Tühista'),
      style: ElevatedButton.styleFrom(
          primary: Colors.grey,
          padding:
          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          textStyle:
          TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800])),
      onPressed: (){
        setState(() {
          _tulemus1 = '';
          _tulemus2 = '';
        });

      }
  ),

],
),
    );
  }
}

