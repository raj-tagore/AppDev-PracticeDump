// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:brew_crew/models/custombrew.dart';

class BrewTile extends StatelessWidget {

  final CustomBrew? brew;

  const BrewTile({super.key, required this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[brew!.strength],
          ),
          title: Text(brew!.name),
          subtitle: Text('Sugars: ${brew!.sugars}'),
        ),
      ),
    );
  }
}