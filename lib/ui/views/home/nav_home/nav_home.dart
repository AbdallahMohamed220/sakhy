import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/styles/styles.dart';
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
  @override
  void initState() {
    super.initState();
    _navHomeController.fetchUserBanks();
    _navHomeController.fetchBanks();
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
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Styles.headingText("Your Accounts"),
                              ],
                            ),
                          )
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                navHomeItemsLight(
                                  "assets/icons/total-in.png",
                                  "Total in",
                                  "10000 SAR",
                                  () => Navigator.pushNamed(
                                      context, route.income),
                                ),
                                navHomeItemsLight(
                                  "assets/icons/total-out.png",
                                  "Total out",
                                  "10000 SAR",
                                  () => Navigator.pushNamed(
                                      context, route.sepending),
                                ),
                              ],
                            )
                          ],
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
