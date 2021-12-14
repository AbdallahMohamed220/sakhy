import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/const/app_colors.dart';

Widget smallButton(
  centerText,
  onPressed,
) {
  return Container(
      width: 72.w,
      height: 32.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25.r),),
      ),
      child: Material(
          borderRadius: BorderRadius.all(Radius.circular(25.r),),
          color: AppColors.Alpine,
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(25.r),),
            onTap: onPressed,
            splashColor: Colors.white,
            child: Center(
              child: Text(
                centerText,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp),
              ),
            ),
          )));
}
