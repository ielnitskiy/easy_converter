import 'package:easy_converter/widgets/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSnackBarParams {
  final String icon;
  final String text;
  final BuildContext context;

  CustomSnackBarParams({
    required this.context,
    required this.icon,
    required this.text,
  });
}

SnackBar CustomSnackBar({required CustomSnackBarParams params}) {
  return SnackBar(
    backgroundColor: Theme.of(params.context).backgroundColor,
    content: Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.red1,
          ),
          child: SvgPicture.asset(
            params.icon,
            height: 12,
            fit: BoxFit.scaleDown,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            params.text,
            style: AppFontStyle.regularTextStyle,
            maxLines: 2,
          ),
        ),
      ],
    ),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {},
    ),
  );
}
