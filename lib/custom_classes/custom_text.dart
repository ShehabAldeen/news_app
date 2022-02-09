import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  String? text;
  Color? color;
  FontWeight? fontWeight;
  double? fontSize;
  int? maxLine;

  CustomText(
      {this.text, this.color, this.fontWeight, this.fontSize, this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      maxLines: maxLine,
    );
  }
}
