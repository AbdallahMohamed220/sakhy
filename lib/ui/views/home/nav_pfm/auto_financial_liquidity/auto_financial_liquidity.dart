import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sakhy/models/account.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/home/nav_accounts/nav_accountS_controller.dart';
import 'package:sakhy/ui/views/home/nav_pfm/account_aggregation/qr_view.dart';
import 'package:sakhy/ui/views/home/nav_pfm/auto_financial_liquidity/auto_financial_liquidity_add_bill.dart';
import 'package:sakhy/ui/widgets/form_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';

class AutoFinancialLiquidity extends StatefulWidget {
  @override
  State<AutoFinancialLiquidity> createState() => _AutoFinancialLiquidityState();
}

class _AutoFinancialLiquidityState extends State<AutoFinancialLiquidity> {
  final TextEditingController controller = TextEditingController();
  String _chooseAccount = "Choose Account";
  String accountBalance = "0.0";

  NavAccountController _navAccountController = Get.put(NavAccountController());

  String beneficiaryName = '';
  @override
  void initState() {
    super.initState();
    _navAccountController.fetchAccounts();
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles.transparentDivider(),
              Styles.transparentDivider(),
              Styles.transparentDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Styles.headingText("Add Bill"), Icon(Icons.add)],
              ),
              Styles.transparentDivider(),
              formField(TextInputType.text, false, controller, true,
                  Icons.person_outline, context, "Bill Serial Number"),
              formField(TextInputType.text, false, controller, true,
                  Icons.money, context, "Amount SAR"),
              Container(
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Color(0xff333333),
                  ),
                  child: DropdownButton(
                    hint: Padding(
                      padding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      child: Text(
                        _chooseAccount,
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
                    onChanged: (Account? newValue) {
                      setState(() {
                        _chooseAccount = newValue!.accountName;
                      });
                    },
                    items: _navAccountController.fetchedAccountList.map((e) {
                      return DropdownMenuItem(
                        child: Text(
                          e.bankName + ' (' + e.accountType + ')',
                          style: TextStyle(
                              color: AppColors.Alpine,
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp),
                        ),
                        value: e,
                      );
                    }).toList(),
                  ),
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
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Color(0xff333333),
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
                    items: <String>['Monthly', 'one Time']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              color: AppColors.Alpine,
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Styles.transparentDivider(),
              fullWidthButton(
                "Add",
                () {
                  Get.to(AutoFinancialLiquidityAddBill());
                },
              ),
              Styles.transparentDivider(),
              Styles.transparentDivider(),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(QRScreen());
                  },
                  child: Icon(
                    Icons.qr_code,
                    size: 80,
                    color: AppColors.Alpine,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
