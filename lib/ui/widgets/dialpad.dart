import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget dialPadButton(onPressed, digit) {
  return Material(
    color: Colors.transparent,
    child: IconButton(
      onPressed: onPressed,
      icon: Text(
        digit,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 26.sp,
          color: Colors.white70,
        ),
      ),
    ),
  );
}
