import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/route/route.dart' as route;
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';

class AutoFinancialLiquidityAddBill extends StatefulWidget {
  @override
  _AutoFinancialLiquidityAddBillState createState() =>
      _AutoFinancialLiquidityAddBillState();
}

class _AutoFinancialLiquidityAddBillState
    extends State<AutoFinancialLiquidityAddBill> {
  bool _isMonthlyActive = true;
  int _radioButton = 0;

  List<String> _titles = [
    'loan instalment',
    'water',
    'Stc',
    'NetFlix',
  ];
  List<String> _balances = [
    '100 SAR',
    '20 SAR',
    '100 SAR',
    '30 SAR',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auto Financial Liquidity"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 25.w,
          right: 25.w,
          top: 15.h,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: ScreenUtil().screenWidth,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: ScreenUtil().screenWidth * 0.5,
                        height: 43.h,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isMonthlyActive = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: _isMonthlyActive
                                ? AppColors.Alpine
                                : Color(0xff333333),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(7.r),
                              ),
                            ),
                            padding: EdgeInsets.all(0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.w, bottom: 10.w),
                            child: Text(
                              'Monthly',
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: ScreenUtil().screenWidth * 0.4,
                        child: SizedBox(
                          width: ScreenUtil().screenWidth * 0.48,
                          height: 43.h,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isMonthlyActive = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: !_isMonthlyActive
                                  ? AppColors.Alpine
                                  : Color(0xff333333),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7.r),
                                ),
                              ),
                              padding: EdgeInsets.all(0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.w, bottom: 10.w),
                              child: Text(
                                'One Time',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Styles.transparentDivider(),
                Styles.transparentDivider(),
                _isMonthlyActive
                    ? Flexible(
                        child: ListView.builder(
                            itemCount: 4,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 5.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              _titles[index],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16.sp,
                                                  color: Color(0xffF2F2F2)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              '20/7',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16.sp,
                                                  color: Color(0xffF2F2F2)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              _balances[index],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16.sp,
                                                  color: Color(0xffF2F2F2)),
                                            ),
                                          )
                                        ],
                                      ),
                                      Divider(
                                        thickness: 1.5,
                                        color: Color(0xff828282),
                                      )
                                    ],
                                  ),
                                )),
                      )
                    : Flexible(
                        child: ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      _radioButton = index;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 8,
                                              height: 8,
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Theme(
                                                data: ThemeData(
                                                    unselectedWidgetColor:
                                                        Color(0xFF1C1C1C)),
                                                child: Radio(
                                                    value: index,
                                                    groupValue: _radioButton,
                                                    activeColor:
                                                        AppColors.Alpine,
                                                    onChanged: (int? v) {
                                                      setState(() {
                                                        _radioButton = index;
                                                      });
                                                    }),
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              _titles[index],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16.sp,
                                                  color: Color(0xffF2F2F2)),
                                            ),
                                            Spacer(
                                              flex: 12,
                                            ),
                                            Text(
                                              _balances[index],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16.sp,
                                                  color: Color(0xffF2F2F2)),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 22, top: 5),
                                          child: Divider(
                                            thickness: 1.5,
                                            color: Color(0xff828282),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                      ),
                Styles.transparentDivider(),
                _isMonthlyActive
                    ? fullWidthButton(
                        "Initiate Monthly",
                        () => Navigator.pushNamed(
                            context, route.autoFinancialLiquidityPay),
                      )
                    : fullWidthButton(
                        "Check",
                        () => Navigator.pushNamed(
                            context, route.autoFinancialLiquidityPay),
                      ),
                Styles.transparentDivider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
