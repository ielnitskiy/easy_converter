import 'package:cur_val/screen/select_currency/select_curriencies_model.dart';
import 'package:cur_val/widgets/component/currency_card.dart';
import 'package:cur_val/widgets/util/const.dart';
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
    return Scaffold(
      backgroundColor: Color(0xFFF5F8FE),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const _SearchInBar(),
      ),
      body: const _CurrencyList(),
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
        suffixIcon: Icon(Icons.search, color: AppColors.gray),
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

    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
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
                        color: AppColors.black,
                      )
                    : const Icon(
                        Icons.brightness_1_outlined,
                        color: AppColors.gray,
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
