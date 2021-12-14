import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/home/nav_payments/beneficira_request_money.dart';
import 'package:sakhy/ui/views/home/nav_payments/beneficiry_send_money.dart';
import 'package:sakhy/ui/views/home/nav_payments/request_money.dart';
import 'package:sakhy/ui/views/home/nav_payments/send_money.dart';
import 'package:sakhy/ui/widgets/accounts_small_item.dart';
import 'package:sakhy/ui/widgets/beneficiary_details_data.dart';

class BeneficiaryDetails extends StatefulWidget {
  final String name;
  final bool islocal;
  final String bankName;
  final String iban;
  final String id;

  const BeneficiaryDetails(
      {Key? key,
      required this.name,
      required this.islocal,
      required this.bankName,
      required this.id,
      required this.iban})
      : super(key: key);
  @override
  _BeneficiaryDetailsState createState() => _BeneficiaryDetailsState();
}

class _BeneficiaryDetailsState extends State<BeneficiaryDetails> {
  @override
  Widget build(BuildContext context) {
    print(widget.islocal);
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Details"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              size: 20.w,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
                top: 20.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/icons/account.png",
                      scale: 6.5,
                    ),
                  ),
                  Styles.transparentDivider(),
                  AspectRatio(
                    aspectRatio: 2.8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF333333),
                        borderRadius: BorderRadius.all(
                          Radius.circular(9.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            beneficiaryDetailsData(
                                "Beneficiary Name", widget.name),
                            beneficiaryDetailsData("Beneficiary Type",
                                widget.islocal ? 'Local' : 'International'),
                            beneficiaryDetailsData("Bank", widget.bankName),
                            widget.islocal
                                ? SizedBox()
                                : beneficiaryDetailsData("IBAN", widget.iban),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Styles.transparentDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      accountSmallItem(() {
                        Get.to(BeneficarySendMoney(id: widget.id));
                      }, Icons.call_made, "Send"),
                      SizedBox(
                        width: 20.w,
                      ),
                      accountSmallItem(() {
                        Get.to(BeneficaryRequestMoney(id: widget.id));
                      }, Icons.call_received, "Request"),
                    ],
                  ),
                  Styles.transparentDivider(),
                  Styles.headingText("Recent Transactions"),
                ],
              ),
            ),
            TabBar(
              physics: NeverScrollableScrollPhysics(),
              isScrollable: true,
              indicatorColor: AppColors.Alpine,
              indicatorWeight: 3,
              labelStyle:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              tabs: [
                Tab(
                  text: "All",
                ),
                Tab(
                  text: "Income",
                ),
                Tab(
                  text: "Expense",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    child: Container(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF333333),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.w),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Today",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "28/8",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Pandah\nSupermarket",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "-500 SAR",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    child: Container(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF333333),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.w),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Today",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "28/8",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Pandah\nSupermarket",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "-500 SAR",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    child: Container(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF333333),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.w),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Today",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "28/8",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Pandah\nSupermarket",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "-500 SAR",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
