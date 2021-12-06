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
      appBar: AppBar(
        title: Text("Konverter"),
      ),
body: Column(children: <Widget> [
  Padding(
    padding: const EdgeInsets.all(10),
    child: Text('Convert km to miles',
    style: TextStyle(fontSize: 20, color: Colors.grey)),
  ),
  Padding(
    padding: const EdgeInsets.all(10),
    child: TextField(
      keyboardType: TextInputType.number,
     controller: _unitController1,
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
      keyboardType: TextInputType.number,
      controller: _unitController2,
    ),
  ),

  ElevatedButton(child: Text('Konverteeri'),
      onPressed: (){
    setState(() {
      _tulemus1 = '${int.parse(_unitController1.text) * 0.621371}';
      _tulemus2 = '${int.parse(_unitController2.text) * 1.60934}';
    });

  }
  ),
  SizedBox(height: 20,),
  Text(_tulemus1 + ' miles'),
  Text(_tulemus2 + ' km'),
  ElevatedButton(child: Text('Tühista'),
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

