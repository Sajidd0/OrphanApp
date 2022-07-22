
import 'package:flutter/material.dart';
import 'package:testproject1/Adoption.dart';
import 'package:testproject1/AdoptionData.dart';
import 'package:testproject1/Entry.dart';
import 'package:testproject1/Data.dart';
class bar1 extends StatefulWidget {
  //const bar1({Key? key}) : super(key: key);

  @override
  State<bar1> createState() => _bar1State();
}

class _bar1State extends State<bar1> with TickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    TabController _tabContainer=TabController(length: 4, vsync: this);
    return Column(
      children: [Container(
        child: TabBar(
          indicatorColor: Colors.red[900],
          controller: _tabContainer,
            labelColor: Colors.red[900],
            unselectedLabelColor: Colors.black,
          tabs:const [
            Tab(text: "Entry"),
            Tab(text: "Child Data"),
            Tab(text: "Adoption"),
            Tab(text: "Adoption Data"),
          ]
        ),
      ),
        Container(
          width: double.maxFinite,
      height: MediaQuery. of(context). size. height,
      child: TabBarView(
        controller: _tabContainer,
        children: [
          Entry(),
          data(),
          const Adoption(),
          const AdoptionData(),
        ],
      ),
    )],
    );

  }
}