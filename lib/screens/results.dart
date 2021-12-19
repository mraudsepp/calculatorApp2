import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


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
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
            title: Text("Firestore results page"),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          elevation: 0.0,),

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Read data from Cloud Firestore',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                color: Colors.grey),
              ),
              Container(
                height: 500,
                padding: const EdgeInsets.symmetric(vertical: 40),
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
                            '',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20.0,
                        ),);
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
