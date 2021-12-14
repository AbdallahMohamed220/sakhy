import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
Widget profileItem(title,icon,onClick){
  return ListTile(
    dense: true,
    title: Text(title,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w400,color: Color(0xFFF2F2F2),),),
    leading: Icon(icon,color: AppColors.Alpine,size: 20.w,),
    trailing: Icon(Icons.arrow_forward_ios_outlined,size: 15.w,color: AppColors.Alpine,),
    onTap: onClick,
  );
}