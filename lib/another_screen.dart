import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pp/custom_app_bar.dart';

class AnotherScreen extends StatelessWidget {
  const AnotherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Another sceen',
          // color: Colors.amber,
          // backgroundColor: Colors.blue,
          // elevation: 4,
        ),
        drawer: Drawer(),
      ),
    );
  }
}
