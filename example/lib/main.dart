import 'package:flutter/material.dart';
import 'package:nav_router_example/pages/home_page.dart';
import 'package:nav_router_example/pages/new_pahge.dart';
import 'package:oktoast/oktoast.dart';
import 'package:nav_router/nav_router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      backgroundColor: const Color(0xFF3A3A3A),
      position: ToastPosition.center,
      radius: 8,
      textPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: MaterialApp(
        title: 'NavRoute',
        navigatorKey: navGK,
        routes: {'new': (context) => const NewPage()},
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: const Color(0xfff9dc71),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
