// ignore_for_file: prefer_const_constructors

import 'package:brew_crew/screens/brewlist.dart';
import 'package:brew_crew/services/authentication.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/custombrew.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _authservice = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CustomBrew>?>.value(
      value: DB().brewStream,
      initialData: [CustomBrew(name: 'noname', strength: 0, sugars: '0')],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          backgroundColor: Colors.black,
          actions: <Widget>[
            OutlinedButton.icon(
              onPressed: () {_authservice.signOut();}, 
              icon: Icon(Icons.person), 
              label: Text("Logout"),),
            IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.settings),
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}