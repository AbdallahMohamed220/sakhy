import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/home/nav_accounts/nav_accountS_controller.dart';
import 'package:sakhy/ui/views/home/nav_pfm/account_aggregation/account_aggregator_controller.dart';
import 'package:sakhy/ui/widgets/form_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';

// ignore: must_be_immutable
class AccountAggregatorAmount extends StatefulWidget {
  @override
  State<AccountAggregatorAmount> createState() =>
      _AccountAggregatorAmountState();
}

class _AccountAggregatorAmountState extends State<AccountAggregatorAmount> {
  NavAccountController _navAccountController = Get.put(NavAccountController());

  AccountAggregatorController _accountAggregatorController =
      Get.put(AccountAggregatorController());
  List<String> selectedAccount = [];

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
            Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: Container(
                child: TextFormField(
                  readOnly: true,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(
                      vertical: 0.0,
                      horizontal: 12.0,
                    ),
                    suffixIcon: Icon(
                      Icons.monetization_on_outlined,
                      color: AppColors.Alpine,
                      size: 20.w,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF2F2F2),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF2F2F2),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.Alpine),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: AppColors.Alpine),
                    ),
                    hintText: 'Amount ' +
                        _accountAggregatorController.sendAmount.text +
                        ' SAR',
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xffF2F2F2),
                    ),
                    errorStyle: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ),
            ),
            Styles.transparentDivider(),
            Styles.headingText("Choose option to pay :"),
            Styles.transparentDivider(),
            Obx(() => _navAccountController.accountsloadingProcess.value
                ? Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.Alpine,
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount:
                          _navAccountController.fetchedAccountList.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          selectedAccount.contains(_navAccountController
                                  .fetchedAccountList[index].accountName)
                              ? selectedAccount.remove(_navAccountController
                                  .fetchedAccountList[index].accountName)
                              : selectedAccount.add(_navAccountController
                                  .fetchedAccountList[index].accountName);

                          selectedAccount.forEach((e) {
                            print(e);
                          });

                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF333333),
                              border: selectedAccount.contains(
                                      _navAccountController
                                          .fetchedAccountList[index]
                                          .accountName)
                                  ? Border.all(
                                      color: AppColors.Alpine,
                                      width: 2,
                                    )
                                  : Border.all(
                                      color: Color(
                                        0xFF333333,
                                      ),
                                    ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(7.r),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                20,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _navAccountController
                                            .fetchedAccountList[index].bankName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.sp,
                                            color: AppColors.Alpine),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _navAccountController
                                            .fetchedAccountList[index]
                                            .accountType,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.sp,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        _navAccountController
                                                .fetchedAccountList[index]
                                                .balance +
                                            ' SAR',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
            Styles.transparentDivider(),
            Obx(() => _accountAggregatorController.loadingProcess.value
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.Alpine,
                    ),
                  )
                : fullWidthButton(
                    "Pay",
                    selectedAccount == []
                        ? () {}
                        : () {
                            _accountAggregatorController
                                .sendMoney(selectedAccount);
                          },
                  )),
            Styles.transparentDivider(),
          ],
        ),
      ),
    );
  }
}
