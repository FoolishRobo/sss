import 'package:flutter/material.dart';
import 'package:sss/Model/databaseServices.dart';

class MapPageVM extends ChangeNotifier{

  bool isFetchingCam = false;
  List userNameCam;
  List userDetails;
  List userNameFChar = [];
  updateCamOne() async{
    isFetchingCam = true;
    notifyListeners();
    print("indise updateCam");
    test().then((onValue){
      userNameCam = onValue;
      print("lsit = ");
      print(userNameCam);
      test2(userNameCam).then((onValue){
        userDetails = onValue;
        print(userDetails);
        getFirstCharOfPerson(userDetails);
      });
    });



    print("Done");

  }

  getFirstCharOfPerson(List list){
    String data;
    //print("FirstChar");
    //print(list);
    userNameFChar = [];
    for(int i=0;i<list.length;i++){
      //print("Adding ${list[i][0]}");
      data = list[i][0];
      userNameFChar.add(data[0]);
    }
    print(userNameFChar);
    isFetchingCam = false;
    notifyListeners();
  }


}