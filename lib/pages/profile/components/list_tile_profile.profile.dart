import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:flutter/material.dart';

class ListTileProfile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onClick;
  const ListTileProfile({
    Key? key,
    required this.icon,
    required this.title,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppSize.kConstantPadding),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
            ),
            const SizedBox(
              width: AppSize.kConstantPadding,
            ),
            Text(title),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 17,
            ),
          ],
        ),
      ),
    );
  }
}
