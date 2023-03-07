// ignore_for_file: prefer_const_constructors

import 'package:brew_crew/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _authservice = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.black,
        actions: <Widget>[
          OutlinedButton.icon(onPressed: () {_authservice.signOut();}, icon: Icon(Icons.person), label: Text("Logout")),

        ],
      ),
    );
  }
}