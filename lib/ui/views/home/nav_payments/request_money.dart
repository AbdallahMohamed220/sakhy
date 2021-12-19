import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sakhy/models/account.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/route/route.dart' as route;
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/home/nav_accounts/nav_accountS_controller.dart';
import 'package:sakhy/ui/views/home/nav_accounts/send_request_money_controller.dart';
import 'package:sakhy/ui/views/home/nav_payments/Beneficiary_controller.dart';
import 'package:sakhy/ui/widgets/form_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';

class RequestMoney extends StatefulWidget {
  @override
  _RequestMoneyState createState() => _RequestMoneyState();
}

class _RequestMoneyState extends State<RequestMoney> {
  String _chooseAccount = "Choose Account";
  String accountBalance = "0.0";
  bool _showBalance = false;
  bool _formbeneficiary = true;
  BeneficiaryController _beneficiaryController =
      Get.put(BeneficiaryController());
  SendRequestMoneyController _sendRequestMoneyController =
      Get.put(SendRequestMoneyController());
  NavAccountController _navAccountController = Get.put(NavAccountController());

  String beneficiaryName = '';

  @override
  void initState() {
    super.initState();
    initValues();
  }

  initValues() async {
    await _navAccountController.fetchAccounts();
    await _beneficiaryController.getLocalBeneficiary();
    await _beneficiaryController.getlnternationalBeneficiary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Money"),
        centerTitle: true,
      ),
      body: Form(
        key: _sendRequestMoneyController.reqestMoneyKey,
        child: Obx(() => _beneficiaryController.loadingProcess.value &&
                _navAccountController.accountsloadingProcess.value
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.Alpine,
                ),
              )
            : Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  top: 15.h,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Styles.transparentDivider(),
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
                                _sendRequestMoneyController.bankName =
                                    _chooseAccount;
                                accountBalance = newValue.balance;
                              });
                            },
                            items: _navAccountController.fetchedAccountList
                                .map((location) {
                              return DropdownMenuItem(
                                child: Text(
                                  location.accountName,
                                  style: TextStyle(
                                      color: AppColors.Alpine,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.sp),
                                ),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Styles.transparentDivider(),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _showBalance = !_showBalance;
                              setState(() {});
                            },
                            child: Icon(
                              _showBalance
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.Alpine,
                            ),
                          ),
                          SizedBox(
                            width: 8.h,
                          ),
                          Text(
                            _showBalance ? accountBalance : 'Show Balance',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          )
                        ],
                      ),
                      Styles.transparentDivider(),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _formbeneficiary = true;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: _formbeneficiary
                                    ? AppColors.Alpine
                                    : Color(0xFF4F4F4F),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7.r),
                                  ),
                                ),
                                padding: EdgeInsets.all(0),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: 10.w, bottom: 10.w),
                                child: Text(
                                  'From Beneficiaries ',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12.h,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _formbeneficiary = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: !_formbeneficiary
                                    ? AppColors.Alpine
                                    : Color(0xFF4F4F4F),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7.r),
                                  ),
                                ),
                                padding: EdgeInsets.all(0),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: 10.w, bottom: 10.w),
                                child: Text(
                                  'Not a Beneficiary',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Styles.transparentDivider(),
                      formField(
                        TextInputType.number,
                        false,
                        _sendRequestMoneyController.iban,
                        true,
                        Icons.qr_code,
                        context,
                        "IBAN  or Mobile Number",
                      ),
                      Styles.transparentDivider(),
                      formField(
                        TextInputType.number,
                        false,
                        _sendRequestMoneyController.requestAmount,
                        true,
                        Icons.monetization_on_outlined,
                        context,
                        "Amount SAR",
                      ),
                      Styles.transparentDivider(),
                      SizedBox(
                        height: 5.h,
                      ),
                      formField(
                        TextInputType.text,
                        false,
                        _sendRequestMoneyController.requestDescription,
                        true,
                        Icons.description,
                        context,
                        "transaction Description",
                      ),
                      Styles.transparentDivider(),
                      Obx(
                        () => _sendRequestMoneyController.loadingProcess.value
                            ? Center(
                                child: CircularProgressIndicator(
                                color: AppColors.Alpine,
                              ))
                            : fullWidthButton(
                                "Send",
                                () => _sendRequestMoneyController
                                    .requestMoney(beneficiaryName),
                              ),
                      ),
                      Styles.transparentDivider(),
                    ],
                  ),
                ),
              )),
      ),
    );
    //  Scaffold(
    //   appBar: AppBar(
    //     title: Text("Request Money"),
    //     centerTitle: true,
    //     leading: IconButton(
    //       onPressed: () => Navigator.pop(context),
    //       icon: Icon(
    //         Icons.arrow_back,
    //         size: 20.w,
    //       ),
    //     ),
    //   ),
    //   body: Form(
    //     key: _beneficiaryController.requestMoneyBenefciarFormKey,
    //     child: Padding(
    //       padding: EdgeInsets.only(
    //         left: 15.w,
    //         right: 15.w,
    //         top: 15.h,
    //       ),
    //       child: SingleChildScrollView(
    //         scrollDirection: Axis.vertical,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             ElevatedButton(
    //               onPressed: () {
    //                 setState(() {
    //                   _beneficiary = !_beneficiary;
    //                 });
    //               },
    //               style: ElevatedButton.styleFrom(
    //                 padding: EdgeInsets.all(0),
    //                 primary: Color(0xFF333333),
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.all(
    //                     Radius.circular(7.r),
    //                   ),
    //                 ),
    //               ),
    //               child: Container(
    //                 height: 65.h,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.all(
    //                     Radius.circular(7.r),
    //                   ),
    //                 ),
    //                 child: Padding(
    //                   padding: EdgeInsets.only(left: 15.w, right: 10.w),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Text(
    //                         "From your Beneficiaries",
    //                         style: TextStyle(
    //                             fontWeight: FontWeight.w600, fontSize: 18.sp),
    //                       ),
    //                       _beneficiary
    //                           ? Icon(
    //                               Icons.arrow_downward_outlined,
    //                               color: AppColors.Alpine,
    //                               size: 20.w,
    //                             )
    //                           : Icon(
    //                               Icons.arrow_upward_outlined,
    //                               color: AppColors.Alpine,
    //                               size: 20.w,
    //                             ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             SizedBox(
    //               height: 10.h,
    //             ),
    //             _beneficiary == false
    //                 ? Container()
    //                 : Container(
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "Select",
    //                           style: TextStyle(
    //                               fontWeight: FontWeight.w600, fontSize: 19.sp),
    //                         ),
    //                         SizedBox(
    //                           height: 5.h,
    //                         ),
    //                         Obx(() => _beneficiaryController
    //                                 .loadingProcess.value
    //                             ? Center(
    //                                 child: CircularProgressIndicator(
    //                                 color: AppColors.Alpine,
    //                               ))
    //                             : AspectRatio(
    //                                 aspectRatio: 3.7,
    //                                 child: Container(
    //                                   child: ListView.builder(
    //                                     scrollDirection: Axis.horizontal,
    //                                     itemCount: _beneficiaryController
    //                                         .fetchedLocalBeneficiaryList.length,
    //                                     itemBuilder: (_, index) {
    //                                       return InkWell(
    //                                         onTap: () {
    //                                           beneficiaryName =
    //                                               _beneficiaryController
    //                                                   .fetchedLocalBeneficiaryList[
    //                                                       index]
    //                                                   .beneficiaryName;

    //                                           setState(() {});
    //                                         },
    //                                         child: Padding(
    //                                           padding:
    //                                               const EdgeInsets.all(5.0),
    //                                           child: Container(
    //                                             decoration: BoxDecoration(
    //                                               borderRadius:
    //                                                   BorderRadius.circular(12),
    //                                               border: Border.all(
    //                                                 width: 2,
    //                                                 color: beneficiaryName ==
    //                                                         _beneficiaryController
    //                                                             .fetchedLocalBeneficiaryList[
    //                                                                 index]
    //                                                             .beneficiaryName
    //                                                     ? AppColors.Alpine
    //                                                     : Color(0xFF1C1C1C),
    //                                               ),
    //                                             ),
    //                                             width: 75.w,
    //                                             child: Column(
    //                                               mainAxisAlignment:
    //                                                   MainAxisAlignment.center,
    //                                               crossAxisAlignment:
    //                                                   CrossAxisAlignment.center,
    //                                               children: [
    //                                                 CircleAvatar(
    //                                                   backgroundColor:
    //                                                       Colors.white,
    //                                                 ),
    //                                                 SizedBox(
    //                                                   height: 5.h,
    //                                                 ),
    //                                                 Text(
    //                                                   _beneficiaryController
    //                                                       .fetchedLocalBeneficiaryList[
    //                                                           index]
    //                                                       .beneficiaryName,
    //                                                   textAlign:
    //                                                       TextAlign.center,
    //                                                   style: TextStyle(
    //                                                       fontSize: 15.sp),
    //                                                 ),
    //                                               ],
    //                                             ),
    //                                           ),
    //                                         ),
    //                                       );
    //                                     },
    //                                   ),
    //                                 ),
    //                               )),
    //                         SizedBox(
    //                           height: 10.h,
    //                         ),
    //                         Text(
    //                           "Amount",
    //                           style: TextStyle(
    //                               fontWeight: FontWeight.w600, fontSize: 19.sp),
    //                         ),
    //                         SizedBox(
    //                           height: 5.h,
    //                         ),
    //                         formField(
    //                             TextInputType.number,
    //                             false,
    //                             _amountController,
    //                             true,
    //                             Icons.monetization_on_outlined,
    //                             context,
    //                             "Enter The Amount"),
    //                         Styles.transparentDivider(),
    //                         Obx(
    //                           () => _beneficiaryController
    //                                   .beneficiaryrequestMoneyloadingProcess
    //                                   .value
    //                               ? Center(
    //                                   child: CircularProgressIndicator(
    //                                     color: AppColors.Alpine,
    //                                   ),
    //                                 )
    //                               : fullWidthButton(
    //                                   "Request",
    //                                   () => _beneficiaryController
    //                                       .beneficiaryRequestMoney(
    //                                           beneficiaryName),
    //                                 ),
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //             Styles.transparentDivider(),
    //             ElevatedButton(
    //               onPressed: () {
    //                 setState(() {
    //                   _notBeneficiary = !_notBeneficiary;
    //                 });
    //               },
    //               style: ElevatedButton.styleFrom(
    //                 padding: EdgeInsets.all(0),
    //                 primary: Color(0xFF333333),
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.all(
    //                     Radius.circular(7.r),
    //                   ),
    //                 ),
    //               ),
    //               child: Container(
    //                 height: 65.h,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.all(
    //                     Radius.circular(7.r),
    //                   ),
    //                 ),
    //                 child: Padding(
    //                   padding: EdgeInsets.only(left: 15.w, right: 10.w),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Text(
    //                         "Not Beneficiary",
    //                         style: TextStyle(
    //                             fontWeight: FontWeight.w600, fontSize: 18.sp),
    //                       ),
    //                       _notBeneficiary
    //                           ? Icon(
    //                               Icons.arrow_downward_outlined,
    //                               color: AppColors.Alpine,
    //                               size: 20.w,
    //                             )
    //                           : Icon(
    //                               Icons.arrow_upward_outlined,
    //                               color: AppColors.Alpine,
    //                               size: 20.w,
    //                             ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             SizedBox(
    //               height: 10.h,
    //             ),
    //             _notBeneficiary == false
    //                 ? Container()
    //                 : Container(
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "Phone Number",
    //                           style: TextStyle(
    //                               fontWeight: FontWeight.w600, fontSize: 19.sp),
    //                         ),
    //                         SizedBox(
    //                           height: 5.h,
    //                         ),
    //                         formField(
    //                             TextInputType.number,
    //                             false,
    //                             _numberController,
    //                             true,
    //                             Icons.call_outlined,
    //                             context,
    //                             "Phone"),
    //                         SizedBox(
    //                           height: 10.h,
    //                         ),
    //                         Text(
    //                           "Amount",
    //                           style: TextStyle(
    //                               fontWeight: FontWeight.w600, fontSize: 19.sp),
    //                         ),
    //                         SizedBox(
    //                           height: 5.h,
    //                         ),
    //                         formField(
    //                             TextInputType.number,
    //                             false,
    //                             _amountController,
    //                             true,
    //                             Icons.monetization_on_outlined,
    //                             context,
    //                             "Enter The Amount"),
    //                         Styles.transparentDivider(),
    //                         fullWidthButton(
    //                           "Request",
    //                           () => Navigator.pushNamed(
    //                               context, route.confirmWithFaceID),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
