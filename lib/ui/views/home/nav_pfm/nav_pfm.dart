import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/views/home/nav_pfm/auto_financial_liquidity/auto_financial_liquidity.dart';
import 'package:sakhy/ui/views/home/nav_pfm/auto_financial_liquidity/auto_financial_liquidity_add_bill.dart';
import 'package:sakhy/ui/route/route.dart' as route;

class NavPFM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Finance Manager"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: ScreenUtil().screenWidth / 2.3,
              height: 120.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, route.accountAggregator);
                },
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
                      left: 5.w, right: 5.w, top: 30.h, bottom: 30.h),
                  child: Text(
                    'Account\n aggregator',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: ScreenUtil().screenWidth / 2.3,
              height: 120.h,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(AutoFinancialLiquidity());
                },
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
                      left: 5.w, right: 5.w, top: 30.h, bottom: 30.h),
                  child: Text(
                    'Auto financial\n liquidity',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
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
