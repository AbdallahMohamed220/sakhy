import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget gradientBackground(child) {
  return SafeArea(
    child: Container(
      height: ScreenUtil().screenHeight,
      width: ScreenUtil().screenWidth,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color(0xFF363030),
            Color(0xFF1C1C1C),
          ],
          radius: 0.65,


        ),
      ),
      child: child,
    ),
  );
}
