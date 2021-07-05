import 'package:flutter/material.dart';

class AppDelay extends StatelessWidget {
  final Widget? child;
  final Widget? starter;
  AppDelay({@required this.child, @required this.starter});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(milliseconds: 300), () => true),
        builder: (_, snapshot) {
          print(snapshot.data);
          if (snapshot.data == null) return starter!;

          return child!;
        });
  }
}
