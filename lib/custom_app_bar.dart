import 'dart:io' show Platform;

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? color;
  final Color? backgroundColor;
  final double? fontSize;
  final double? height;
  final double? elevation;
  const CustomAppBar({
    super.key,
    required this.title,
    this.color,
    this.fontSize,
    this.height,
    this.backgroundColor,
    this.elevation,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 0,
      child: Container(
        padding: const EdgeInsets.all(25),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Navigator.of(context).canPop()
                ? InkWell(
                    onTap: Navigator.of(context).pop,
                    child: Icon(
                      Platform.isIOS
                          ? Icons.arrow_back_ios_new
                          : Icons.arrow_back,
                      color: color,
                    ),
                  )
                : const SizedBox.shrink(),
            const Spacer(),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: fontSize ?? 24, color: color),
            ),
            const Spacer(),
            Scaffold.of(context).hasDrawer
                ? InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Icon(
                      Icons.menu,
                      color: color,
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height,
      height ?? 100);
}
