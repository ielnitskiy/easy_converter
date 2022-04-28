import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../common/currencies_list_tile.dart';
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
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isReorderLIst = !isReorderLIst;
                });
              },
              icon: isReorderLIst
                  ? const Icon(
                      Icons.done,
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
                backgroundColor: Colors.black87,
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
    final selectedCurrencies = CurrenciesWidgetModel.selectedCurrencies;
    return RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        edgeOffset: 0,
        onRefresh: () => model.updateCurrencies(),
        child: widget.isReorderList
            ? ReorderableListView.builder(
                itemCount: selectedCurrencies.length,
                itemBuilder: (BuildContext context, int index) {
                  return CurrenciesListTile(
                    index: index,
                    model: model,
                    key: ValueKey(index),
                  );
                },
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final String item = selectedCurrencies.removeAt(oldIndex);
                    selectedCurrencies.insert(newIndex, item);
                  });
                },
              )
            : ListView.builder(
                itemCount: selectedCurrencies.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    key: Key(index.toString()),
                    leading:
                        Text(model.currencies.firstWhere((element) => element.code == selectedCurrencies[index]).icon),
                    title:
                        Text(model.currencies.firstWhere((element) => element.code == selectedCurrencies[index]).code),
                    subtitle:
                        Text(model.currencies.firstWhere((element) => element.code == selectedCurrencies[index]).title),
                    trailing: SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                        child: CurrencyTextField(
                          model: model,
                          index: index,
                        )),
                  );
                },
              ));
  }
}

class CurrencyTextField extends StatefulWidget {
  final CurrenciesWidgetModel model;
  final int index;

  const CurrencyTextField({Key? key, required this.model, required this.index}) : super(key: key);

  @override
  State<CurrencyTextField> createState() => _CurrencyTextField();
}

class _CurrencyTextField extends State<CurrencyTextField> {
  final _controller = TextEditingController();

  final _focusNode = FocusNode();

  TextSelection position() =>
      TextSelection.fromPosition(TextPosition(offset: (_controller.value.text).toString().length));

  @override
  void initState() {
    widget.model.updateCurrencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool hasFocus = _focusNode.hasFocus;

    return TextFormField(
      focusNode: _focusNode,
      controller: _controller
        ..text = hasFocus ? widget.model.type : widget.model.calculateCurrencies(index: widget.index)
        ..selection = position(),
      onTap: () {
        widget.model.type = '';
        widget.model.currentCurrencyCode = widget.model.currencies[widget.index].code;
      },
      onChanged: (value) {
        if (value.length == 1 && value == '.') {
          value = "0.";
        }
        if (value.length == 2 && value.startsWith("0") && !value.contains(".")) {
          List<String> charList = value.split('');
          charList.insert(1, '.');
          value = charList.join('');
        }

        widget.model.type = value;
      },
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('^[0-9]*[,.]?[0-9]*'))],
    );
  }
}
