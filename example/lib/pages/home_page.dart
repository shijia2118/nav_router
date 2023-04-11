import 'dart:ui';

import 'package:nav_router/nav_router.dart';
import 'package:flutter/material.dart';
import 'package:nav_router_example/pages/new_pahge.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<RouteModel> data = [
    RouteModel('material', RouterType.material),
    RouteModel('cupertino', RouterType.cupertino),
    RouteModel('size', RouterType.size),
    RouteModel('fade', RouterType.fade),
    RouteModel('scale', RouterType.scale),
    RouteModel('scaleBottomRight', RouterType.scaleBottomRight),
    RouteModel('scaleTopLeft', RouterType.scaleTopLeft),
    RouteModel('slide', RouterType.slide),
    RouteModel('rotation', RouterType.rotation),
    RouteModel('scaleRotate', RouterType.scaleRotate),
  ];

  Widget buildItem(RouteModel item) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 50) / 2,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 50.0)),

          ///背景色
          backgroundColor: MaterialStateProperty.all(const Color(0xfff7c672)),
        ),
        onPressed: () => routePush(const NewPage(), item.type),
        child: Text(
          item.name,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4b050),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: MediaQueryData.fromWindow(window).padding.top * 2),
          const Text(
            'NavRoute',
            style: TextStyle(color: Colors.blueAccent, fontSize: 30.0),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  alignment: WrapAlignment.start,
                  children: data.map(buildItem).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RouteModel {
  String name;
  RouterType type;

  RouteModel(this.name, this.type);
}
