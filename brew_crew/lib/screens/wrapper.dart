// ignore_for_file: prefer_const_constructors

import 'package:brew_crew/screens/authenticate.dart';
import 'package:brew_crew/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/customuser.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final userData = Provider.of<CustomUser?>(context);

    if (userData == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
} 