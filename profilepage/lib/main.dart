// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePg(),
  ));
}

class HomePg extends StatelessWidget {
  const HomePg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text("Your profile"),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0,),
            Text(
              'First heading:',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 28.0,
              ),
            ),
            Text(
              'First Value',
              style: TextStyle(
                color: Colors.orange[400],
                fontSize: 69.0,
              ),
            ),
            SizedBox(height: 40.0,),
            Text(
              'Second heading:',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 28.0,
              ),
            ),
            Text(
              '2nd Value',
              style: TextStyle(
                color: Colors.orange[400],
                fontSize: 69.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}