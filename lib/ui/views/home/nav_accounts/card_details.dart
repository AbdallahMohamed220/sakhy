import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/home/nav_accounts/request_money.dart';
import 'package:sakhy/ui/views/home/nav_accounts/send_request_money.dart';
import 'package:sakhy/ui/widgets/accounts_small_item.dart';
import 'package:sakhy/ui/widgets/bank_card.dart';

class CardDetails extends StatefulWidget {
  final String bankName;
  final String bankBalance;
  final String iban;
  final String color;

  const CardDetails(
      {Key? key,
      required this.bankName,
      required this.bankBalance,
      required this.iban,
      required this.color})
      : super(key: key);
  @override
  _CardDetailsState createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  List _options = ['All', 'Received', 'Paid'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF333333),
        title: Styles.headingText("Account Details"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_outlined,
            color: AppColors.Alpine,
            size: 20.w,
          ),
        ),
      ),
      body: Column(
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
                bankCard(
                    widget.bankName,
                    widget.bankBalance,
                    int.parse(widget.color),
                    widget.bankBalance,
                    widget.iban,
                    () {},
                    context),
                Styles.transparentDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // accountSmallItem(() {
                    //   Navigator.pushNamed(context, route.sendRequestMoney);
                    // }, Icons.call_made_outlined, "Send"),
                    accountSmallItem(() {
                      Get.to(
                        SendRequestMoney(
                            // balance: widget.bankBalance,
                            ),
                      );
                    }, Icons.call_made_outlined, "Send"),
                    accountSmallItem(() {
                      Get.to(
                        RequestMoney(
                            //  balance: widget.bankBalance,
                            ),
                      );
                    }, Icons.call_received_outlined, "Receive"),
                    accountSmallItem(() {}, Icons.article_outlined, "Bill"),
                    accountSmallItem(() {}, Icons.volunteer_activism, "Donate"),
                  ],
                ),
                Styles.transparentDivider(),
                Styles.headingText("Recent Transactions"),
                Styles.transparentDivider(),
                Row(
                  children: [
                    Container(
                      height: 55.h,
                      width: ScreenUtil().screenWidth * .7,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: _options.length,
                          itemBuilder: (context, i) => Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                    padding: EdgeInsets.only(
                                        top: 10.w, bottom: 10.w),
                                    child: Text(
                                      _options[i],
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 18.sp,
                        ),
                      ),
                    )
                  ],
                ),
                Styles.transparentDivider(),
                // Container(
                //   decoration: BoxDecoration(
                //     color: Color(0xFF4F4F4F),
                //     borderRadius: BorderRadius.all(
                //       Radius.circular(7.r),
                //     ),
                //   ),
                //   child: Padding(
                //     padding: EdgeInsets.all(20.w),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               "Today",
                //               style: TextStyle(
                //                   fontWeight: FontWeight.w600,
                //                   fontSize: 18.sp,
                //                   color: Colors.white),
                //             ),
                //             Text(
                //               "28/8",
                //               style: TextStyle(
                //                   fontWeight: FontWeight.w400,
                //                   fontSize: 14.sp,
                //                   color: Colors.white),
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 8.h,
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               "Pandah\nSupermarket",
                //               style: TextStyle(
                //                   fontWeight: FontWeight.w600,
                //                   fontSize: 14.sp,
                //                   color: Colors.white),
                //             ),
                //             Text(
                //               "+500 SAR",
                //               style: TextStyle(
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: 14.sp,
                //                 color: Color(0xFF4DB6AC),
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 8.h,
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               "Transfer from Ahmed\nPersonal",
                //               style: TextStyle(
                //                   fontWeight: FontWeight.w600,
                //                   fontSize: 14.sp,
                //                   color: Colors.white),
                //             ),
                //             Text(
                //               "+1000 SAR",
                //               style: TextStyle(
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: 14.sp,
                //                 color: Color(0xFF4DB6AC),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
