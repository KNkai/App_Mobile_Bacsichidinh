import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_theme_text.dart';
import 'package:flutter/material.dart';

class AppTable extends StatelessWidget {
  final String title;
  final Widget action;
  final List<Widget> listItem;
  const AppTable({
    Key? key,
    required this.title,
    required this.action,
    required this.listItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.kConstantPadding),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title),
                action,
              ],
            ),
          ),
          Divider(),
          for (var item in listItem) item
        ],
      ),
    );
  }
}

class ItemTableUser extends StatelessWidget {
  final String name, address;
  const ItemTableUser({
    Key? key,
    required this.name,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSize.kConstantPadding / 2),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: AppColor.boldGrey,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.add_circle,
            color: AppColor.primary,
          ),
          const SizedBox(width: AppSize.kConstantPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Container(
                  child: Text(
                    address,
                    style: TextStyle(fontSize: miniTitleSize),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
