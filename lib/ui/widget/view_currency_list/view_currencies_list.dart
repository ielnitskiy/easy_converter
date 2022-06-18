import 'package:cur_val/library/hive/box_manager.dart';
import 'package:cur_val/ui/util/const.dart';
import 'package:cur_val/ui/widget/common/currency_card_text_field.dart';
import 'package:flutter/material.dart';
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
                    BoxManager.instance.putSelectedCurList(SelectedCurrencies.selectedCurrencies);
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
        body: CurrencyList(isReorderList: isReorderList),
        floatingActionButton: isReorderList
            ? FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () => Navigator.of(context).pushNamed('/select_currency').then((_) => setState(() {})),
                backgroundColor: AppColors.black,
              )
            : null);
  }
}

class CurrencyList extends StatelessWidget {
  final isReorderList;

  CurrencyList({Key? key, required this.isReorderList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = ViewCurrenciesListWidgetModelProvider.of(context).model;
    return RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        edgeOffset: 0,
        onRefresh: () => model.updateRateCurrencies(),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: isReorderList
                ? ReorderableListView.builder(
                    itemCount: SelectedCurrencies.selectedCurrencies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CurrencyCard(
                        isSlidable: true,
                        //FIXME избавиться от опционала
                        currency: model.currencies[SelectedCurrencies.selectedCurrencies[index]]!,
                        key: ValueKey(index),
                        trailing: const Align(alignment: Alignment.centerRight, child: Icon(Icons.reorder_rounded)),
                        index: index,
                        model: model,
                      );
                    },
                    onReorder: model.reorder,
                  )
                : ListView.builder(
                    itemCount: SelectedCurrencies.selectedCurrencies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CurrencyCard(
                        //FIXME избавиться от опционала
                        currency: model.currencies[SelectedCurrencies.selectedCurrencies[index]]!,
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
