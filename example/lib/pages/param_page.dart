import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nav_router/nav_router.dart';
import 'package:nav_router_example/pages/home_page.dart';
import 'package:oktoast/oktoast.dart';

class ParamPage extends StatefulWidget {
  const ParamPage({super.key});

  @override
  ParamPageState createState() => ParamPageState();
}

class ParamPageState extends State<ParamPage> {
  List<RouteModel> data = [
    RouteModel('Parameter jump', RouterType.cupertino),
    RouteModel('NavData jump', RouterType.cupertino),
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
        onPressed: () {
          if (item.name == 'Parameter jump') {
            routePush(const ReturnParamPage()).then((v) {
              showToast('I received::$v');
            });
          } else {
            routePush(ReturnParamPage(navData: (v) {
              showToast('I received::$v');
            }));
          }
        },
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
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              alignment: WrapAlignment.start,
              children: data.map(buildItem).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ReturnParamPage extends StatefulWidget {
  final NavData? navData;

  const ReturnParamPage({super.key, this.navData});

  @override
  ReturnParamPageState createState() => ReturnParamPageState();
}

class ReturnParamPageState extends State<ReturnParamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'param Page',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xfff9dc71),
        elevation: 0,
        leading: InkWell(
          child: const Icon(CupertinoIcons.back, color: Colors.black),
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: const Color(0xfff9dc71),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: SizedBox(
          width: (MediaQuery.of(context).size.width - 50) / 2,
          child: TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 50.0)),

              ///背景色
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xfff7c672)),

              ///水波纹
              overlayColor: MaterialStateProperty.all(const Color(0xfff4b050)),
            ),
            onPressed: () {
              if (widget.navData != null) {
                widget.navData!('NavData mode parameter transmission');
                pop();
              } else {
                pop('This is the parameter');
              }
            },
            child: const Text(
              'Return with parameters',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
