import 'dart:ui';

import 'package:easy_converter/resources/resources.dart';
import 'package:easy_converter/screen/view_currency/view_currencies_model.dart';
import 'package:easy_converter/widgets/component/addition_description.dart';
import 'package:easy_converter/widgets/component/currency_card_text_field.dart';
import 'package:easy_converter/widgets/component/reorderable_list_view_separated.dart';
import 'package:easy_converter/widgets/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  @override
  Widget build(BuildContext context) {
    final bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    final model = Provider.of<ViewCurrenciesModel>(context);
    return Scaffold(
        backgroundColor: AppColors.gray3,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(SvgsIcons.curIcon),
              SizedBox(
                width: 8,
              ),
              Text(
                'Easy.Сonverter',
                style: AppFontStyle.regularTextStyle,
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: AppColors.gray5,
          elevation: 0.0,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.settings).then((value) => setState(() {}));
              },
              child: SvgPicture.asset(
                SvgsIcons.settingsIcon,
                width: 24,
                height: 24,
                color: AppColors.gray2,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(flex: 1, child: _CurrencyList()),
            (model.getSelectedCurrencies().length < 2 && !keyboardIsOpen) ? AdditionDescription() : SizedBox.shrink(),
          ],
        ),
        floatingActionButton: //or an empty container
            Visibility(
          visible: !keyboardIsOpen,
          child: FloatingActionButton(
            child: const Icon(Icons.add),
            backgroundColor: AppColors.blue1,
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.selectCurrency).then((value) => setState(() {})),
          ),
        ));
  }
}

class _CurrencyList extends StatefulWidget {
  _CurrencyList({Key? key}) : super(key: key);

  @override
  State<_CurrencyList> createState() => _CurrencyListState();
}

class _CurrencyListState extends State<_CurrencyList> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ViewCurrenciesModel>(context);
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      edgeOffset: 0,
      onRefresh: () => model.updateRateCurrencies(),
      child: CustomReorderableListView.separated(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.all(16),
        itemCount: SelectedCurrencies.selectedCurrencies.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            background: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.red1,
              ),
              child: Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.delete,
                      color: AppColors.gray5,
                    ),
                    Text(
                      "Delete",
                      style: TextStyle(
                        color: AppColors.gray5,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                alignment: Alignment.centerRight,
              ),
            ),
            //FIXME избавиться от опционала
            key: ValueKey(model.currencies[SelectedCurrencies.selectedCurrencies[index]]!.code),
            onDismissed: (direction) {
              model.deleteCurrency(index: index);
            },
            child: CurrencyCard(
              //FIXME избавиться от опционала
              currency: model.currencies[SelectedCurrencies.selectedCurrencies[index]]!,
              key: ValueKey(index),
              index: index,
              trailing: CurrencyTextField(
                model: model,
                index: index,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 8);
        },
        onReorder: model.reorder,
        proxyDecorator: _proxyDecorator,
      ),
    );
  }
}

Widget _proxyDecorator(Widget child, int index, Animation<double> animation) {
  return AnimatedBuilder(
    animation: animation,
    builder: (BuildContext context, Widget? child) {
      final double animValue = Curves.easeInOut.transform(animation.value);
      final double elevation = lerpDouble(0, 8, animValue)!;
      return Material(
        elevation: elevation,
        shadowColor: AppColors.bgWhite,
        child: child,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      );
    },
    child: child,
  );
}
