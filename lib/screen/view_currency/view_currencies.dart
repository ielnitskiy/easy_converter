import 'package:cur_val/library/hive/box_manager.dart';
import 'package:cur_val/screen/view_currency/view_currencies_model.dart';
import 'package:cur_val/widgets/component/currency_card_text_field.dart';
import 'package:cur_val/widgets/util/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/selected_currencies.dart';
import '../../widgets/component/currency_card.dart';

class ViewCurrenciesListWidget extends StatelessWidget {
  const ViewCurrenciesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewCurrenciesModel>(
      create: (context) => ViewCurrenciesModel(),
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
        floatingActionButton: //or an empty container
            FloatingActionButton(
          child: const Icon(Icons.add),
          // onPressed: () => Navigator.of(context).pushNamed('/select_currency').then((_) => setState(() {})),
          onPressed: () => showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            isDismissible: true,
            context: context,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.vertical(
            //     top: Radius.circular(20),
            //   ),
            // ),
            builder: (context) => SelectCurrenciesListWidget(),
          ).then((value) => setState(() {})),
          backgroundColor: AppColors.flutterActionButton,
        ));
  }
}

class CurrencyList extends StatelessWidget {
  final isReorderList;

  CurrencyList({Key? key, required this.isReorderList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ViewCurrenciesModel>(context);
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
