import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/route/route.dart' as route;
import 'package:sakhy/ui/views/home/nav_payments/Beneficiary_controller.dart';
import 'package:sakhy/ui/views/home/nav_payments/beneficiary_details.dart';

class LocalBeneficiaries extends StatefulWidget {
  @override
  _LocalBeneficiariesState createState() => _LocalBeneficiariesState();
}

class _LocalBeneficiariesState extends State<LocalBeneficiaries> {
  BeneficiaryController _beneficiaryController =
      Get.put(BeneficiaryController());
  @override
  void initState() {
    super.initState();
    _beneficiaryController.getLocalBeneficiary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Beneficiaries"),
        centerTitle: true,
        actions: [
          // IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.add,
          //       size: 20.w,
          //       color: AppColors.Alpine,
          //     ))
        ],
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
        child: Column(
          children: [
            Obx(
              () => _beneficiaryController.loadingProcess.value
                  ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.Alpine,
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: _beneficiaryController
                            .fetchedLocalBeneficiaryList.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () => Get.to(BeneficiaryDetails(
                                name: _beneficiaryController
                                    .fetchedLocalBeneficiaryList[index]
                                    .beneficiaryName,
                                bankName: _beneficiaryController
                                    .fetchedLocalBeneficiaryList[index]
                                    .bankName,
                                iban: _beneficiaryController
                                    .fetchedLocalBeneficiaryList[index].iban,
                                islocal: _beneficiaryController
                                    .fetchedLocalBeneficiaryList[index].isLocal,
                                id: _beneficiaryController
                                    .fetchedLocalBeneficiaryList[index].id)),
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
                                padding:
                                    EdgeInsets.only(left: 15.w, right: 15.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _beneficiaryController
                                          .fetchedLocalBeneficiaryList[index]
                                          .beneficiaryName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15.sp),
                                    ),
                                    Icon(
                                      Icons.compare_arrows,
                                      size: 20.w,
                                      color: AppColors.Alpine,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
