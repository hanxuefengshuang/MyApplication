import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(FoucsTest());
}

class FoucsTest extends StatefulWidget {
  @override
  _FoucsTestState createState() => _FoucsTestState();
}

class _FoucsTestState extends State<FoucsTest> {

  TextEditingController controller1 =TextEditingController();
  TextEditingController controller2 =TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  String user='';
  String pwd='';
  @override
  void initState() {

    controller1.addListener(() {
      setState(() {
        user=controller1.text;
      });
    });
    controller2.addListener(() {
      setState(() {
        pwd=controller1.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("a"),),
        body: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: controller1,
                focusNode: focusNode1,
              ),
            TextField(
              controller: controller2,
              focusNode: focusNode2,
            ),
              RaisedButton(
                child: Text("change focus"),
                onPressed: (){
                  FocusScope.of(context).requestFocus(focusNode2);
                },
              ),
              RaisedButton(
                child: Text("lost focus"),
                onPressed: (){
                  focusNode1.unfocus();
                  focusNode2.unfocus();
                },
              ),
            ],
          ),
        ),
      ),

    );
  }
}
