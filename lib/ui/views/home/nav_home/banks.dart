import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/home/nav_home/login_bank.dart';
import 'package:sakhy/ui/views/home/nav_home/nav_home_controller.dart';
import 'package:sakhy/ui/widgets/bank_card.dart';

class Banks extends StatefulWidget {
  @override
  _BanksState createState() => _BanksState();
}

class _BanksState extends State<Banks> {
  NavHomeController _navHomeController = Get.put(NavHomeController());

  @override
  void initState() {
    super.initState();
    _navHomeController.fetchBanks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Styles.headingText("Banks"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_outlined,
            color: AppColors.Alpine,
            size: 20.w,
          ),
        ),
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
        ),
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Styles.headingText("Your Accounts"),
                Styles.transparentDivider(),
                SizedBox(
                  height: 16.h,
                ),
                Obx(() => _navHomeController.fetchedBankloadingProcess.value
                    ? Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.Alpine,
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: _navHomeController.fetchedBankList.length,
                          itemBuilder: (_, index) {
                            return banksCard(
                              _navHomeController.fetchedBankList[index].name,
                              int.parse(_navHomeController
                                  .fetchedBankList[index].color),
                              _navHomeController
                                  .fetchedBankList[index].identifier,
                              () {
                                Get.to(
                                  LoginBank(
                                    bankId: _navHomeController
                                        .fetchedBankList[index].id,
                                  ),
                                );
                              },
                              context,
                            );
                          },
                        ),
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
