import 'package:easy_converter/domain/currency.dart';
import 'package:easy_converter/resources/resources.dart';
import 'package:easy_converter/screen/select_currency/select_curriencies_model.dart';
import 'package:easy_converter/widgets/component/currency_card.dart';
import 'package:easy_converter/widgets/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../domain/selected_currencies.dart';

class SelectCurrenciesListWidget extends StatelessWidget {
  const SelectCurrenciesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SelectCurrenciesModel>(
      create: (context) => SelectCurrenciesModel(),
      child: const _CurrenciesWidgetBody(),
    );
  }
}

class _CurrenciesWidgetBody extends StatelessWidget {
  const _CurrenciesWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: GestureDetector(
        onTap: () {},
        child: DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          builder: (BuildContext context, ScrollController scrollController) => Container(
              decoration: BoxDecoration(
                color: AppColors.gray3,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const _Header(),
                  const _CurrencyList(),
                ],
              )),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray5,
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SvgPicture.asset(
              SvgsIcons.bottomSheetClose,
              height: 4,
              width: 32,
            ),
          ),
          _SearchInBar(),
        ],
      ),
    );
  }
}

class _SearchInBar extends StatelessWidget {
  const _SearchInBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SelectCurrenciesModel>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        decoration: const InputDecoration(
          fillColor: AppColors.gray3,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(Icons.search, color: AppColors.gray2),
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(fontSize: 16),
        ),
        onChanged: (value) {
          model.searchRequest = value;
        },
      ),
    );
  }
}

class _CurrencyList extends StatelessWidget {
  const _CurrencyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SelectCurrenciesModel>(context);

    return Expanded(
      child: ListView.separated(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.all(16),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: model.resultSearch().length,
        itemBuilder: (BuildContext context, int index) {
          bool selected = (SelectedCurrencies.selectedCurrencies.contains(model.resultSearch()[index].code));
          //FIXME избавиться от опционала
          Currency currencies = model.currencies[model.resultSearch()[index].code]!;
          return InkWell(
            onTap: () => model.selectCurrency(
              code: currencies.code,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                border: Border.all(
                  color: AppColors.blue1,
                  style: selected ? BorderStyle.solid : BorderStyle.none,
                ),
              ),
              child: CurrencyCard(
                index: index,
                isSelecteble: true,
                currency: model.resultSearch().elementAt(index),
                trailing:
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                   Expanded(child: Container(child: Text(currencies.title, maxLines: 2, textAlign: TextAlign.end,))),
                      selected ? SvgPicture.asset(SvgsIcons.selectedIcon) : SizedBox.shrink(),
                    ],
                  ),
                ),
              ),

          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 8);
        },
      ),
    );
  }
}
