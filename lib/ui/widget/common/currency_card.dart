import 'package:cur_val/ui/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/selected_currencies.dart';
import '../../../utils/size_config.dart';

class CurrencyCard extends StatelessWidget {
  final String flag;
  final String code;
  final String country;
  final Widget? trailing;
  final Key? key;

  CurrencyCard({
    this.trailing,
    required this.flag,
    required this.code,
    required this.country,
    this.key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedCurrencies = SelectedCurrencies.selectedCurrencies;
    SizeConfig().init(context);
    return Container(
      // color: Colors.black,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFFFFFFF),
        // color: Colors.black,
      ),
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      width: getProportionateScreenWidth(300),
      height: getProportionateScreenHeight(82),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21),
        child: Row(
          children: [
            SvgPicture.asset(
              flag,
              width: 40.0,
              height: 40.0,
            ),
            SizedBox(
              width: getProportionateScreenWidth(12),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    // flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(18)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            code,
                            style: AppFontStyle.boldTextStyle.copyWith(
                              fontSize: AppFontStyle.size16,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            country,
                            style: AppFontStyle.lightTextStyle.copyWith(
                              fontSize: AppFontStyle.size14,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    // flex: 8,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(5)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              child: trailing,
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}