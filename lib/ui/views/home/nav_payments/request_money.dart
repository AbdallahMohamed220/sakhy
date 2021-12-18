import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/route/route.dart' as route;
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/home/nav_accounts/send_request_money_controller.dart';
import 'package:sakhy/ui/views/home/nav_payments/Beneficiary_controller.dart';
import 'package:sakhy/ui/widgets/form_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';

class RequestMoney extends StatefulWidget {
  @override
  _RequestMoneyState createState() => _RequestMoneyState();
}

class _RequestMoneyState extends State<RequestMoney> {
  bool _beneficiary = false;
  bool _notBeneficiary = false;
  TextEditingController _amountController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  BeneficiaryController _beneficiaryController =
      Get.put(BeneficiaryController());
  SendRequestMoneyController _sendRequestMoneyController =
      Get.put(SendRequestMoneyController());

  String beneficiaryName = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _beneficiaryController.getLocalBeneficiary();
    _beneficiaryController.getlnternationalBeneficiary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Money"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: 20.w,
          ),
        ),
      ),
      body: Form(
        key: _beneficiaryController.requestMoneyBenefciarFormKey,
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
            top: 15.h,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _beneficiary = !_beneficiary;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    primary: Color(0xFF333333),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7.r),
                      ),
                    ),
                  ),
                  child: Container(
                    height: 65.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.w, right: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "From your Beneficiaries",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18.sp),
                          ),
                          _beneficiary
                              ? Icon(
                                  Icons.arrow_downward_outlined,
                                  color: AppColors.Alpine,
                                  size: 20.w,
                                )
                              : Icon(
                                  Icons.arrow_upward_outlined,
                                  color: AppColors.Alpine,
                                  size: 20.w,
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                _beneficiary == false
                    ? Container()
                    : Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 19.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Obx(() => _beneficiaryController
                                    .loadingProcess.value
                                ? Center(
                                    child: CircularProgressIndicator(
                                    color: AppColors.Alpine,
                                  ))
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
                                              beneficiaryName =
                                                  _beneficiaryController
                                                      .fetchedLocalBeneficiaryList[
                                                          index]
                                                      .beneficiaryName;

                                              setState(() {});
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
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
                                                      backgroundColor:
                                                          Colors.white,
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Text(
                                                      _beneficiaryController
                                                          .fetchedLocalBeneficiaryList[
                                                              index]
                                                          .beneficiaryName,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 15.sp),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  )),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "Amount",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 19.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            formField(
                                TextInputType.number,
                                false,
                                _amountController,
                                true,
                                Icons.monetization_on_outlined,
                                context,
                                "Enter The Amount"),
                            Styles.transparentDivider(),
                            Obx(
                              () => _beneficiaryController.loadingProcess.value
                                  ? Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.Alpine,
                                      ),
                                    )
                                  : fullWidthButton(
                                      "Request",
                                      () => _beneficiaryController
                                          .beneficiaryRequestMoney(
                                              beneficiaryName),
                                    ),
                            )
                          ],
                        ),
                      ),
                Styles.transparentDivider(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _notBeneficiary = !_notBeneficiary;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    primary: Color(0xFF333333),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7.r),
                      ),
                    ),
                  ),
                  child: Container(
                    height: 65.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.w, right: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Not Beneficiary",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18.sp),
                          ),
                          _notBeneficiary
                              ? Icon(
                                  Icons.arrow_downward_outlined,
                                  color: AppColors.Alpine,
                                  size: 20.w,
                                )
                              : Icon(
                                  Icons.arrow_upward_outlined,
                                  color: AppColors.Alpine,
                                  size: 20.w,
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                _notBeneficiary == false
                    ? Container()
                    : Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Phone Number",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 19.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            formField(
                                TextInputType.number,
                                false,
                                _numberController,
                                true,
                                Icons.call_outlined,
                                context,
                                "Phone"),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "Amount",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 19.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            formField(
                                TextInputType.number,
                                false,
                                _amountController,
                                true,
                                Icons.monetization_on_outlined,
                                context,
                                "Enter The Amount"),
                            Styles.transparentDivider(),
                            fullWidthButton(
                              "Request",
                              () => Navigator.pushNamed(
                                  context, route.confirmWithFaceID),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
