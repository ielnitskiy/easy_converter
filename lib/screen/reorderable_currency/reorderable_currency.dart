import 'package:easy_converter/domain/selected_currencies.dart';
import 'package:easy_converter/resources/resources.dart';
import 'package:easy_converter/screen/reorderable_currency/reorderable_currency_model.dart';
import 'package:easy_converter/widgets/component/currency_card.dart';
import 'package:easy_converter/widgets/util/const.dart';
import 'package:easy_converter/widgets/util/reorderable_list_view_separated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ReorderableCurrencyWidget extends StatelessWidget {
  const ReorderableCurrencyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CurrencyReorderableModel>(
      create: (context) => CurrencyReorderableModel(),
      child: const _ReorderableCurrencyBody(),
    );
  }
}

class _ReorderableCurrencyBody extends StatelessWidget {
  const _ReorderableCurrencyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray6,
      appBar: AppBar(
        backgroundColor: AppColors.gray5,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.blue1,
            size: 24,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Settings',
          style: AppFontStyle.boldTextStyle.copyWith(fontSize: AppFontStyle.size18),
        ),
        centerTitle: true,
      ),
      body: CurrencyReorderableList(),
    );
  }
}

class CurrencyReorderableList extends StatelessWidget {
  const CurrencyReorderableList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CurrencyReorderableModel>(context);

    return CustomReorderableListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: SelectedCurrencies.selectedCurrencies.length,
      itemBuilder: (BuildContext context, int index) {
        return CurrencyCard(
          isSelecteble: true,
//FIXME избавиться от опционала
          currency: model.currencies[SelectedCurrencies.selectedCurrencies[index]]!,
          key: ValueKey(index),
          index: index,
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                SvgsIcons.reorderIcon,
              ),
              IconButton(
                  onPressed: () => model.deleteCurrency(index: index),
                  icon: SvgPicture.asset(SvgsIcons.removeIcon),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(0.0),
                  visualDensity: VisualDensity.compact),
            ],
          ),
        );
      },
      onReorder: model.reorder,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 8);
      },
    );
  }
}
