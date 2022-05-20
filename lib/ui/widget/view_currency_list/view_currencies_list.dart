import 'package:cur_val/ui/util/const.dart';
import 'package:cur_val/ui/widget/common/currency_card_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/selected_currencies.dart';
import '../common/currency_card.dart';
import 'view_currencies_list_model.dart';

class ViewCurrenciesListWidget extends StatefulWidget {
  const ViewCurrenciesListWidget({Key? key}) : super(key: key);

  @override
  State<ViewCurrenciesListWidget> createState() => _ViewCurrenciesListWidgetState();
}

class _ViewCurrenciesListWidgetState extends State<ViewCurrenciesListWidget> {
  final _model = ViewCurrenciesListWidgetModel();

  @override
  Widget build(BuildContext context) {
    return ViewCurrenciesListWidgetModelProvider(
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
  bool isReorderList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F8FE),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            IconButton(
              splashRadius: 25,
              onPressed: () {
                setState(() {
                  isReorderList = !isReorderList;
                  if (!isReorderList) {
                    Hive.box<List<String>>('selected_currency')
                        .put("selectedList", SelectedCurrencies.selectedCurrencies);
                  }
                });
              },
              icon: isReorderList
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
        ),
        body: _CurrencyList(isReorderList: isReorderList),
        floatingActionButton: isReorderList
            ? FloatingActionButton(
                child: const Icon(Icons.add),
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
    final model = ViewCurrenciesListWidgetModelProvider.of(context).model;
    return RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        edgeOffset: 0,
        onRefresh: () => model.updateRateCurrencies(),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: widget.isReorderList
                ? ReorderableListView.builder(
                    itemCount: SelectedCurrencies.selectedCurrencies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CurrencyCard(
                        isSlidable: true,
                        flag: model.currencies
                            .firstWhere((element) => element.code == SelectedCurrencies.selectedCurrencies[index])
                            .flag,
                        code: model.currencies
                            .firstWhere((element) => element.code == SelectedCurrencies.selectedCurrencies[index])
                            .code,
                        country: model.currencies
                            .firstWhere((element) => element.code == SelectedCurrencies.selectedCurrencies[index])
                            .country,
                        key: ValueKey(index),
                        trailing: const Align(alignment: Alignment.centerRight, child: Icon(Icons.reorder_rounded)),
                        index: index,
                        model: model,
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
                        flag: model.currencies
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
                  )));
  }
}
