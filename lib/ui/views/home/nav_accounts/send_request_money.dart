import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
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
import 'package:sakhy/ui/widgets/bank_card.dart';
import 'package:sakhy/ui/widgets/form_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';

class SendRequestMoney extends StatefulWidget {
  @override
  _SendRequestMoneyState createState() => _SendRequestMoneyState();
}

class _SendRequestMoneyState extends State<SendRequestMoney> {
  // List<String> _bankNames = ["Riyad Bank ", "Al-Rajhi Bank", "Al-Ahly Bank"];
  // List<String> _bankBalance = ["2000", "1000", "1500"];
  // List<Color> _cardColors = [
  //   Colors.blue,
  //   Colors.lightGreen,
  //   Colors.deepPurpleAccent
  // ];

  String _chooseAccount = "Choose Account";
  bool _isSendMoneyActive = true;
  NavAccountController _navAccountController = Get.put(NavAccountController());
  BeneficiaryController _beneficiaryController =
      Get.put(BeneficiaryController());
  SendRequestMoneyController _sendRequestMoneyController =
      Get.put(SendRequestMoneyController());

  String beneficiaryid = '';
  @override
  void initState() {
    super.initState();
    _beneficiaryController.getLocalBeneficiary();
    _beneficiaryController.getlnternationalBeneficiary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send / Request Money"),
        centerTitle: true,
      ),
      body: Form(
        key: _isSendMoneyActive
            ? _sendRequestMoneyController.sendMoneyKey
            : _sendRequestMoneyController.reqestMoneyKey,
        child: Obx(() => _beneficiaryController.loadingProcess.value
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
                                    _isSendMoneyActive = true;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: _isSendMoneyActive
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
                                  padding:
                                      EdgeInsets.only(top: 10.w, bottom: 10.w),
                                  child: Text(
                                    'Send Money',
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
                                      _isSendMoneyActive = false;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: !_isSendMoneyActive
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
                                    padding: EdgeInsets.only(
                                        top: 10.w, bottom: 10.w),
                                    child: Text(
                                      'Request Money',
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
                      //         _reasonForSending,
                      //         style: TextStyle(
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.w500,
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
                      //         _reasonForSending = newValue!;
                      //       });
                      //     },
                      //     items:       _navAccountController
                      //               .fetchedAccountList
                      //         .map<DropdownMenuItem(( value) {
                      //       return DropdownMenuItem(
                      //         value: value,
                      //         child: Text(
                      //           value,
                      //           style: TextStyle(
                      //               color: Colors.black,
                      //               fontWeight: FontWeight.w500,
                      //               fontSize: 15.sp),
                      //         ),
                      //       );
                      //     }).toList(),
                      //   ),
                      // ),
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
                              _sendRequestMoneyController.bankName =
                                  _chooseAccount;
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
                      Row(
                        children: [
                          Icon(
                            Icons.visibility,
                            color: AppColors.Alpine,
                          ),
                          SizedBox(
                            width: 8.h,
                          ),
                          Text(
                            'Show Balance',
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
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF4F4F4F),
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
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF4F4F4F),
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
                      !_isSendMoneyActive
                          ? formField(
                              TextInputType.number,
                              false,
                              _sendRequestMoneyController.iban,
                              true,
                              Icons.qr_code,
                              context,
                              "IBAN  or Mobile Number",
                            )
                          : AspectRatio(
                              aspectRatio: 3.7,
                              child: Container(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _beneficiaryController
                                      .fetchedLocalBeneficiaryList.length,
                                  itemBuilder: (_, index) {
                                    return InkWell(
                                      onTap: () {
                                        beneficiaryid = _beneficiaryController
                                            .fetchedLocalBeneficiaryList[index]
                                            .id;

                                        setState(() {});
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              width: 2,
                                              color: beneficiaryid ==
                                                      _beneficiaryController
                                                          .fetchedLocalBeneficiaryList[
                                                              index]
                                                          .id
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
                                                style:
                                                    TextStyle(fontSize: 15.sp),
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
                      Styles.transparentDivider(),
                      formField(
                        TextInputType.number,
                        false,
                        _isSendMoneyActive
                            ? _sendRequestMoneyController.sendAmount
                            : _sendRequestMoneyController.requestAmount,
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
                        _isSendMoneyActive
                            ? _sendRequestMoneyController.sendDescription
                            : _sendRequestMoneyController.requestDescription,
                        true,
                        Icons.description,
                        context,
                        "transaction Description",
                      ),
                      Styles.transparentDivider(),
                      Obx(
                        () => _sendRequestMoneyController.loadingProcess.value
                            ? Center(child: CircularProgressIndicator())
                            : fullWidthButton(
                                "Send",
                                () => _isSendMoneyActive
                                    ? _sendRequestMoneyController
                                        .sendMoney(beneficiaryid)
                                    : _sendRequestMoneyController
                                        .requestMoney(beneficiaryid),
                              ),
                      ),

                      Styles.transparentDivider(),
                    ],
                  ),
                ),
              )),
      ),
    );
  }
}
