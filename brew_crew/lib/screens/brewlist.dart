
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/custombrew.dart';
import 'package:brew_crew/shared/brewtile.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {

    final brewTable = Provider.of<List<CustomBrew>?>(context);

    // List brewTableDocs = brewTable.docs;
    // // brewTable.docs is a list of JsonQueryDocumentSnapshots

    // print(brewTableDocs[0]['name']);
    // // printing out the name of the first entry in brewTableDocs

    // brewTable?.forEach((element) {
    //   print(element.name);
    //   print(element.strength.toString());
    //   print(element.sugars);
    //  });
    
    return ListView.builder(
      itemCount: brewTable?.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: brewTable?[index]);
      }
    );
  }
}