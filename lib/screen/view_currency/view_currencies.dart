import 'package:easy_converter/library/hive/box_manager.dart';
import 'package:easy_converter/resources/resources.dart';
import 'package:easy_converter/screen/select_currency/select_curriencies.dart';
import 'package:easy_converter/screen/view_currency/view_currencies_model.dart';
import 'package:easy_converter/widgets/component/currency_card_text_field.dart';
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
  bool isReorderList = false;

  @override
  Widget build(BuildContext context) {
    final bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        backgroundColor: AppColors.gray3,
        appBar: AppBar(
          title: Row(
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
          backgroundColor: AppColors.gray5,
          elevation: 0.0,
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  isReorderList = !isReorderList;
                  if (!isReorderList) {
                    BoxManager.instance.putSelectedCurList(SelectedCurrencies.selectedCurrencies);
                  }
                });
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    SvgsIcons.settingsIcon,
                    width: 16,
                    height: 16,
                    color: AppColors.gray2,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Settings',
                    style: AppFontStyle.regularTextStyle.copyWith(color: AppColors.gray2),
                  ),
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
            ),
          ],
        ),
        body: CurrencyList(isReorderList: isReorderList),
        floatingActionButton: //or an empty container
            Visibility(
          visible: !keyboardIsOpen,
          child: FloatingActionButton(
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
            backgroundColor: AppColors.blue1,
          ),
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
        child: isReorderList
            ? ReorderableListView.builder(
                itemCount: SelectedCurrencies.selectedCurrencies.length,
                itemBuilder: (BuildContext context, int index) {
                  return CurrencyCard(
                    isSelecteble: true,
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
            : ListView.separated(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.all(16),
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
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 8);
                },
              ));
  }
}
