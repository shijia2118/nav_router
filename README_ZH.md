Language: [English](README.md) | [中文简体](README_ZH.md)

# nav_router_fork
    该插件是在nav_router的基础上进行了更新，本人用了3年，在10多个项目中使用过该插件。我感觉是flutter相关路由插件中，最简单/轻量/便捷的路由管理方案。
支持各种路由动画，跳转/传参起来非常方便。
    由于原作者已经不维护，所以本人fork后，并进行了更新和维护，以免浪费了一个好的路由库。

# Log
* 2023.04.11 - Adapt Flutter3.7.9 and fix some known issues.

# 特点
* 无需使用context
* 使用超简单
* 传参超方便
* 支持各种跳转动画


## 开始使用

### 添加依赖
```yaml
dependencies:
  nav_router: ^2.0.0
```

然后使用`flutter packages upgrade`来更新flutter的插件包

# 示例项目
example中包含了各种跳转的动画效果，但未包含插件的所有特性。如果希望有更多了解，可以继续看下面的内容。

# 配置
*  1.在`MaterialApp`的页面先导入我们的插件
```dart
import 'package:nav_router/nav_router.dart';
```
*  2.在`MaterialApp`的`navigatorKey`属性写上`navGK`值.如果需要使用命名路由，可以给`routes`属性配置一个路由Map.
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
# 使用方式
## 一、参数传递
### 方式1:
正常push新页面，但是在后面加上Then，后面的v就是我们跳转之后的页面带回来的数据，然后我们给它打印出来。
```dart
routePush(NewPage()).then((v) {
  print('I received::$v');
});
```
那么我们新页面就要pop返回值了，直接在pop然后括号里加上我们的参数，可以是任何类型的参数值，之后上面写的东西就能接收到我们这次返回并带过去的参数了。
```dart
FlatButton(
  onPressed: () {
    pop('This is the parameter');
  },
  child: Text('Return with parameters'),
),
```

### 方式2：
方式二可以用我们的NavData，先在我们要push到的页面添加NavData类型的参数接收,
```dart
class NewPage extends StatlessWidget {
  final NavData navData;

  NewPage({this.navData});
}
```
然后下面就判断这个navData是否为空，也就是上级是否有接收这个方法，如果有的话就带参数返回。
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
那么我们push的那个地方就可以用navData来接收值并且打印出来了。
```dart
routePush(NewPage(navData: (v) {
    print('I received::$v');
  }),
);
```

## 二、页面跳转
* 从A页面跳转到B页面：
```
routePush(PageB());
```

* 跳转到指定页面，同时移除当前页面:
```
pushReplacement(const PageB());
```

* 跳转到指定页面，同时移除其它所有页面:
```
pushAndRemoveUntil(const PageB());
```
* 返回上一页:
```
pop();
```
* 返回到指定页面:
```
popToPage(const PageB());
```
* 返回到根页面:
```
popToRootPage();
```



### 相应的命名路由:

* 从A页面跳转到B页面:
```
routePushName(const NewPage().toStringShort());
```

* 跳转到指定页面，同时移除当前页面：
```
pushReplacementNamed(const PageB().toStringShort());
```

* 跳转到指定页面，同时移除其它所有页面:
```
pushNamedAndRemoveUntil(const PageB().toStringShort());
```
* 移除当前页面，同时跳转到指定页面，类似pushReplacement:
```
popAndPushNamed(const PageB().toStringShort());
```
* 跳转到指定页面，同时移除其它所有页面:
```
popUntil(ModalRoute.withName('\'));
```








# 效果图 [图片不能显示点我](http://img.flutterj.com/nav_router/)
|![1.gif](git/1.gif)| ![2.gif](git/2.gif) | ![3.gif](git/3.gif)|
| --- | --- | --- |
|![4.gif](git/4.gif)| ![5.gif](git/5.gif) | ![6.gif](git/6.gif)|
|![7.gif](git/7.gif)| ![8.gif](git/8.gif) | ![9.gif](git/9.gif)|
|![10.gif](git/10.gif)| ![11.gif](git/11.gif) | ![12.gif](git/12.gif)|

# Flutter微信群

<img src="git/left_group.png" height="200" width="210" style="zoom:30%;" />

[上图无法显示点我](http://www.flutterj.com/left_group.png)

Flutter教程网：www.flutterj.com

Flutter交流QQ群：[874592746](https://jq.qq.com/?_wv=1027&k=5coTYqE)

# 公众号
<img src="git/public.jpg" height="200" width="200" style="zoom:30%;" />

关注公众号“`Flutter前线`”，各种Flutter项目实战经验技巧，干活知识，Flutter面试题答案，等你来领取。

# 贡献者

<img src="git/circle-cropped.png" height="150" width="150" style="zoom:30%;" />

### LICENSE
```
fluttercandies/nav_router is licensed under the
Apache License 2.0

A permissive license whose main conditions require preservation of copyright and license notices. 
Contributors provide an express grant of patent rights. 
Licensed works, modifications, and larger works may be distributed under different terms and without source code.
```
