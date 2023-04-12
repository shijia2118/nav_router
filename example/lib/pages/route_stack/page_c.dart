import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:nav_router_example/pages/route_stack/page_a.dart';
import 'package:nav_router_example/pages/route_stack/page_d.dart';

class PageC extends StatelessWidget {
  final String routeName;
  const PageC({
    super.key,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    String effect = '';
    switch (routeName) {
      case 'routePush':
        effect = '从页面C跳转到页面D';
        break;
      case 'routePushName':
        effect = 'routePush的命名路由,须在【main】中注册';
        break;
      case 'pushAndRemoveUntil':
        effect = '跳转到指定页面，同时移除其它所有页面';
        break;
      case 'pushNamedAndRemoveUntil':
        effect = 'pushAndRemoveUntil的命名路由,须在【main】中注册';
        break;
      case 'pushReplacement':
        effect = '跳转到指定页面，同时移除当前页面';
        break;
      case 'pushReplacementNamed':
        effect = 'pushReplacement的命名路由，须在【main】中注册';
        break;
      case 'pop':
        effect = '返回上一页';
        break;
      case 'popAndPushNamed':
        effect = '移除当前页面，同时跳转到指定页面，类似pushReplacement,须在【main】中注册';
        break;
      case 'popToPage':
        effect = '返回到指定页面';
        break;
      case 'popToRootPage':
        effect = '返回到根页面';
        break;
      case 'popUntil':
        effect = '返回到指定页面,可以理解为popToPage的命名路由，须在【main】中注册';
        break;
      default:
        break;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('页面C')),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('名称:$routeName'),
            Text('效果:$effect'),
            TextButton(
              onPressed: onPressed,
              child: const Text('点击跳转'),
            ),
          ],
        ),
      ),
    );
  }

  /// 点击事件
  void onPressed() {
    switch (routeName) {
      case 'routePush':
        routePush(PageD(routeName: routeName));
        break;
      case 'routePushName':
        routePushName(PageD(routeName: routeName).toStringShort());
        break;
      case 'pushAndRemoveUntil':
        pushAndRemoveUntil(PageD(routeName: routeName));
        break;
      case 'pushNamedAndRemoveUntil':
        pushNamedAndRemoveUntil(PageD(routeName: routeName).toStringShort());
        break;
      case 'pushReplacement':
        pushReplacement(PageD(routeName: routeName));
        break;
      case 'pushReplacementNamed':
        pushReplacementNamed(PageD(routeName: routeName).toStringShort());
        break;
      case 'pop':
        pop();
        break;
      case 'popAndPushNamed':
        popAndPushNamed(PageD(routeName: routeName).toStringShort());
        break;
      case 'popToPage':
        popToPage(PageA(routeName: routeName));
        break;
      case 'popToRootPage':
        popToRootPage();
        break;
      case 'popUntil':
        popUntil(
            ModalRoute.withName(PageA(routeName: routeName).toStringShort()));
        break;
      default:
        break;
    }
  }
}
