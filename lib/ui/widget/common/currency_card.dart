import 'package:cur_val/ui/util/const.dart';
import 'package:cur_val/ui/widget/view_currency_list/view_currencies_list_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/size_config.dart';

class CurrencyCard extends StatelessWidget {
  final String flag;
  final String code;
  final String country;
  final Widget? trailing;
  final Key? key;
  bool isSlidable;
  final int? index;
  final ViewCurrenciesListWidgetModel? model;

  CurrencyCard({
    this.trailing,
    required this.flag,
    required this.code,
    required this.country,
    this.key,
    this.isSlidable = false, this.index, this.model,
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
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              flex: 13,
              onPressed: (context) => model!.deleteCurrency(index: index!),
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            Expanded(
              child: Container(
// height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  color: Color(0xFFFE4A49),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
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
