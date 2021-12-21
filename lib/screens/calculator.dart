import 'package:flutter/material.dart';
import 'dart:math';
import 'package:calculatorapp/screens/results.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'converter.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double result = 0, num1 = 0, num2 = 0;
  num resultPower = 0;
  var operator = null;

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  add() {
    setState(() {
      operator = '+';
      num1 = double.parse(controller1.text);
      num2 = double.parse(controller2.text);
      result = num1 + num2;
    });
  }

  sub() {
    setState(() {
      operator = '-';
      num1 = double.parse(controller1.text);
      num2 = double.parse(controller2.text);
      result = num1 - num2;
    });
  }

  div() {
    setState(() {
      operator = '/';
      num1 = double.parse(controller1.text);
      num2 = double.parse(controller2.text);
      result = num1 / num2;
    });
  }

  mul() {
    setState(() {
      operator = '*';
      num1 = double.parse(controller1.text);
      num2 = double.parse(controller2.text);
      result = num1 * num2;
    });
  }

  powr() {
    setState(() {
      operator = 'x2';
      num1 = double.parse(controller1.text);
      num2 = double.parse(controller2.text);
      resultPower = pow(num1, num2);
      result = resultPower.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference calculations =
        FirebaseFirestore.instance.collection('calculation');
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Calculator App"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Tulemus: $num1 $operator $num2 = $result",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller1,
              cursorColor: Colors.grey,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Colors.grey,
              ),
              decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                  labelText: "Sisesta esimene number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller2,
              cursorColor: Colors.grey,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Colors.grey,
              ),
              decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                  labelText: "Sisesta teine number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    add();
                    await calculations.add({
                      'num1': num1,
                      'num2': num2,
                      'operator': operator,
                      'result': result,
                    }).then((value) => print('Calculation added'));
                    controller1.clear();
                    controller2.clear();
                  },
                  child: Text("+"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800])),
                ),
                ElevatedButton(
                  onPressed: () async {
                    sub();
                    await calculations.add({
                      'num1': num1,
                      'num2': num2,
                      'operator': operator,
                      'result': result
                    }).then((value) => print('Calculation added'));
                    controller1.clear();
                    controller2.clear();
                  },
                  child: Text("-"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                ElevatedButton(
                  onPressed: () async {
                    powr();
                    await calculations.add({
                      'num1': num1,
                      'num2': num2,
                      'operator': operator,
                      'result': result
                    }).then((value) => print('Calculation added'));
                    controller1.clear();
                    controller2.clear();
                  },
                  child: Text("x2"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    mul();
                    await calculations.add({
                      'num1': num1,
                      'num2': num2,
                      'operator': operator,
                      'result': result
                    }).then((value) => print('Calculation added'));
                    controller1.clear();
                    controller2.clear();
                  },
                  child: Text("*"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                ElevatedButton(
                  onPressed: () async {
                    div();
                    await calculations.add({
                      'num1': num1,
                      'num2': num2,
                      'operator': operator,
                      'result': result
                    }).then((value) => print('Calculation added'));
                    controller1.clear();
                    controller2.clear();
                  },
                  child: Text("/"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                ElevatedButton(
                  child: const Text('km/mil'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: const Text('Database'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const answerPage()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
