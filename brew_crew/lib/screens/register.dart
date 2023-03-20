// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:brew_crew/services/authentication.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';

import '../shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  const Register({super.key, required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _authservice = AuthService();
  String username = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text("Register"),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () => widget.toggleView(), 
            icon: Icon(Icons.person), 
            label: Text("Sign In Instead")),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            TextFormField(
              decoration: textInputDecor.copyWith(hintText: 'email'),
              validator: (value) => value!.isEmpty ? 'Enter username' : null,
              onChanged: (value) => setState(() => username = value),
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: textInputDecor.copyWith(hintText: 'password'),
              validator: (value) => value!.length < 6 ? 'Enter valid password' : null,
              obscureText: true,
              onChanged: (value) => setState(() => password = value),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() => loading = true);
                  dynamic result = await _authservice.registerWithEmailAndPassword(username, password);
                  // register function automatically sends user details down stream
                  // hence login will also happen automatically
                  if (result == null) {
                    setState(() {
                      error = 'invalid email password combination';
                      loading = false;
                    });
                  }
                }
              }, 
              child: Text('Sign Up'),
            ),
            SizedBox(height: 20,),
            Text(error, style: TextStyle(color: Colors.red,),),
          ],
        )),
      ),
    );
  }
}