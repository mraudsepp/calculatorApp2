import 'package:flutter/material.dart';
import 'dart:math';
import 'second_Screen.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));


}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
 
  double  result=0,num1=0,num2=0;num resultPower=0;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2  = TextEditingController();

  add() {
    setState(() {
      num1 = double.parse(controller1.text);
      num2 = double.parse(controller2.text);
      result = num1 + num2;

    });
  }
  sub() {
    setState(() {
      num1 = double.parse(controller1.text);
      num2 = double.parse(controller2.text);
      result = num1 - num2;

    });
  }
  div() {
    setState(() {
      num1 = double.parse(controller1.text);
      num2 = double.parse(controller2.text);
      result = num1 / num2;

    });
  }
  mul() {
    setState(() {
      num1 = double.parse(controller1.text);
      num2 = double.parse(controller2.text);
      result = num1 * num2;
    });
  }
  powr() {
    setState(() {
      num1 = double.parse(controller1.text);
      num2 = double.parse(controller2.text);
      resultPower = pow(num1, num2);
      result = resultPower.toDouble();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Tulemus: $result",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,
            ),
            TextField(
              controller: controller1,
              decoration: InputDecoration(
                labelText: "Sisesta esimene number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
            SizedBox(height: 20,
            ),
            TextField(
              controller: controller2,
              decoration: InputDecoration(
                  labelText: "Sisesta teine number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
            ),
            SizedBox(height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
              children: [
                ElevatedButton(onPressed: () {
                  add();
                  controller1.clear();
                  controller2.clear();

                },
                    child: Text("+"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),),
                ElevatedButton(onPressed: () {
                  sub();
                  controller1.clear();
                  controller2.clear();

                }, child: Text("-"),
                    style: ElevatedButton.styleFrom(
                    primary: Colors.yellow,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),),
                ElevatedButton(onPressed: () {
                  powr();
                  controller1.clear();
                  controller2.clear();
                },
                  child: Text("x2"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),),


              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
              children: [
                ElevatedButton(onPressed: () {
                  mul();
                  controller1.clear();
                  controller2.clear();

                }, child: Text("*"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),),
                ElevatedButton(onPressed: () {
                  div();
                  controller1.clear();
                  controller2.clear();

                }, child: Text("/"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),),
                ElevatedButton(
                  child: const Text('Ava konverter'),
                              onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondRoute()));

                },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),),
              ],
            ),


          ],),
      ),
    );
  }
}








