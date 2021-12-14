import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/route/route.dart' as route;
import 'package:sakhy/ui/widgets/transactions_small_item.dart';

class NavTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transactions"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
          top: 20.h,
        ),
        child: Wrap(
          spacing: 10.w,
          runSpacing: 10.w,
          children: [
            transactionsSmallItem(()=>Navigator.pushNamed(context, route.transferScreenFromTransactions,), Icons.compare_arrows, "Transfer"),
            transactionsSmallItem(()=>Navigator.pushNamed(context, route.billPayments,), Icons.article_outlined, "Bill Payments"),
            transactionsSmallItem(()=>Navigator.pushNamed(context, route.donation,), Icons.volunteer_activism, "Donation"),
          ],
        ),
      ),
    );
  }
}
