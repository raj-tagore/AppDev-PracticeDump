// ignore_for_file: prefer_const_constructors

import 'package:brew_crew/services/authentication.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _authservice = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text("Sign In Here"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () async {
            dynamic resultofsignin = await _authservice.signInAnonymously();
            print(resultofsignin.uid.toString());
          }, 
          child: Text("Sign In Anonymously"),
        ),
      ),
    );
  }
}