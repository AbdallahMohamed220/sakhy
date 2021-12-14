import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget beneficiaryDetailsData(tag, data) {
  return Row(
    children: [
      Container(
          width: ScreenUtil().screenWidth / 2.8,
          child: Text(
            tag,
            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp),
          )),
      Text(
        data,
        style: TextStyle(
          color: Colors.white70,
          fontSize: 14.sp
        ),
      ),
    ],
  );
}
