import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: _CurrencyList(),
    );
  }
}

class _CurrencyList extends StatefulWidget {
  var selectedCurrencies = SelectedCurrencies.selectedCurrencies;

  _CurrencyList({Key? key}) : super(key: key);

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
      child: ListView.builder(
        itemCount: CurrenciesWidgetModelProvider.of(context).model.currencies.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(model.currencies[index].icon),
            title: Text(model.currencies[index].code),
            subtitle: Text(model.currencies[index].title),
            trailing: Checkbox(
              checkColor: Colors.white,
              value: widget.selectedCurrencies.contains(model.currencies[index].code),
              onChanged: (bool? value) {
                if (widget.selectedCurrencies.contains(model.currencies[index].code)) {
                  {
                    setState(() {
                      widget.selectedCurrencies.remove(model.currencies[index].code);
                    });
                  }
                } else {
                  setState(() {
                    SelectedCurrencies.selectedCurrencies.add(model.currencies[index].code);
                  });
                }
              },
            ),
          );
        },
      ),
    );
  }
}
