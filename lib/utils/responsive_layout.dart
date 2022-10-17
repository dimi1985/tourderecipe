import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget largeScreen;

  final Widget? smallScreen;

  const ResponsiveLayout({
    Key? key,
    required this.largeScreen,
    this.smallScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 700;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
