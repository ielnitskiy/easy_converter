import 'package:easy_converter/screen/view_currency/view_currencies_model.dart';
import 'package:easy_converter/widgets/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyTextField extends StatefulWidget {
  final ViewCurrenciesModel model;
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
  Widget build(BuildContext context) {
    bool hasFocus = _focusNode.hasFocus;
    var suffixText = ' ${widget.model.currencies[widget.model.getSelectedCurrencies()[widget.index]]?.symbol}';

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: TextFormField(
            style: AppFontStyle.regularTextStyle.copyWith(fontSize: AppFontStyle.size16),
            decoration: InputDecoration(
              suffixText: suffixText,
            ),
            textAlign: TextAlign.end,
            focusNode: _focusNode,
            controller: _controller
              ..text = hasFocus ? widget.model.type : widget.model.calculateCurrencies(index: widget.index)
              ..selection = position(),
            onTap: () {
              widget.model.type = '';
              widget.model.currentCurrencyCode = widget.model.getSelectedCurrencies()[widget.index];
            },
            onChanged: (value) {
              if (value.contains(',')) {
                value = value.replaceAll(',', '.');
              }
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
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('^[0-9]*[.,]?[0-9]*'))],
          ),
        ),
      ],
    );
  }
}
