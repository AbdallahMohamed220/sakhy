import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/route/route.dart' as route;


class BeneficiariesList extends StatefulWidget {
  @override
  _BeneficiariesListState createState() => _BeneficiariesListState();
}

class _BeneficiariesListState extends State<BeneficiariesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beneficiaries"),
        centerTitle: true,
        leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back,size: 20.w,),),

      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
          top: 20.h,
        ),
        child: Column(
          children: [

            ElevatedButton(
              onPressed: ()=>Navigator.pushNamed(context, route.localBeneficiaries),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                primary: Color(0xFF333333),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.r),
                  ),
                ),
              ),
              child: Container(
                height: 65.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Local Beneficiaries",
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.sp),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15.w,
                        color: AppColors.Alpine,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h,),
            ElevatedButton(
              onPressed: ()=>Navigator.pushNamed(context, route.internationalBeneficiaries),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                primary: Color(0xFF333333),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.r),
                  ),
                ),
              ),
              child: Container(
                height: 65.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "International Beneficiaries",
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.sp),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15.w,
                        color: AppColors.Alpine,
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
