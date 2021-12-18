import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/home/nav_accounts/nav_accountS_controller.dart';
import 'package:sakhy/ui/views/home/nav_home/banks.dart';
import 'package:sakhy/ui/views/home/nav_home/nav_home_controller.dart';
import 'package:sakhy/ui/widgets/bank_card.dart';
import 'package:sakhy/ui/widgets/nav_drawer.dart';
import 'package:sakhy/ui/widgets/nav_home_items.dart';
import 'package:sakhy/ui/route/route.dart' as route;

class NavHome extends StatefulWidget {
  @override
  State<NavHome> createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  NavHomeController _navHomeController = Get.put(NavHomeController());
  NavAccountController _navAccountController = Get.put(NavAccountController());

  @override
  void initState() {
    super.initState();
    getVales();
  }

  getVales() async {
    await _navHomeController.fetchUserBanks();
    await _navHomeController.fetchBanks();
    await _navAccountController.fetchMoneyReqest();
    if (_navAccountController.fetchedMoneyRequestList.isNotEmpty) {
      showDialog(
        context: context,
        builder: (_) => Obx(
          () => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AlertDialog(
                  title: Text(
                    '',
                    style: TextStyle(color: Colors.black),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You have a money request  From ' +
                            _navAccountController
                                .fetchedMoneyRequestList[0].from +
                            ' With ' +
                            _navAccountController
                                .fetchedMoneyRequestList[0].amount +
                            ' SAR',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              _navAccountController.responceFetchMoneyReqest(
                                  'Accept',
                                  _navAccountController
                                      .fetchedMoneyRequestList[0].amount,
                                  _navAccountController
                                      .fetchedMoneyRequestList[0].id);

                              Get.back();
                            },
                            child: Text(
                              "Accept",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _navAccountController.responceFetchMoneyReqest(
                                  'Refuse',
                                  _navAccountController
                                      .fetchedMoneyRequestList[0].amount,
                                  _navAccountController
                                      .fetchedMoneyRequestList[0].id);

                              Get.back();
                            },
                            child: Text(
                              "Refuse",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: navDrawer(),
        body: Obx(
          () => _navHomeController.fetchedUserBankloadingProcess.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.Alpine,
                  ),
                )
              : CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 108.h,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15.w, right: 15.w, bottom: 15.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: 15.w,
                                          ),
                                          child: InkWell(
                                            onTap: () => scaffoldKey
                                                .currentState
                                                ?.openDrawer(),
                                            child: Icon(
                                              Icons.menu_outlined,
                                              color: AppColors.Alpine,
                                              size: 20.w,
                                            ),
                                          ),
                                        ),
                                        Styles.headingText(
                                            GetStorage().read("email")),
                                      ],
                                    ),
                                    Icon(
                                      Icons.notifications,
                                      color: AppColors.Alpine,
                                      size: 20.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFF333333),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.r),
                                bottomRight: Radius.circular(20.r),
                              ),
                            ),
                          ),
                          Styles.transparentDivider(),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Styles.headingText("Accounts"),
                              ],
                            ),
                          ),
                          Styles.transparentDivider(),
                        ],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: smallBankCard(
                              _navHomeController
                                  .fetchedUserBankList[index].bankName,
                              int.parse(_navHomeController
                                  .fetchedUserBankList[index].color),
                              Icons.ac_unit_outlined,
                              _navHomeController
                                  .fetchedUserBankList[index].balance,
                              _navHomeController
                                  .fetchedUserBankList[index].cardNumber,
                              () => Navigator.pushNamed(
                                  context, route.cardDetails),
                              context),
                        ),
                        childCount:
                            _navHomeController.fetchedUserBankList.length,
                      ),
                    ),
                    SliverFillRemaining(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Get.to(Banks());
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: AppColors.Alpine,
                                ),
                                child: Text('Add Bank Account'),
                              ),
                              Styles.transparentDivider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  navHomeItemsLight(
                                    "assets/icons/total-in.png",
                                    "Total in",
                                    "0 SAR",
                                    () => Navigator.pushNamed(
                                        context, route.income),
                                  ),
                                  navHomeItemsLight(
                                    "assets/icons/total-out.png",
                                    "Total out",
                                    "0 SAR",
                                    () => Navigator.pushNamed(
                                        context, route.sepending),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          // ListView(
          //   children: [
          //     Container(
          //       width: double.infinity,
          //       height: 108.h,
          //       child: Align(
          //         alignment: Alignment.bottomCenter,
          //         child: Padding(
          //           padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Row(
          //                 children: [
          //                   Padding(
          //                     padding: EdgeInsets.only(
          //                       right: 15.w,
          //                     ),
          //                     child: InkWell(
          //                       onTap: () => scaffoldKey.currentState?.openDrawer(),
          //                       child: Icon(
          //                         Icons.menu_outlined,
          //                         color: AppColors.Alpine,
          //                         size: 20.w,
          //                       ),
          //                     ),
          //                   ),
          //                   Styles.headingText(GetStorage().read("email")),
          //                 ],
          //               ),
          //               Icon(
          //                 Icons.notifications,
          //                 color: AppColors.Alpine,
          //                 size: 20.w,
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       decoration: BoxDecoration(
          //         color: Color(0xFF333333),
          //         borderRadius: BorderRadius.only(
          //           bottomLeft: Radius.circular(20.r),
          //           bottomRight: Radius.circular(20.r),
          //         ),
          //       ),
          //     ),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Styles.headingText("Your Accounts"),
          //         SizedBox(
          //           height: 16.h,
          //         ),
          //         Expanded(
          //           child: ListView.builder(
          //             itemCount: 4,
          //             itemBuilder: (_, index) {
          //               return smallBankCard(
          //                   "Bank A",
          //                   0xFF1F4AA8,
          //                   Icons.ac_unit_outlined,
          //                   "50 SAR",
          //                   () => Navigator.pushNamed(context, route.cardDetails),
          //                   context);
          //             },
          //           ),
          //         ),
          //       ],
          //     ),
          //     ElevatedButton(
          //       onPressed: () {
          //         Get.to(Banks());
          //       },
          //       style: ElevatedButton.styleFrom(
          //         primary: AppColors.Alpine,
          //       ),
          //       child: Text('Add Bank Account'),
          //     ),
          //     Styles.headingText("Summary"),
          //     Styles.transparentDivider(),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         navHomeItemsLight(
          //           "assets/icons/total-in.png",
          //           "Total in",
          //           "10000 SAR",
          //           () => Navigator.pushNamed(context, route.income),
          //         ),
          //         navHomeItemsLight(
          //           "assets/icons/total-out.png",
          //           "Total out",
          //           "10000 SAR",
          //           () => Navigator.pushNamed(context, route.sepending),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
        ));
  }
}
