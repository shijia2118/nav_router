Language: [English](README.md) | [中文简体](README_ZH.md)


# nav_router

This plug-in is an update to the nav_router, and I've had it for three years and have used it on more than 10 projects. I feel that this is the simplest/lightweight/convenient routing management solution in the flutter related routing plugin.
Support a variety of route animation, jump/parameter up very convenient.
Since the original author has not maintained, so I fork, and carried out the update and maintenance, so as not to waste a good routing library.

# Log
* 2023.04.11 - Adapt Flutter3.7.9 and fix some known issues.

# Features
* You don't need to use context
* Super easy to use
* Easy to pass parameters
* Supports a variety of jump animations

## Getting started

### Add dependency
```yaml
dependencies:
  nav_router: ^2.0.0
```

Then use `flutter packages upgrade` to update flutter plugin packages

# Sample project

The example contains animation effects for various jumps, but not all of the plug-in's features. If you'd like to learn more, you can read on below.

# Setting up
*  1.Import our plugin on the page of `MaterialApp`
```dart
import 'package:nav_router/nav_router.dart';
```
*  2.Write `navGK` value in` navigatorKey` property of `MaterialApp`.If you need to use named routes, you can configure a route Map on the `routes` property.
```dart
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '',
      navigatorKey: navGK,
      routes: {
                'HomePage': (context) => const HomePage()
              },
    );
  }
```
# Mode of use
## 1、Parameter passing
### Way 1：

Normally push the new page, but add Then at the back, the v behind is the data brought back by the page after we jump, and then we print it out.
```dart
routePush(NewPage()).then((v) {
  print('I received::$v');
});
```
Then our new page will pop the return value. Add our parameters directly in the pop and then the brackets. It can be any type of parameter value. After that, what we wrote above will receive the parameters we returned this time with the past.
```dart
FlatButton(
  onPressed: () {
    pop('This is the parameter');
  },
  child: Text('Return with parameters'),
),
```

### Way 2：
Method two can use our NavData, first add the NavData type parameter to the page we want to push to,
```dart
class NewPage extends StatlessWidget {
  final NavData navData;

  NewPage({this.navData});
}
```
Then the following judges whether the navData is empty, that is, whether the superior has received this method, and if so, returns it with parameters.
```dart
FlatButton(
  onPressed: () {
    if(navData == null) return;
    widget.navData('NavData mode parameter transmission');
    pop();
  },
  child: Text('Return with parameters'),
),
```
Then the place where we push can use navData to receive the value and print it out.
```dart
routePush(NewPage(navData: (v) {
    print('I received::$v');
  }),
);
```
## 2.Page jump
* Switch from page A to page B：
```
routePush(PageB());
```

* The specified page is displayed and the current page is removed:
```
pushReplacement(const PageB());
```

* Jump to the specified page and remove all other pages:
```
pushAndRemoveUntil(const PageB());
```
* Return to previous page:
```
pop();
```
* Return to the specified page:
```
popToPage(const PageB());
```
* Return to the root page:
```
popToRootPage();
```



### The corresponding named route:

* Switch from page A to page B:
```
routePushName(const NewPage().toStringShort());
```

* The specified page is displayed and the current page is removed：
```
pushReplacementNamed(const PageB().toStringShort());
```

* Jump to the specified page and remove all other pages:
```
pushNamedAndRemoveUntil(const PageB().toStringShort());
```
* Remove the current page and go to the specified page, similar to pushReplacement:
```
popAndPushNamed(const PageB().toStringShort());
```
* Jump to the specified page and remove all other pages:
```
popUntil(ModalRoute.withName('\'));
```





# Effect map [图片不能显示点我](http://img.flutterj.com/nav_router/)
|![1.gif](git/1.gif)| ![2.gif](git/2.gif) | ![3.gif](git/3.gif)|
| --- | --- | --- |
|![4.gif](git/4.gif)| ![5.gif](git/5.gif) | ![6.gif](git/6.gif)|
|![7.gif](git/7.gif)| ![8.gif](git/8.gif) | ![9.gif](git/9.gif)|
|![10.gif](git/10.gif)| ![11.gif](git/11.gif) | ![12.gif](git/12.gif)|

# Flutter WeChat group

<img src="git/left_group.png" height="200" width="200" style="zoom:30%;" />

[Above can't show my point](git/left_group.png)

FlutterJ：www.flutterj.com

# Contributor

* author: crazyQ1 [https://github.com/ahyangnb](https://github.com/ahyangnb)
* migrator: dwikyhardi [github.com/dwikyhardi](github.com/dwikyhardi)

### LICENSE
```
fluttercandies/nav_router is licensed under the
Apache License 2.0

A permissive license whose main conditions require preservation of copyright and license notices. 
Contributors provide an express grant of patent rights. 
Licensed works, modifications, and larger works may be distributed under different terms and without source code.
```
