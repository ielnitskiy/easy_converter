import 'package:easy_converter/domain/currency.dart';
import 'package:easy_converter/resources/resources.dart';
import 'package:easy_converter/screen/select_currency/select_curriencies_model.dart';
import 'package:easy_converter/widgets/component/currency_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../domain/selected_currencies.dart';

class SelectCurrenciesListWidget extends StatelessWidget {
  const SelectCurrenciesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SelectCurrenciesModel>(
      create: (context) => SelectCurrenciesModel(),
      child: const _CurrenciesWidgetBody(),
    );
  }
}

class _CurrenciesWidgetBody extends StatelessWidget {
  const _CurrenciesWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Add Currency'
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Container(
              color: Theme.of(context).backgroundColor,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                  right: 16.0,
                  left: 16.0,
                ),
                child: _SearchInAppBar(),
              )),
          Expanded(child: _CurrencyList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Icon(Icons.done),
      ),
    );
  }
}

class _SearchInAppBar extends StatelessWidget {
  const _SearchInAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SelectCurrenciesModel>(context);
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search,),
        hintText: 'Search',
      ),
      onChanged: (value) {
        model.searchRequest = value;
      },
    );
  }
}

class _CurrencyList extends StatelessWidget {
  const _CurrencyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SelectCurrenciesModel>(context);

    return ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.all(16),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: model.resultSearch().length,
      itemBuilder: (BuildContext context, int index) {
        bool selected = (SelectedCurrencies.selectedCurrencies.contains(model.resultSearch()[index].code));
        //FIXME избавиться от опционала
        Currency currencies = model.currencies[model.resultSearch()[index].code]!;
        return InkWell(
          onTap: () => model.selectCurrency(
            code: currencies.code,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                style: selected ? BorderStyle.solid : BorderStyle.none,
              ),
            ),
            child: CurrencyCard(
              index: index,
              isSelecteble: true,
              currency: model.resultSearch().elementAt(index),
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: Container(
                          child: Text(
                    currencies.title,
                    maxLines: 2,
                    textAlign: TextAlign.end,
                  ))),
                  selected ? SvgPicture.asset(SvgsIcons.selectedIcon) : SizedBox.shrink(),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 8);
      },
    );
  }
}
