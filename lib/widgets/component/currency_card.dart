import 'package:easy_converter/domain/currency.dart';
import 'package:easy_converter/widgets/util/const.dart';
import 'package:easy_converter/widgets/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrencyCard<T> extends StatelessWidget {
  final Currency currency;
  final Widget? trailing;
  final Key? key;
  final bool isSelecteble;
  final int index;

  CurrencyCard({
    required this.currency,
    this.trailing,
    this.key,
    this.isSelecteble = false,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).backgroundColor,
      ),
      height: 72,
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
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                        isSelecteble
                            ? Text(
                                currency.country,
                                style: Theme.of(context).textTheme.labelMedium,
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
    );
  }
}
