import 'package:brew_crew/screens/brewlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/models/custombrew.dart';
import 'package:flutter/material.dart';

class DB {

  final String? uid;
  DB({this.uid});

  // collection references, collection = table, document = element/row
  final CollectionReference brewCollectionInstance = FirebaseFirestore.instance.collection('Brew Preferences');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollectionInstance.doc(uid).set({
      'sugar': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // stream to notify us about any document changes in the firebase database
  // every bit of data that comes down the stream is a snapshot of the table changed
  // snapshot = instance of collection, snapshots: runs everytime there is a change to the collection
  Stream<List<CustomBrew>?> get brewStream {
    return brewCollectionInstance.snapshots().map(_brewListFromSnapshot);
  }

  // create a list of brew preferences from the snapshot
  List<CustomBrew>? _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return CustomBrew(
        name: doc['name'], 
        strength: doc['strength'], 
        sugars: doc['sugar']);
    }).toList();
  }
}