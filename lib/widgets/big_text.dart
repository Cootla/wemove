import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  var fontWeight;

  BigText({Key? key, this.color = const Color(0xff86e889),
  required this.text, this.size=20,
  this.overFlow=TextOverflow.ellipsis, this.fontWeight }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400
      )
    );
  }
}
