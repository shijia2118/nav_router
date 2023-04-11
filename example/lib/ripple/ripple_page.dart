import 'package:flutter/material.dart';

import 'package:nav_router/nav_router.dart';

class RipplePage extends StatefulWidget {
  const RipplePage({super.key});

  @override
  RipplePageState createState() => RipplePageState();
}

class RipplePageState extends State<RipplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: NavigateButton(
          nextScreen: RipplePage(),
          color: Colors.white,
          splashColor: Colors.green,
          iconColor: Colors.black,
          heroTag: 'blue',
          rangeFactor: 2.4,
        ),
      ),
    );
  }
}
