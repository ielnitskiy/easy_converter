import 'package:cur_val/ui/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/selected_currencies.dart';
import '../../../utils/size_config.dart';

class CurrencyCard extends StatelessWidget {
  final String flag;
  final String code;
  final String country;
  final Widget? trailing;
  final Key? key;
   bool isSlidable;

   CurrencyCard({
    this.trailing,
    required this.flag,
    required this.code,
    required this.country,
    this.key,
    this.isSlidable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
        // color: Colors.black,
      ),
      margin: const EdgeInsets.symmetric(vertical: 4),
      width: getProportionateScreenWidth(300),
      height: getProportionateScreenHeight(82),
      child: Slidable(
        enabled: isSlidable,
        endActionPane: ActionPane(
          motion:  DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
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
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              country,
                              style: AppFontStyle.lightTextStyle.copyWith(
                                fontSize: AppFontStyle.size14,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(5)),
                        child: SizedBox(
                          child: trailing,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
