import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';

import 'page_c.dart';

class PageB extends StatelessWidget {
  final String routeName;
  const PageB({
    super.key,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('页面B')),
      body: Center(
        child: TextButton(onPressed: onPressed, child: const Text('to Page C')),
      ),
    );
  }

  /// 点击事件
  void onPressed() {
    routePush(PageC(routeName: routeName));
  }
}
