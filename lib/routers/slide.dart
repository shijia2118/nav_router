import 'package:flutter/material.dart';

/// [Route animation effect]
/// Swipe right to route the jump animation.
///
class SlideRoute extends PageRouteBuilder {
  final Widget page;
  final Alignment? alignment;

  SlideRoute({required this.page, this.alignment})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                page,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              Offset offset = const Offset(-1, 0);
              if (alignment == Alignment.bottomCenter) {
                offset = const Offset(0, 1);
              }

              return SlideTransition(
                position: Tween<Offset>(
                  begin: offset,
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            });
}
