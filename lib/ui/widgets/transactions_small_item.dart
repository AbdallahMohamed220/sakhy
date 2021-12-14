import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/const/app_colors.dart';

Widget transactionsSmallItem(onClick, icon, title) {
  return SizedBox(
    width: ScreenUtil().screenWidth / 2.3,
    child: ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF3333333),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7.r),
          ),
        ),
        padding: EdgeInsets.all(0),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(left: 5.w, right: 5.w, top: 30.h, bottom: 30.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.Alpine,
              size: 40.w,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget transactionsSmallItemTitleOnly(onClick, title) {
  return SizedBox(
    width: ScreenUtil().screenWidth / 2.3,
    height: 120.h,
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
        padding: EdgeInsets.only(
          left: 5.w,
          right: 5.w,
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
