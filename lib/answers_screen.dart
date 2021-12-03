import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class answerPage extends StatefulWidget {
  const answerPage({Key? key}) : super(key: key);

  @override
  _answerPageState createState() => _answerPageState();
}

class _answerPageState extends State<answerPage> {
  final Stream<QuerySnapshot> calculation =
      FirebaseFirestore.instance.collection('calculation').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Solutions page")),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Read data from Cloud Firestore',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Container(
                height: 250,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: StreamBuilder<QuerySnapshot>(
                  stream: calculation,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong.');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading');
                    }

                    final data = snapshot.requireData;

                    return ListView.builder(
                      itemCount: data.size,
                      itemBuilder: (context, index) {
                        return Text(' ${data.docs[index]['num1']} ${data.docs[index]['operator']} '
                            ' ${data.docs[index]['num2']} = ${data.docs[index]['result']}'
                            '');
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
