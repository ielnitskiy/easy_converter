import 'package:easy_converter/widgets/util/const.dart';
import 'package:flutter/material.dart';

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint();
    var path = Path();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.5;
    paint.color = AppColors.blue1;

    path.moveTo(size.width * 0.2, 10);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.40, size.width * 0.5, size.height * 0.4);

    path.quadraticBezierTo(size.width * 0.9, size.height * 0.4, size.width * 0.92, size.height * 0.7);

    path.moveTo(size.width * 0.85, size.height * 0.6);

    //Стрелка левая
    path.moveTo(size.width * 0.92, size.height * 0.7);
    path.lineTo(size.width * 0.896, size.height * 0.66);
    //Стрелка правая
    path.moveTo(size.width * 0.92, size.height * 0.7);
    path.lineTo(size.width * 0.94, size.height * 0.66);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
