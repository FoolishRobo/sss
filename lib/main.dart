import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sss/ViewModel/mapPageVM.dart';
import 'View/mapPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => MapPageVM(),
        child: Consumer<MapPageVM>(
          builder: (BuildContext context, mappageVm, _){
            return MyHomePage(title: "Society Serveillance System",);
          },
        ),
      )
    );
  }
}