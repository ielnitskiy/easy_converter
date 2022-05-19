import 'package:cur_val/ui/util/const.dart';
import 'package:cur_val/ui/widget/common/currency_card.dart';
import 'package:cur_val/ui/widget/select_curriencies_list/select_curriencies_list_model.dart';
import 'package:cur_val/ui/widget/view_currency_list/view_currencies_list_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../domain/selected_currencies.dart';

class SelectCurrenciesListWidget extends StatefulWidget {
  const SelectCurrenciesListWidget({Key? key}) : super(key: key);

  @override
  State<SelectCurrenciesListWidget> createState() => _SelectCurrenciesListWidgetState();
}

class _SelectCurrenciesListWidgetState extends State<SelectCurrenciesListWidget> {
  final _model = ViewCurrenciesListWidgetModel();

  @override
  Widget build(BuildContext context) {
    return ViewCurrenciesListWidgetModelProvider(
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
    final model = ViewCurrenciesListWidgetModelProvider.of(context).model;
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
    final model = ViewCurrenciesListWidgetModelProvider.of(context).model;

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
      onRefresh: () => model.updateRateCurrencies(),
      child: ListView.builder(
        itemCount: ViewCurrenciesListWidgetModelProvider.of(context).model.resultSearch().length,
        itemBuilder: (BuildContext context, int index) {
          return CurrencyCard(
            flag: model.resultSearch()[index].flag,
            code: '${model.resultSearch()[index].code} - ${model.resultSearch()[index].country}',
            country: model.resultSearch()[index].title,
            trailing: IconButton(
              padding: EdgeInsets.all(0),
              alignment: Alignment.centerRight,
              icon: (selectedCurrenciesBox.get("selectedList")!.contains(model.resultSearch()[index].code))
                  ? const Icon(
                      Icons.check_circle_outline,
                      color: AppColors.black,
                    )
                  : const Icon(
                      Icons.brightness_1_outlined,
                      color: AppColors.gray,
                    ),
              onPressed: () => selectCurrency(index: model.currencies.indexOf(model.resultSearch()[index])),
            ),
          );
        },
      ),
    );
  }
}
