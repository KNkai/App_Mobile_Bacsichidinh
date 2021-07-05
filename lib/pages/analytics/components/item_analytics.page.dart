import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_convert.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_theme_text.dart';
import 'package:flutter/material.dart';

class ItemAnalytics extends StatelessWidget {
  final String title;
  final num money;
  final Color colorMoney;

  const ItemAnalytics({
    Key? key,
    required this.title,
    this.money = 0,
    this.colorMoney = AppColor.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSize.kConstantPadding / 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.grey,
            ),
          ),
          SizedBox(width: AppSize.kConstantPadding * 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
            ],
          ),
          SizedBox(width: AppSize.kConstantPadding * 2),
          Flexible(child: Divider()),
          SizedBox(width: AppSize.kConstantPadding),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                appCurrency(money).split(' ')[0],
                style: TextStyle(color: colorMoney),
              ),
              Text(
                "vnd",
                style: TextStyle(fontSize: miniTitleSize),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
