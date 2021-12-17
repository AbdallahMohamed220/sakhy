import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget navHomeItemsLight(icon, title, amount, onClick) {
  return SizedBox(
    width: ScreenUtil().screenWidth / 2.3,
    child: ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF333333),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7.r),
          ),
        ),
        padding: EdgeInsets.all(0),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20.w, bottom: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: Image.asset(
                icon,
                width: 20.w,
                color: Colors.white,
                fit: BoxFit.fitWidth,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.Alpine,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  amount,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget navHomeItemsDark(title, amount, onClick) {
  return SizedBox(
    width: ScreenUtil().screenWidth / 2.3,
    child: ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF333333),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7.r),
          ),
        ),
        padding: EdgeInsets.all(0),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20.w, bottom: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.Alpine,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              amount,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
