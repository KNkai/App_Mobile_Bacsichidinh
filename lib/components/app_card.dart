import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final double borderRadius;
  final double padding;
  final Widget child;
  const AppCard({
    Key? key,
    required this.child,
    this.borderRadius = 20,
    this.padding = AppSize.kConstantPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: child,
      ),
    );
  }
}
