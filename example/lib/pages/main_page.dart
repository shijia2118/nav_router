import 'package:flutter/material.dart';
import 'package:nav_router_example/pages/route_animation/route_animation_page.dart';
import 'package:nav_router_example/pages/route_stack/route_stack_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  PageController pageController = PageController();
  int select = 0;

  List<Widget> pages = <Widget>[
    const RouteAnimationPage(),
    const RouteStackPage(),
  ];

  List<BottomNavigationBarItem> getNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Container(),
        label: '动画',
      ),
      BottomNavigationBarItem(
        icon: Container(),
        label: '栈',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4b050),
      body: PageView.builder(
        controller: pageController,
        itemBuilder: (ctx, index) => pages[index],
        itemCount: pages.length,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() => select = index);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: getNavBarItems(),
        currentIndex: select,
        onTap: (index) async {
          pageController.jumpToPage(index);
        },
      ),
    );
  }
}
