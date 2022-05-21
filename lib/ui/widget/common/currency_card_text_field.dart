import 'package:cur_val/ui/util/const.dart';
import 'package:cur_val/ui/widget/view_currency_list/view_currencies_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyTextField extends StatefulWidget {
  final ViewCurrenciesListWidgetModel model;
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
    widget.model.updateRateCurrencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool hasFocus = _focusNode.hasFocus;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.5,
          child: TextFormField(
            style: AppFontStyle.boldTextStyle.copyWith(fontSize: AppFontStyle.size18),
            decoration: InputDecoration(
              isCollapsed: true,
              filled: true,
              suffixStyle: TextStyle(fontSize: 12),
              suffixText:
                  ' ${widget.model.currencies.firstWhere((element) => element.code == widget.model.getSelectedCurrencies()[widget.index]).symbol}',
              border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  )),
              contentPadding: const EdgeInsets.all(6),
              fillColor: AppColors.backgroundLightGray,
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
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('^[0-9]*[.]?[0-9]*'))],
          ),
        ),
        Text(
          widget.model.currencies
              .firstWhere((element) => element.code == widget.model.getSelectedCurrencies()[widget.index])
              .title,
          style: AppFontStyle.lightTextStyle.copyWith(fontSize: AppFontStyle.size12),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
