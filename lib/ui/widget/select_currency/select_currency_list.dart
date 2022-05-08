import 'package:cur_val/ui/util/const.dart';
import 'package:cur_val/ui/widget/common/currency_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../domain/selected_currencies.dart';
import '../currencies_list/currencies_widget_model.dart';

class SelectCurrenciesListWidget extends StatefulWidget {
  const SelectCurrenciesListWidget({Key? key}) : super(key: key);

  @override
  State<SelectCurrenciesListWidget> createState() => _SelectCurrenciesListWidgetState();
}

class _SelectCurrenciesListWidgetState extends State<SelectCurrenciesListWidget> {
  final _model = CurrenciesWidgetModel();

  @override
  Widget build(BuildContext context) {
    return CurrenciesWidgetModelProvider(
      model: _model,
      child: const _CurrenciesWidgetBody(),
    );
  }
}

class _CurrenciesWidgetBody extends StatelessWidget {
  const _CurrenciesWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: const _CurrencyList(),
    );
  }
}

class _CurrencyList extends StatefulWidget {
  const _CurrencyList({Key? key}) : super(key: key);

  @override
  State<_CurrencyList> createState() => _CurrencyListState();
}

class _CurrencyListState extends State<_CurrencyList> {
  late Box<List<String>> selectedCurrenciesBox;

  @override
  void initState() {
    selectedCurrenciesBox = Hive.box<List<String>>('selected_currency');
    if (selectedCurrenciesBox.get("selectedList") == null) {
      (selectedCurrenciesBox.put("selectedList", SelectedCurrencies.selectedCurrencies));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = CurrenciesWidgetModelProvider.of(context).model;

    selectCurrency({required int index}) {
      if (selectedCurrenciesBox.get("selectedList")!.remove(model.currencies[index].code)) {
      } else {
        selectedCurrenciesBox.get("selectedList")!.add(model.currencies[index].code);
      }
      SelectedCurrencies.selectedCurrencies = selectedCurrenciesBox.get("selectedList")!;
      selectedCurrenciesBox.put("selectedList", SelectedCurrencies.selectedCurrencies);
      setState(() {});
    }

    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      edgeOffset: 0,
      onRefresh: () => model.updateCurrencies(),
      child: ValueListenableBuilder(
          valueListenable: selectedCurrenciesBox.listenable(),
          builder: (context, Box<List<String>> box, _) {
            return ListView.builder(
              itemCount: CurrenciesWidgetModelProvider.of(context).model.currencies.length,
              itemBuilder: (BuildContext context, int index) {
                return CurrencyCard(
                  flag: model.currencies[index].flag,
                  code: model.currencies[index].code,
                  country: model.currencies[index].country,
                  trailing: IconButton(
                    icon: (selectedCurrenciesBox.get("selectedList")!.contains(model.currencies[index].code))
                        ? const Icon(
                            Icons.check_circle_outline,
                            color: AppColors.black,
                          )
                        : const Icon(
                            Icons.brightness_1_outlined,
                            color: AppColors.gray,
                          ),
                    onPressed: () => selectCurrency(index: index),
                  ),
                );
              },
            );
          }),
    );
  }
}
