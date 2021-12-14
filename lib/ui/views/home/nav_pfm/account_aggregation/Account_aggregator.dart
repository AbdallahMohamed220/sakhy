import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/widgets/form_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';

import 'account_aggregation_amount.dart';

class AccountAggregator extends StatelessWidget {
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF333333),
        title: Styles.headingText("Account Aggregator"),
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
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Styles.transparentDivider(),
            Styles.transparentDivider(),
            formField(
              TextInputType.number,
              false,
              _amountController,
              true,
              Icons.monetization_on_outlined,
              context,
              "Amount SAR",
            ),
            Styles.transparentDivider(),
            fullWidthButton(
              "Next",
              () => Get.to(AccountAggregatorAmount()),
            ),
            Styles.transparentDivider(),
            Text(
              'OR',
              style: TextStyle(fontSize: 20.h),
            ),
            Styles.transparentDivider(),
            Styles.transparentDivider(),
            formField(
              TextInputType.number,
              false,
              _amountController,
              true,
              Icons.qr_code,
              context,
              "Scan Bill",
            ),
            Styles.transparentDivider(),
            fullWidthButton(
              "Next",
              () => Get.to(AccountAggregatorAmount()),
            ),
            Styles.transparentDivider(),
          ],
        ),
      ),
    );
  }
}
