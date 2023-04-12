import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_router_example/pages/main_page.dart';
import 'package:nav_router_example/pages/route_stack/page_d.dart';
import 'package:oktoast/oktoast.dart';
import 'package:nav_router/nav_router.dart';

import 'pages/route_stack/page_a.dart';

void main() {
  runApp(const MyApp());
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light, //白色图标
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
      SystemUiOverlay.top,
    ],
  ); //隐藏底部按钮栏
}

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
        routes: {
          'PageA': (context) => const PageA(routeName: '/'),
          'PageD': (context) => const PageD(routeName: '/'),
        },
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: const Color(0xfff9dc71),
        ),
        home: const MainPage(),
      ),
    );
  }
}
