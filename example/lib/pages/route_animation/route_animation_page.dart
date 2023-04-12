import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:nav_router_example/pages/route_animation/next_page.dart';

class RouteAnimationPage extends StatefulWidget {
  const RouteAnimationPage({super.key});

  @override
  State<RouteAnimationPage> createState() => _RouteAnimationPageState();
}

class _RouteAnimationPageState extends State<RouteAnimationPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4b050),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.start,
            children: data.map(buildItem).toList(),
          ),
        ),
      ),
    );
  }

  Widget buildItem(RouteModel item) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 50) / 2,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 50.0)),
          backgroundColor: MaterialStateProperty.all(const Color(0xfff7c672)),
        ),
        onPressed: () {
          routePush(const NextPage(), item.type);
        },
        child: Text(
          item.name,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class RouteModel {
  String name;
  RouterType type;

  RouteModel(this.name, this.type);
}
