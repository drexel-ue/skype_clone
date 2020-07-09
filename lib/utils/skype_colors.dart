import 'package:flutter/material.dart';

class SkypeColors {
  static const blueColor = Color(0xff2b9ed4);
  static const blackColor = Color(0xff19191b);
  static const whiteColor = Color(0xffffffff);
  static const greyColor = Color(0xff8f8f8f);
  static const userCircleBackground = Color(0xff2b2b33);
  static const onlineDotColor = Color(0xff46dc64);
  static const lightBlueColor = Color(0xff0077d7);
  static const separatorColor = Color(0xff272c35);

  static const gradientColorStart = Color(0xff00b6f3);
  static const gradientColorEnd = Color(0xff0184dc);

  static const senderColor = Color(0xff2b343b);
  static const receiverColor = Color(0xff1e2225);

  static const fabGradient = LinearGradient(
    colors: [gradientColorStart, gradientColorEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
