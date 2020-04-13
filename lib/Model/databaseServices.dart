import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sss/ViewModel/mapPageVM.dart';


Future<List> test() async {
  List data;
  //print("indise test");
  final _firestore = Firestore.instance;
  //print("indise getCamOneList stream");
  await _firestore
      .collection("Camera One")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((f) {
      //print(f.data["Details"]);
      data = f.data["Details"];
    });
  });
  return data;
}

Future<List> test2(List uIDs) async {
  //print("indise test2222222222222");
  //print("recieved list = $uIDs");
  List userDetails = [];
  List data;
  final _firestore = Firestore.instance;

  await _firestore
      .collection("UserDetails")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((f) {
      if(uIDs != null) {
        if (uIDs.contains(f.data["Details"][6])) {
          //print(f.data["Details"]);
          data = f.data["Details"];
          userDetails.add(data);
        }
      }
    });
  });
  //print(userDetails);
  return userDetails;
}

class userDataType {
  String name;
  String sex;
  String age;
  String add;
  String phno;
  String bg;

  userDataType(this.name, this.sex, this.age, this.add, this.phno, this.bg);
}
