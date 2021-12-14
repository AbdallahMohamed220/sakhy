import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/route/route.dart' as route;
import 'package:sakhy/ui/widgets/transactions_small_item.dart';

class Beneficiaries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beneficiaries"),
        centerTitle: true,
        leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back,size: 20.w,),),
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
            transactionsSmallItemTitleOnly(
              () => Navigator.pushNamed(context, route.addLocalBeneficiary),
              "Add Local Beneficiary",
            ),
            transactionsSmallItemTitleOnly(
                () => Navigator.pushNamed(context, route.addInternationalBeneficiary),
                "Add International Beneficiary"),
            transactionsSmallItemTitleOnly(
                () => Navigator.pushNamed(context, route.beneficiariesList),
                "Manage Beneficiaries"),
          ],
        ),
      ),
    );
  }
}
