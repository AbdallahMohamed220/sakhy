import 'package:flutter/material.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/views/home/nav_accounts/nav_accounts.dart';
import 'package:sakhy/ui/views/home/nav_home/nav_home.dart';
import 'package:sakhy/ui/views/home/nav_marketplace/nav_marketplace.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'nav_payments/nav_transactions.dart';
import 'nav_pfm/nav_pfm.dart';

class BottomNavController extends StatefulWidget {
  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  int _currentIndex = 0;
  final _bottomNavPages = [
    NavHome(),
    NavAccounts(),
    NavTransactions(),
    NavMarketPlace(),
    NavPFM(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    NavHome(),
                    NavAccounts(),
                    NavTransactions(),
                    NavMarketPlace(),
                    NavPFM(),
                  ],
                ),
              ),
              TabBar(
                physics: NeverScrollableScrollPhysics(),
                isScrollable: false,
                indicatorColor: Colors.transparent,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                unselectedLabelStyle:
                    TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                labelPadding: EdgeInsets.all(0),
                indicatorPadding: EdgeInsets.all(0),
                labelStyle:
                    TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                labelColor: AppColors.Alpine,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    icon: Image.asset(
                      "assets/icons/home.png",
                      width: 25.w,
                      color: _currentIndex == 0
                          ? AppColors.Alpine
                          : Color(0xFF828282),
                    ),
                    text: "Home",
                  ),
                  Tab(
                    icon: Image.asset(
                      "assets/icons/bank.png",
                      width: 25.w,
                      color: _currentIndex == 1
                          ? AppColors.Alpine
                          : Color(0xFF828282),
                    ),
                    text: "Accounts",
                  ),
                  Tab(
                    icon: Image.asset(
                      "assets/icons/payments.png",
                      width: 25.w,
                      color: _currentIndex == 2
                          ? AppColors.Alpine
                          : Color(0xFF828282),
                    ),
                    text: "Payments",
                  ),
                  Tab(
                    icon: Image.asset(
                      "assets/icons/marketplace.png",
                      width: 25.w,
                      color: _currentIndex == 3
                          ? AppColors.Alpine
                          : Color(0xFF828282),
                    ),
                    text: "Marketplace",
                  ),
                  Tab(
                    icon: Image.asset(
                      "assets/icons/pfm.png",
                      width: 25.w,
                      color: _currentIndex == 4
                          ? AppColors.Alpine
                          : Color(0xFF828282),
                    ),
                    text: "PFM",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// bottomNavigationBar: BottomNavigationBar(
//
// backgroundColor: Color(0xFF333333),
// selectedItemColor: AppColors.Alpine,
// unselectedIconTheme: IconThemeData(size: 20.w),
// selectedLabelStyle:
// TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
// items: [
// BottomNavigationBarItem(
// backgroundColor: Color(0xFF333333),
// icon: Icon(Icons.home_filled),
// title: Text("Home"),
// ),
// BottomNavigationBarItem(
// backgroundColor: Color(0xFF333333),
// icon: Icon(Icons.credit_card),
// title: Text("Accounts"),
// ),
// BottomNavigationBarItem(
// backgroundColor: Color(0xFF333333),
// icon: Icon(Icons.alt_route),
// title: Text("Transactions"),
// ),
// BottomNavigationBarItem(
// backgroundColor: Color(0xFF333333),
// icon: Icon(Icons.shopping_cart),
// title: Text("MarketPlace"),
// ),
// BottomNavigationBarItem(
// backgroundColor: Color(0xFF333333),
// icon: Icon(Icons.menu),
// title: Text("More"),
// ),
// ],
// currentIndex: _currentIndex,
// onTap: (value) {
// setState(() {
// _currentIndex = value;
// });
// },
//
// ),
// body: SafeArea(
// child: _bottomNavPages[_currentIndex],
// ),
