import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget billDetailsData(tag, data) {
  return Row(
    children: [
      Container(
        width: ScreenUtil().screenWidth/3,
          child: Text(
        tag,
        style: TextStyle(fontWeight: FontWeight.w500),
      )),
      Text(
        data,
        style: TextStyle(
          color: Colors.white70,
        ),
      ),
    ],
  );
}
