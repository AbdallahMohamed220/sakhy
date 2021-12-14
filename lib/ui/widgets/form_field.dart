import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/const/app_colors.dart';

Widget formField(
  keyboardtype,
  obscuretext,
  controller,
  enabled,
  suffixIcon,
  BuildContext context,
  hinttext,
) {
  return Padding(
    padding: EdgeInsets.only(bottom: 15.h),
    child: Container(
      child: TextFormField(
        keyboardType: keyboardtype,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        controller: controller,
        obscureText: obscuretext,
        enabled: enabled,
        validator: (val) {
          if (val!.isEmpty) {
            return 'This Feild is required';
          }
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal: 12.0,
          ),
          suffixIcon: Icon(
            suffixIcon,
            color: AppColors.Alpine,
            size: 20.w,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF2F2F2),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF2F2F2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.Alpine),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.Alpine),
          ),
          hintText: hinttext,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: Color(0xffF2F2F2),
          ),
          errorStyle: TextStyle(fontSize: 16.sp),
        ),
      ),
    ),
  );
}
