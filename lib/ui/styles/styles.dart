import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
   static toastMessage(msg) {
     print(msg);
    // return Fluttertoast.showToast(
    //     msg: msg, backgroundColor: Colors.white, textColor: Colors.black);
  }

   static transparentDivider() {
    return Divider(
      color: Colors.transparent,
    );
  }

   static headingText(text) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20.sp,
          color: Colors.white),
    );
  }

}
