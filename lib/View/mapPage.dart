import 'dart:math';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:sss/ViewModel/mapPageVM.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MapPageVM>(
      builder: (BuildContext context, mappageVM, _) {
        if (mappageVM.userNameCam == null && mappageVM.isFetchingCam == false) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            mappageVM.updateCamOne();
          });
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: InkWell(
                  onTap: () {
                    mappageVM.updateCamOne();
                  },
                  child: Icon(Icons.refresh),
                ),
              ),
            ],
          ),
          body: Center(
            child: Stack(
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'map/map.jpg',
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width / 2.1,
                  child: Column(
                    children: <Widget>[
                      Transform.rotate(
                        angle: 90 * pi / 180,
                        child: Icon(
                          Icons.videocam,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width / 2.5,
                  top: 40,
                  child: Center(
                    child: Wrap(
                      spacing: 4.0,
                      children: List.generate(mappageVM.userNameFChar.length,
                          (index) {
                        return InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext contxt){
                                return AlertDialog(
                                  title: Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 12,
                                        child: Text(mappageVM.userNameFChar[index]),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(mappageVM.userDetails[index][0]),
                                    ],
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Gender:  ${mappageVM.userDetails[index][1]}"),
                                      Text("Age:  ${mappageVM.userDetails[index][2]}"),
                                      Text("Address:  ${mappageVM.userDetails[index][3]}"),
                                      Text("Phone Number:  ${mappageVM.userDetails[index][4]}"),
                                      Text("Blood Group:  ${mappageVM.userDetails[index][5]}"),
                                    ],
                                  ),
                                );
                              }
                            );
                          },
                          child: CircleAvatar(
                            radius: 12,
                            child: Text(mappageVM.userNameFChar[index]),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: MediaQuery.of(context).size.width / 2.1,
                  child: Transform.rotate(
                    angle: 270 * pi / 180,
                    child: Icon(
                      Icons.videocam,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
