import 'package:cur_val/ui/util/const.dart';
import 'package:cur_val/ui/widget/common/currency_card_text_field.dart';
import 'package:flutter/material.dart';

import '../../../domain/selected_currencies.dart';
import '../common/currency_card.dart';
import 'currencies_widget_model.dart';

class CurrenciesListWidget extends StatefulWidget {
  const CurrenciesListWidget({Key? key}) : super(key: key);

  @override
  State<CurrenciesListWidget> createState() => _CurrenciesListWidgetState();
}

class _CurrenciesListWidgetState extends State<CurrenciesListWidget> {
  final _model = CurrenciesWidgetModel();

  @override
  Widget build(BuildContext context) {
    return CurrenciesWidgetModelProvider(
      model: _model,
      child: const _CurrenciesWidgetBody(),
    );
  }
}

class _CurrenciesWidgetBody extends StatefulWidget {
  const _CurrenciesWidgetBody({Key? key}) : super(key: key);

  @override
  State<_CurrenciesWidgetBody> createState() => _CurrenciesWidgetBodyState();
}

class _CurrenciesWidgetBodyState extends State<_CurrenciesWidgetBody> {
  bool isReorderLIst = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F8FE),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isReorderLIst = !isReorderLIst;
                  if (isReorderLIst) {
                    //  TODO обновить лист selectedCurrencies в hive
                  }
                });
              },
              icon: isReorderLIst
                  ? const Icon(
                      Icons.done_outlined,
                      color: Colors.black,
                    )
                  : const Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: _CurrencyList(isReorderList: isReorderLIst),
        floatingActionButton: isReorderLIst
            ? FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => Navigator.of(context).pushNamed('/select_currency').then((_) => setState(() {})),
                backgroundColor: AppColors.black,
              )
            : null);
  }
}

class _CurrencyList extends StatefulWidget {
  final isReorderList;

  _CurrencyList({Key? key, required this.isReorderList}) : super(key: key);

  @override
  State<_CurrencyList> createState() => _CurrencyListState();
}

class _CurrencyListState extends State<_CurrencyList> {
  @override
  Widget build(BuildContext context) {
    final model = CurrenciesWidgetModelProvider.of(context).model;
    return RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        edgeOffset: 0,
        onRefresh: () => model.updateCurrencies(),
        child: widget.isReorderList
            ? ReorderableListView.builder(
                itemCount: SelectedCurrencies.selectedCurrencies.length,
                itemBuilder: (BuildContext context, int index) {
                  return CurrencyCard(
                    flag: model.currencies
                        .firstWhere((element) => element.code == SelectedCurrencies.selectedCurrencies[index])
                        .flag,
                    /*model.currencies.firstWhere((element) => element.code == SelectedCurrencies.selectedCurrencies[index]).,*/
                    code: model.currencies
                        .firstWhere((element) => element.code == SelectedCurrencies.selectedCurrencies[index])
                        .code,
                    country: model.currencies
                        .firstWhere((element) => element.code == SelectedCurrencies.selectedCurrencies[index])
                        .country,
                    key: ValueKey(index),
                    trailing: Icon(Icons.reorder_rounded),
                  );
                },
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final String item = SelectedCurrencies.selectedCurrencies.removeAt(oldIndex);
                    SelectedCurrencies.selectedCurrencies.insert(newIndex, item);
                  });
                },
              )
            : ListView.builder(
                itemCount: SelectedCurrencies.selectedCurrencies.length,
                itemBuilder: (BuildContext context, int index) {
                  return CurrencyCard(
                    flag:  model.currencies
                        .firstWhere((element) => element.code == SelectedCurrencies.selectedCurrencies[index])
                        .flag,
                    code: model.currencies
                        .firstWhere((element) => element.code == SelectedCurrencies.selectedCurrencies[index])
                        .code,
                    country: model.currencies
                        .firstWhere((element) => element.code == SelectedCurrencies.selectedCurrencies[index])
                        .country,
                    key: ValueKey(index),
                    trailing: CurrencyTextField(
                      model: model,
                      index: index,
                    ),
                  );
                },
              ));
  }
}
