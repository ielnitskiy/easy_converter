import 'package:easy_converter/domain/currency.dart';
import 'package:easy_converter/screen/view_currency/view_currencies_model.dart';
import 'package:easy_converter/widgets/util/const.dart';
import 'package:easy_converter/widgets/util/size_config.dart';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrencyCard extends StatelessWidget {
  final Currency currency;
  final Widget? trailing;
  final Key? key;
  final bool isSelecteble;
  final int? index;
  final ViewCurrenciesModel? model;

  CurrencyCard({
    required this.currency,
    this.trailing,
    this.key,
    this.isSelecteble = false,
    this.index,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.gray5,
      ),
      height: 72,
      child: Slidable(
        enabled: isSelecteble,
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              SvgPicture.asset(
                currency.flag,
                width: 40.0,
                height: 40.0,
              ),
              SizedBox(
                width: getProportionateScreenWidth(8),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              currency.code,
                              style: AppFontStyle.boldTextStyle.copyWith(
                                fontSize: AppFontStyle.size16,
                              ),
                              maxLines: 1,
                            ),
                            isSelecteble
                                ? Text(
                                    currency.country,
                                    style: AppFontStyle.lightTextStyle.copyWith(
                                      fontSize: AppFontStyle.size14,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  )
                                : SizedBox.shrink()
                          ],
                        ),
                      ),
                    Expanded(
                      flex: 2,
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
