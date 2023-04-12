import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:nav_router_example/pages/route_stack/page_a.dart';

class RouteStackPage extends StatefulWidget {
  const RouteStackPage({super.key});

  @override
  State<RouteStackPage> createState() => _RouteStackPageState();
}

class _RouteStackPageState extends State<RouteStackPage> {
  List<String> data = [
    'routePush',
    'routePushName',
    'pushAndRemoveUntil',
    'pushNamedAndRemoveUntil',
    'pushReplacement',
    'pushReplacementNamed',
    'pop',
    'popAndPushNamed',
    'popToPage',
    'popToRootPage',
    'popUntil',
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
            children: data
                .map((e) =>
                    RouteStackItem(onTap: () => onItemClicked(e), text: e))
                .toList(),
          ),
        ),
      ),
    );
  }

  ///item点击事件
  void onItemClicked(String name) {
    routePush(PageA(routeName: name));
  }
}

class RouteStackItem extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const RouteStackItem({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 50) / 2,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 50.0)),
          backgroundColor: MaterialStateProperty.all(const Color(0xfff7c672)),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
