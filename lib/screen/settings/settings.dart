import 'package:easy_converter/resources/resources.dart';
import 'package:easy_converter/widgets/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreenWidget extends StatelessWidget {
  const SettingsScreenWidget({Key? key}) : super(key: key);

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
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8),
        children: [
          ListTile(
              tileColor: AppColors.gray5,
              leading: SvgPicture.asset(SvgsIcons.listIcon),
              title: Text('Edit Сurrencies List'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.blue1,
              ),
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.reorderableCurrency),)
        ],
      ),
    );
  }
}
