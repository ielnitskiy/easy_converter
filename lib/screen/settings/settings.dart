import 'package:easy_converter/resources/resources.dart';
import 'package:easy_converter/widgets/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreenWidget extends StatelessWidget {
  const SettingsScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Settings',
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 8),
          children: [
            ListTile(
              tileColor: Theme.of(context).backgroundColor,
              leading: SvgPicture.asset(SvgsIcons.languageIcon),
              title: Text('Language'),
              trailing: Text(
                'Coming soon…',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            ListTile(
              tileColor: Theme.of(context).backgroundColor,
              leading: SvgPicture.asset(SvgsIcons.themeModeIcon),
              title: Text('Dark Theme'),
              trailing: Text(
                'Coming soon…',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        ));
  }
}
