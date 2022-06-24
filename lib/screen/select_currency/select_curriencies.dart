import 'package:easy_converter/screen/select_currency/select_curriencies_model.dart';
import 'package:easy_converter/widgets/component/currency_card.dart';
import 'package:easy_converter/widgets/util/const.dart';
import 'package:flutter/material.dart';
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
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const _SearchInBar(),
                  const _CurrencyList(),
                ],
              )),
        ),
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
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        suffixIcon: Icon(Icons.search, color: AppColors.gray2),
        hintText: 'Search',
      ),
      onChanged: (value) {
        model.searchRequest = value;
      },
    );
  }
}

class _CurrencyList extends StatelessWidget {
  const _CurrencyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SelectCurrenciesModel>(context);

    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: model.resultSearch().length,
        itemBuilder: (BuildContext context, int index) {
          return CurrencyCard(
            currency: model.resultSearch().elementAt(index),
            trailing: IconButton(
              padding: EdgeInsets.all(0),
              alignment: Alignment.centerRight,
              icon: (SelectedCurrencies.selectedCurrencies.contains(model.resultSearch()[index].code))
                  ? const Icon(
                      Icons.check_circle_outline,
                      color: AppColors.blue1,
                    )
                  : const Icon(
                      Icons.brightness_1_outlined,
                      color: AppColors.blue1,
                    ),
              onPressed: () => model.selectCurrency(
                //FIXME избавиться от опционала
                code: model.currencies[model.resultSearch()[index].code]!.code,
              ),
            ),
          );
        },
      ),
    );
  }
}
