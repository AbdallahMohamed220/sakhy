import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakhy/models/bank.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/route/route.dart' as route;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/home/nav_home/nav_home_controller.dart';
import 'package:sakhy/ui/views/home/nav_payments/Beneficiary_controller.dart';
import 'package:sakhy/ui/widgets/form_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';

class AddLocalBeneficiary extends StatefulWidget {
  @override
  _AddLocalBeneficiaryState createState() => _AddLocalBeneficiaryState();
}

class _AddLocalBeneficiaryState extends State<AddLocalBeneficiary> {
  String _sarieorManual = "bank name";
//  String _idorPhoneorEmail = "Id or phone number or email";

  NavHomeController _navHomeController = Get.put(NavHomeController());
  BeneficiaryController _beneficiaryController =
      Get.put(BeneficiaryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Local Beneficiary"),
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
        key: _beneficiaryController.addLocalBeneficiaryformKey,
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
            top: 20.h,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Image.asset(
                  "assets/icons/account.png",
                  scale: 5,
                ),
                Styles.transparentDivider(),
                formField(
                  TextInputType.text,
                  false,
                  _beneficiaryController.beneficiaryname,
                  true,
                  Icons.person_outline,
                  context,
                  "Full Name",
                ),
                formField(
                  TextInputType.text,
                  false,
                  _beneficiaryController.beneficiaryAlias,
                  true,
                  Icons.person_outline,
                  context,
                  "Alias Name",
                ),
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
                //         _sarieorManual,
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
                //         _sarieorManual = newValue!;
                //       });
                //     },
                //     items: _navHomeController.fetchedBankList
                //         .map<DropdownMenuItem<>((String value) {
                //       return DropdownMenuItem<>(
                //         value: value,
                //         child: Text(
                //           value,
                //           style: TextStyle(
                //               color: Colors.black,
                //               fontWeight: FontWeight.w600,
                //               fontSize: 15.sp),
                //         ),
                //       );
                //     })
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
                        _sarieorManual,
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
                    onChanged: (Bank? newValue) {
                      setState(() {
                        _sarieorManual = newValue!.name;
                        _beneficiaryController.bankName = _sarieorManual;
                      });
                    },
                    items: _navHomeController.fetchedBankList.map((location) {
                      return DropdownMenuItem(
                        child: Text(
                          location.name,
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
                //         _idorPhoneorEmail,
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
                //         _idorPhoneorEmail = newValue!;
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
                Obx(() => _beneficiaryController.loadingProcess.value
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.Alpine,
                        ),
                      )
                    : fullWidthButton(
                        "Add",
                        () => _beneficiaryController.addLocalBeneficiary(),
                      )),
                //Navigator.pushNamed(
                //     context, route.addLocalBeneficiarySarie)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
