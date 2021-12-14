import 'package:flutter/material.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllItems extends StatefulWidget {
  @override
  _AllItemsState createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
        child: GridView.builder(
          itemCount: 5,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (_, index) {
            return Column(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFC4C4C4),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.r),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.Alpine,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10.r),
                                topLeft: Radius.circular(10.r),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Details",
                              style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Text("The Offer",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.sp),),
                Text(
                  "Bank Name",
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
