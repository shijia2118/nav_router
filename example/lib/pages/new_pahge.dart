import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  NewPageState createState() => NewPageState();
}

class NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'new Page',
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
        child: const Text(
          'This is the new page',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }
}
