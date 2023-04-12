import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:nav_router_example/pages/route_stack/page_b.dart';

class PageA extends StatelessWidget {
  final String routeName;
  const PageA({
    super.key,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('页面A')),
      body: Center(
        child: TextButton(onPressed: onPressed, child: const Text('to Page B')),
      ),
    );
  }

  /// 点击事件
  void onPressed() {
    routePush(PageB(routeName: routeName));
  }
}
