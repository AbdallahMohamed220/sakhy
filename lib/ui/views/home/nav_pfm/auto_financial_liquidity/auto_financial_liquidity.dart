import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/home/nav_pfm/auto_financial_liquidity/auto_financial_liquidity_add_bill.dart';
import 'package:sakhy/ui/widgets/form_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';

class AutoFinancialLiquidity extends StatelessWidget {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF333333),
        title: Styles.headingText("Auto financial liquidity"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_outlined,
            color: AppColors.Alpine,
            size: 20.w,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
          top: 20.h,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Styles.transparentDivider(),
              Styles.transparentDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Styles.headingText("Add Bill"), Icon(Icons.add)],
              ),
              Styles.transparentDivider(),
              formField(TextInputType.text, false, controller, true,
                  Icons.person_outline, context, "Bill Name"),
              formField(TextInputType.text, false, controller, true,
                  Icons.money, context, "Amount SAR"),
              Container(
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: DropdownButton<String>(
                  hint: Padding(
                    padding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    child: Text(
                      'From Account',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp),
                    ),
                  ),
                  icon: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.arrow_downward,
                      color: AppColors.Alpine,
                      size: 20.w,
                    ),
                  ),
                  isExpanded: true,
                  iconSize: 18,
                  underline: Container(
                    height: 0,
                    color: Colors.transparent,
                  ),
                  onChanged: (String? newValue) {},
                  items: <String>['One', 'Two', 'Three', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Styles.transparentDivider(),
              formField(TextInputType.text, false, controller, true,
                  Icons.date_range, context, "Date"),
              Container(
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: DropdownButton<String>(
                  hint: Padding(
                    padding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    child: Text(
                      'Month or one Time',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp),
                    ),
                  ),
                  icon: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.arrow_downward,
                      color: AppColors.Alpine,
                      size: 20.w,
                    ),
                  ),
                  isExpanded: true,
                  iconSize: 18,
                  underline: Container(
                    height: 0,
                    color: Colors.transparent,
                  ),
                  onChanged: (String? newValue) {},
                  items: <String>['One', 'Two', 'Three', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Styles.transparentDivider(),
              fullWidthButton(
                "Add",
                () {
                  Get.to(AutoFinancialLiquidityAddBill());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}