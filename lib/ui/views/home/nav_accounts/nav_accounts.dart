import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/home/nav_accounts/card_details.dart';
import 'package:sakhy/ui/views/home/nav_accounts/nav_accountS_controller.dart';
import 'package:sakhy/ui/route/route.dart' as route;
import 'package:sakhy/ui/widgets/bank_card.dart';

class NavAccounts extends StatefulWidget {
  @override
  State<NavAccounts> createState() => _NavAccountsState();
}

class _NavAccountsState extends State<NavAccounts> {
  NavAccountController _navAccountController = Get.put(NavAccountController());
  @override
  void initState() {
    super.initState();
    _navAccountController.fetchAccounts();
    _navAccountController.fetchCreditCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF333333),
        title: Styles.headingText("My Accounts"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, route.addCards).then((value) {
              _navAccountController.fetchAccounts();
              _navAccountController.fetchCreditCard();
            }),
            icon: Icon(
              Icons.add_circle_outline_sharp,
              color: AppColors.Alpine,
              size: 20.w,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
              top: 20.h,
            ),
            child: Obx(
              () => _navAccountController.accountsloadingProcess.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.Alpine,
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount:
                            _navAccountController.fetchedAccountList.length,
                        itemBuilder: (_, index) {
                          return smallBankCard(
                              _navAccountController
                                  .fetchedAccountList[index].accountName,
                              int.parse(_navAccountController
                                  .fetchedAccountList[index].color),
                              Icons.ac_unit_outlined,
                              _navAccountController
                                  .fetchedAccountList[index].balance,
                              _navAccountController
                                  .fetchedAccountList[index].cardNumber,
                              () => Get.to(
                                    CardDetails(
                                      bankName: _navAccountController
                                          .fetchedAccountList[index]
                                          .accountName,
                                      bankBalance: _navAccountController
                                          .fetchedAccountList[index].balance,
                                      iban: _navAccountController
                                          .fetchedAccountList[index].iban,
                                      color: _navAccountController
                                          .fetchedAccountList[index].color,
                                    ),
                                  ),
                              context);
                        },
                      ),
                    ),
            ),
          ),
          Styles.transparentDivider(),
          Styles.transparentDivider(),
          Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
              top: 20.h,
            ),
            child: Obx(
              () => _navAccountController.cardsloadingProcess.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.Alpine,
                      ),
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            'Credit Card',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.sp,
                                color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: _navAccountController
                                .fetchedCreditCardList.length,
                            itemBuilder: (_, index) {
                              return creditCard(
                                _navAccountController
                                    .fetchedCreditCardList[index].cardNumber,
                                int.parse(_navAccountController
                                    .fetchedCreditCardList[index].color),
                                _navAccountController
                                    .fetchedCreditCardList[index].expDate,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }
}
