import 'package:flutter/material.dart';

class PageD extends StatelessWidget {
  final String routeName;
  const PageD({
    super.key,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    String text = '页面D';
    return Scaffold(
      appBar: AppBar(title: const Text('页面D')),
      body: Center(
        child: Text(text),
      ),
    );
  }
}
