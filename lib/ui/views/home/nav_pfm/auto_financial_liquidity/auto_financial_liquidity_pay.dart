import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/route/route.dart' as route;
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';

class AutoFinancialLiquidityPay extends StatefulWidget {
  @override
  _AutoFinancialLiquidityPayState createState() =>
      _AutoFinancialLiquidityPayState();
}

class _AutoFinancialLiquidityPayState extends State<AutoFinancialLiquidityPay> {
  bool _isMonthlyActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pay Bill"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 30.w,
          right: 30.w,
          top: 15.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Styles.transparentDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Bill Holder',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Saad Ahmed',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp),
                  ),
                ),
              ],
            ),
            Styles.transparentDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Bill Number',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '123456789',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp),
                  ),
                ),
              ],
            ),
            Styles.transparentDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Bill Type',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Electricy Bill',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp),
                  ),
                ),
              ],
            ),
            Styles.transparentDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Bill Date',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '27/12/2021',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp),
                  ),
                ),
              ],
            ),
            Styles.transparentDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Amount',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '100 SAR',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp),
                  ),
                ),
              ],
            ),
            Styles.transparentDivider(),
            fullWidthButton(
              "Pay",
              () => Navigator.pushNamed(context, route.confirmWithFaceID),
            ),
            Styles.transparentDivider(),
          ],
        ),
      ),
    );
  }
}
