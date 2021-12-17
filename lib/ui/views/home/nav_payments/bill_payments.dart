import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakhy/models/account.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/route/route.dart' as route;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/home/nav_accounts/nav_accountS_controller.dart';
import 'package:sakhy/ui/views/home/nav_payments/Beneficiary_controller.dart';
import 'package:sakhy/ui/widgets/form_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';

class BillPayments extends StatefulWidget {
  @override
  _BillPaymentsState createState() => _BillPaymentsState();
}

class _BillPaymentsState extends State<BillPayments> {
  String _billType = "Bill Type";

  TextEditingController _billholdernameController = TextEditingController();
  TextEditingController _billNumberController = TextEditingController();
  BeneficiaryController _beneficiaryController =
      Get.put(BeneficiaryController());
  String _chooseAccount = "Choose Account";
  String accountBalance = "0.0";
  NavAccountController _navAccountController = Get.put(NavAccountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bill Payments"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
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
        child: Form(
          key: _beneficiaryController.billformKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Image.asset(
                  "assets/icons/bill-payments.png",
                  scale: 5,
                ),
                Styles.transparentDivider(),
                // Container(
                //   width: ScreenUtil().screenWidth,
                //   decoration: BoxDecoration(
                //     color: Colors.transparent,
                //     border: Border.all(color: Colors.white, width: 1),
                //   ),
                //   child: DropdownButton<String>(
                //     hint: Padding(
                //       padding: EdgeInsets.only(
                //           left: 15, bottom: 11, top: 11, right: 15),
                //       child: Text(
                //         _billType,
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontWeight: FontWeight.w600,
                //             fontSize: 15.sp),
                //       ),
                //     ),
                //     icon: IconButton(
                //       onPressed: null,
                //       icon: Icon(
                //         Icons.arrow_downward,
                //         color: AppColors.Alpine,
                //         size: 20.w,
                //       ),
                //     ),
                //     isExpanded: true,
                //     iconSize: 18,
                //     underline: Container(
                //       height: 0,
                //       color: Colors.transparent,
                //     ),
                //     onChanged: (String? newValue) {
                //       setState(() {
                //         _billType = newValue!;
                //       });
                //     },
                //     items: <String>['One', 'Two', 'Three', 'Four']
                //         .map<DropdownMenuItem<String>>((String value) {
                //       return DropdownMenuItem<String>(
                //         value: value,
                //         child: Text(
                //           value,
                //           style: TextStyle(
                //               color: Colors.black,
                //               fontWeight: FontWeight.w600,
                //               fontSize: 15.sp),
                //         ),
                //       );
                //     }).toList(),
                //   ),
                // ),
                Styles.transparentDivider(),
                Container(
                  width: ScreenUtil().screenWidth,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: 1),
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

                        accountBalance = newValue.balance;
                      });
                    },
                    items: _navAccountController.fetchedAccountList
                        .map((location) {
                      return DropdownMenuItem(
                        child: Text(
                          location.accountName,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp),
                        ),
                        value: location,
                      );
                    }).toList(),
                  ),
                ),
                Styles.transparentDivider(),

                formField(
                    TextInputType.text,
                    false,
                    _beneficiaryController.billAmount,
                    true,
                    Icons.person_outline,
                    context,
                    "Amount"),
                formField(
                    TextInputType.text,
                    false,
                    _beneficiaryController.billTitle,
                    true,
                    Icons.person_outline,
                    context,
                    "Name of the bill holder"),
                formField(
                    TextInputType.number,
                    false,
                    _beneficiaryController.billNumber,
                    true,
                    Icons.dialpad_outlined,
                    context,
                    "Bill Number"),
                Styles.transparentDivider(),
                Obx(
                  () => _beneficiaryController.loadingProcess.value
                      ? Center(
                          child: CircularProgressIndicator(
                          color: AppColors.Alpine,
                        ))
                      : fullWidthButton(
                          "Pay",
                          () =>
                              //Navigator.pushNamed(context, route.confirmWithFaceID),
                              _beneficiaryController.bill()),
                ),

                // fullWidthButton(
                //   "Check",
                //   () => Navigator.pushNamed(context, route.billDetails),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
