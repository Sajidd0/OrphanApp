
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testproject1/bar.dart';
import 'package:testproject1/Data.dart';
import 'package:testproject1/Entry.dart';
void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp1(),
  ));
}


class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.red[900],
        elevation: 0.0,
      ),
      resizeToAvoidBottomInset: false,
        body: SingleChildScrollView( scrollDirection: Axis.vertical,
          //physics: NeverScrollableScrollPhysics(),
          child: Column(
            children:<Widget>[
              Container(
                width:MediaQuery. of(context). size. width,
                height:MediaQuery. of(context). size. height *20/100,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.zero,topRight: Radius.zero,bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                    color: Colors.red[900]
                ),
                child:  const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Welcome to Orphan's ""Data Keeping App", style: TextStyle(fontSize: 30.00,fontWeight: FontWeight.bold,color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: bar1(),
              ),

              //Entry()
              //data()
            ]

          ),
        ),

    );
  }
}

