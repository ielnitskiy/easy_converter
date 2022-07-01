import 'package:easy_converter/widgets/component/arrow_painter.dart';
import 'package:easy_converter/widgets/util/const.dart';
import 'package:flutter/material.dart';

class AdditionDescription extends StatelessWidget {
  const AdditionDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add your currency",
                style: AppFontStyle.boldTextStyle.copyWith(fontSize: AppFontStyle.size32),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Compare unlimited currencies in one place",
                style: AppFontStyle.regularTextStyle.copyWith(fontSize: AppFontStyle.size16),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3.2,
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  painter: ArrowPainter(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
