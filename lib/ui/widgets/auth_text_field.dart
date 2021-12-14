import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/const/app_colors.dart';

Widget authTextField(
  keyboardtype,
  obscuretext,
  controller,
  enabled,
  suffixIcon,
  BuildContext context,
  hinttext,
) {
  return TextFormField(
    keyboardType: keyboardtype,
    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
    controller: controller,
    obscureText: obscuretext,
    enabled: enabled,
    validator: (val) {
      if (val!.isEmpty) {
        return 'This field is required';
      }
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      contentPadding: new EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 12.0,
      ),
      suffixIcon: Icon(
        suffixIcon,
        size: 22.h,
        color: AppColors.Alpine,
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
        borderSide: BorderSide(color: AppColors.Alpine),
      ),
      hintText: hinttext,
      hintStyle: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        color: Color(0xFF828282),
      ),
      errorStyle: TextStyle(fontSize: 16.sp),
    ),
  );
}
