import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class _CurrenciesWidgetBody extends StatelessWidget {
  const _CurrenciesWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _CurrencyList(),
    );
  }
}

class _CurrencyList extends StatelessWidget {
  const _CurrencyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = CurrenciesWidgetModelProvider.of(context).model;
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      edgeOffset: 0,
      onRefresh: () => model.updateCurrencies(),
      child: ListView.builder(
        itemCount:
            CurrenciesWidgetModelProvider.of(context).model.currencies.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(model.currencies[index].icon),
            title: Text(model.currencies[index].code),
            subtitle: Text(model.currencies[index].title),
            trailing: SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                child: CurrencyCard(
                  model: model,
                  index: index,
                )),
          );
        },
      ),
    );
  }
}

class CurrencyCard extends StatefulWidget {
  final CurrenciesWidgetModel model;
  final int index;

  const CurrencyCard({Key? key, required this.model, required this.index})
      : super(key: key);

  @override
  State<CurrencyCard> createState() => _CurrencyCardState();
}

class _CurrencyCardState extends State<CurrencyCard> {
  final _controller = TextEditingController();

  final _focusNode = FocusNode();

  TextSelection position() => TextSelection.fromPosition(
      TextPosition(offset: (_controller.value.text).toString().length));

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
        ..text = hasFocus
            ? widget.model.type
            : widget.model.calculateCurrencies(index: widget.index)
        ..selection = position(),
      onTap: () {
        widget.model.type = '';
        widget.model.currentCurrencyCode =
            widget.model.currencies[widget.index].code;
      },
      onChanged: (value) {
        if (value.length == 1 && value == '.') {
          value = "0.";
        }
        if (value.length == 2 &&
            value.startsWith("0") &&
            !value.contains(".")) {
          List<String> charList = value.split('');
          charList.insert(1, '.');
          value = charList.join('');
        }

        widget.model.type = value;
      },
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('^[0-9]*[,.]?[0-9]*'))
      ],
    );
  }
}
