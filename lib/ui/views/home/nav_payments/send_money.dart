import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sakhy/models/account.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/home/nav_accounts/nav_accountS_controller.dart';
import 'package:sakhy/ui/views/home/nav_accounts/send_request_money_controller.dart';
import 'package:sakhy/ui/views/home/nav_payments/Beneficiary_controller.dart';
import 'package:sakhy/ui/widgets/bank_card.dart';
import 'package:sakhy/ui/widgets/form_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SendMoney extends StatefulWidget {
  @override
  _SendMoneyState createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  // List<String> _bankNames = ["Riyad Bank ", "Al-Rajhi Bank", "Al-Ahly Bank"];
  // List<String> _bankBalance = ["2000", "1000", "1500"];
  // List<Color> _cardColors = [
  //   Colors.blue,
  //   Colors.lightGreen,
  //   Colors.deepPurpleAccent
  // ];

  // int _dotPosition = 0;
  // String _reasonForTransfer = "Reason For Transfer";
  // TextEditingController _amountController = TextEditingController();
  // String _reasonForSending = "";
  NavAccountController _navAccountController = Get.put(NavAccountController());
  SendRequestMoneyController _sendRequestMoneyController =
      Get.put(SendRequestMoneyController());

  String beneficiaryName = '';
  String accountBalance = "0.0";
  bool _formbeneficiary = true;

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

  BeneficiaryController _beneficiaryController =
      Get.put(BeneficiaryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Money"),
        centerTitle: true,
      ),
      body: Form(
        key: _sendRequestMoneyController.sendMoneyKey,
        child: Obx(() => _beneficiaryController.loadingProcess.value ||
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
                        height: 170.h,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              _navAccountController.fetchedAccountList.length,
                          itemBuilder: (context, i) {
                            _sendRequestMoneyController.bankName =
                                _navAccountController
                                    .fetchedAccountList[0].accountName;
                            return VisibilityDetector(
                              key: Key("unique key"),
                              onVisibilityChanged: (VisibilityInfo info) {
                                _sendRequestMoneyController.bankName =
                                    _navAccountController
                                        .fetchedAccountList[i].accountName;
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: sakhyCard(
                                  int.parse(_navAccountController
                                      .fetchedAccountList[i].color),
                                  _navAccountController
                                      .fetchedAccountList[i].cardNumber,
                                  _navAccountController
                                      .fetchedAccountList[i].bankName,
                                  "${_navAccountController.fetchedAccountList[i].balance} SAR",
                                  _navAccountController
                                      .fetchedAccountList[i].bankLogo,
                                  () {},
                                  context,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Styles.transparentDivider(),
                      // Row(
                      //   children: [
                      //     InkWell(
                      //       onTap: () {
                      //         _showBalance = !_showBalance;
                      //         setState(() {});
                      //       },
                      //       child: Icon(
                      //         _showBalance
                      //             ? Icons.visibility
                      //             : Icons.visibility_off,
                      //         color: AppColors.Alpine,
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 8.h,
                      //     ),
                      //     Text(
                      //       _showBalance ? accountBalance : 'Show Balance',
                      //       style: TextStyle(
                      //         fontSize: 14.sp,
                      //       ),
                      //     )
                      //   ],
                      // ),

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
                      SizedBox(
                        height: 15,
                      ),
                      AspectRatio(
                        aspectRatio: 3.7,
                        child: Container(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _beneficiaryController
                                .fetchedLocalBeneficiaryList.length,
                            itemBuilder: (_, index) {
                              return InkWell(
                                onTap: () {
                                  beneficiaryName = _beneficiaryController
                                      .fetchedLocalBeneficiaryList[index]
                                      .beneficiaryName;

                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        width: 2,
                                        color: beneficiaryName ==
                                                _beneficiaryController
                                                    .fetchedLocalBeneficiaryList[
                                                        index]
                                                    .beneficiaryName
                                            ? AppColors.Alpine
                                            : Color(0xFF1C1C1C),
                                      ),
                                    ),
                                    width: 75.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          _beneficiaryController
                                              .fetchedLocalBeneficiaryList[
                                                  index]
                                              .beneficiaryName,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      formField(
                        TextInputType.number,
                        false,
                        _sendRequestMoneyController.sendAmount,
                        true,
                        Icons.monetization_on_outlined,
                        context,
                        "Amount SAR",
                      ),

                      SizedBox(
                        height: 5.h,
                      ),
                      formField(
                        TextInputType.text,
                        false,
                        _sendRequestMoneyController.sendDescription,
                        true,
                        Icons.description,
                        context,
                        "Transaction Description",
                      ),
                      Styles.transparentDivider(),
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
                                    .sendMoney(beneficiaryName),
                              ),
                      ),
                      Styles.transparentDivider(),
                    ],
                  ),
                ),
              )),
      ),
    );

    // Scaffold(
    //   appBar: AppBar(
    //     title: Text("Send Money"),
    //     centerTitle: true,
    //   ),
    //   body: Padding(
    //     padding: EdgeInsets.only(
    //       left: 15.w,
    //       right: 15.w,
    //       top: 15.h,
    //     ),
    //     child: Form(
    //       key: _beneficiaryController.sendMoneyBenefciarFormKey,
    //       child: SingleChildScrollView(
    //         scrollDirection: Axis.vertical,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Obx(() => _navAccountController.accountsloadingProcess.value
    //                 ? Center(
    //                     child: CircularProgressIndicator(
    //                       color: AppColors.Alpine,
    //                     ),
    //                   )
    //                 : _navAccountController.fetchedAccountList.isEmpty
    //                     ? Center(child: Text('No Accounts / Cards Found'))
    //                     : Container(
    //                         height: 170.h,
    //                         child: ListView.builder(
    //                           physics: BouncingScrollPhysics(),
    //                           scrollDirection: Axis.horizontal,
    //                           itemCount: _navAccountController
    //                               .fetchedAccountList.length,
    //                           itemBuilder: (context, i) => VisibilityDetector(
    //                               key: Key("unique key"),
    //                               onVisibilityChanged: (VisibilityInfo info) {
    //                                 print(_navAccountController
    //                                     .fetchedAccountList[i].accountName);
    //                               },
    //                               child: Padding(
    //                                   padding: const EdgeInsets.symmetric(
    //                                       horizontal: 5),
    //                                   child: sakhyCard(
    //                                     int.parse(_navAccountController
    //                                         .fetchedAccountList[i].color),
    //                                     _navAccountController
    //                                         .fetchedAccountList[i].accountName,
    //                                     "${_navAccountController.fetchedAccountList[i].balance} SAR",
    //                                     () {},
    //                                     context,
    //                                   ))),
    //                         ),
    //                       )),

    //             Styles.transparentDivider(),
    //             // Row(
    //             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             //   children: [
    //             //     Text(
    //             //       "To",
    //             //       style:
    //             //           TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
    //             //     ),
    //             //     Icon(
    //             //       Icons.person_add_alt_1_outlined,
    //             //       color: AppColors.Alpine,
    //             //       size: 20.w,
    //             //     ),
    //             //   ],
    //             // ),
    //             Styles.transparentDivider(),
    //             // AspectRatio(
    //             //   aspectRatio: 3.7,
    //             //   child: Container(
    //             //     child: ListView.builder(
    //             //       scrollDirection: Axis.horizontal,
    //             //       itemCount: 10,
    //             //       itemBuilder: (_, index) {
    //             //         return Container(
    //             //           width: 75.w,
    //             //           child: Column(
    //             //             mainAxisAlignment: MainAxisAlignment.center,
    //             //             crossAxisAlignment: CrossAxisAlignment.center,
    //             //             children: [
    //             //               CircleAvatar(
    //             //                 backgroundColor: Colors.white,
    //             //               ),
    //             //               SizedBox(
    //             //                 height: 5.h,
    //             //               ),
    //             //               Text(
    //             //                 "Afran\nSarkar",
    //             //                 textAlign: TextAlign.center,
    //             //                 style: TextStyle(fontSize: 15.sp),
    //             //               ),
    //             //             ],
    //             //           ),
    //             //         );
    //             //       },
    //             //     ),
    //             //   ),
    //             // ),
    //             Styles.transparentDivider(),
    //             Text(
    //               "Amount",
    //               style:
    //                   TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
    //             ),
    //             SizedBox(
    //               height: 8.h,
    //             ),
    //             formField(
    //                 TextInputType.number,
    //                 false,
    //                 _beneficiaryController.sendMoneyAmount,
    //                 true,
    //                 Icons.monetization_on_outlined,
    //                 context,
    //                 "Enter The Amount"),
    //             Styles.transparentDivider(),
    //             // Text(
    //             //   "Reason of transfer",
    //             //   style:
    //             //   TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
    //             // ),
    //             // SizedBox(height: 8.h,),
    //             Text(
    //               "Reason of transfer",
    //               style:
    //                   TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
    //             ),
    //             SizedBox(
    //               height: 8.h,
    //             ),
    //             formField(
    //                 TextInputType.text,
    //                 false,
    //                 _beneficiaryController.sendMoneyReason,
    //                 true,
    //                 Icons.monetization_on_outlined,
    //                 context,
    //                 "Enter The Reason"),
    //             Styles.transparentDivider(),
    //             // Container(
    //             //   width: ScreenUtil().screenWidth,
    //             //   decoration: BoxDecoration(
    //             //     color: Colors.transparent,
    //             //     border: Border.all(color: Colors.white, width: 1),
    //             //   ),
    //             //   child: DropdownButton<String>(
    //             //     hint: Padding(
    //             //       padding: EdgeInsets.only(
    //             //           left: 15, bottom: 11, top: 11, right: 15),
    //             //       child: Text(
    //             //         _reasonForSending,
    //             //         style: TextStyle(
    //             //             color: Colors.white,
    //             //             fontWeight: FontWeight.w500,fontSize: 15.sp),
    //             //       ),
    //             //     ),
    //             //     icon: IconButton(
    //             //       onPressed: null,
    //             //       icon: Icon(
    //             //         Icons.arrow_downward,
    //             //         color: AppColors.Alpine,
    //             //         size: 20.w,
    //             //       ),
    //             //     ),
    //             //     isExpanded: true,
    //             //     iconSize: 18,
    //             //     underline: Container(
    //             //       height: 0,
    //             //       color: Colors.transparent,
    //             //     ),
    //             //     onChanged: (String? newValue) {
    //             //       setState(() {
    //             //         _reasonForSending = newValue!;
    //             //       });
    //             //     },
    //             //     items: <String>['One', 'Two', 'Three', 'Four']
    //             //         .map<DropdownMenuItem<String>>((String value) {
    //             //       return DropdownMenuItem<String>(
    //             //         value: value,
    //             //         child: Text(
    //             //           value,
    //             //           style: TextStyle(
    //             //               color: Colors.black,
    //             //               fontWeight: FontWeight.w500,fontSize: 15.sp),
    //             //         ),
    //             //       );
    //             //     }).toList(),
    //             //   ),
    //             // ),
    //             Styles.transparentDivider(),
    //             Obx(
    //               () => _beneficiaryController.loadingProcess.value
    //                   ? Center(
    //                       child: CircularProgressIndicator(
    //                         color: AppColors.Alpine,
    //                       ),
    //                     )
    //                   : fullWidthButton(
    //                       "Send",
    //                       () => _beneficiaryController.beneficiarySendMoney(''),
    //                     ),
    //             ),

    //             Styles.transparentDivider(),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
