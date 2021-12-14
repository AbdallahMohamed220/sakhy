import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/views/home/nav_marketplace/all_items.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';

class NavMarketPlace extends StatefulWidget {
  @override
  _NavMarketPlaceState createState() => _NavMarketPlaceState();
}

class _NavMarketPlaceState extends State<NavMarketPlace> {
  String dropdownValueOne = "Product Type";

  String dropdownValueTwo = "Bank";

  showFilterModalDialog(context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      builder: (builder) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Container(
              color: Colors.transparent,
              child: new Container(
                decoration: new BoxDecoration(
                  color: Color(0xFF333333),
                  borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r),
                  ),
                ),
                child: Column(
                  children: [
                    AppBar(
                      title: Text(
                        "Filters",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18.sp),
                      ),
                      centerTitle: true,
                      backgroundColor: Colors.transparent,
                      leading: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.highlight_remove_outlined,
                          color: Colors.white,
                          size: 20.w,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                      child: Container(
                        width: ScreenUtil().screenWidth,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: DropdownButton<String>(
                          hint: Padding(
                            padding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            child: Text(
                              dropdownValueOne,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,fontSize: 15.sp),
                            ),
                          ),
                          icon: IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.arrow_downward,
                              size: 20.w,
                              color: AppColors.Alpine,
                            ),
                          ),
                          isExpanded: true,
                          iconSize: 18,
                          underline: Container(
                            height: 0,
                            color: Colors.transparent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValueOne = newValue!;
                            });
                          },
                          items: <String>['One', 'Two', 'Three', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,fontSize: 15.sp),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                      child: Container(
                        width: ScreenUtil().screenWidth,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: DropdownButton<String>(
                          hint: Padding(
                            padding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            child: Text(
                              dropdownValueTwo,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,fontSize: 15.sp),
                            ),
                          ),
                          icon: IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.arrow_downward,
                              color: AppColors.Alpine,
                              size: 20.w,
                            ),
                          ),
                          isExpanded: true,
                          iconSize: 18,
                          underline: Container(
                            height: 0,
                            color: Colors.transparent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValueTwo = newValue!;
                            });
                          },
                          items: <String>['One', 'Two', 'Three', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,fontSize: 15.sp),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                      child: fullWidthButton(
                        "Filter",
                        () {},
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("MarketPlace"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () => showFilterModalDialog(context),
              icon: Icon(
                Icons.filter_alt_outlined,
                color: AppColors.Alpine,
                size: 20.w,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
          ),
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                indicatorColor: AppColors.Alpine,
                indicatorWeight: 3,
                labelStyle: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500),

                tabs: [
                  Tab(text: "All",),
                  Tab(text: "Investment",),
                  Tab(text: "Banks Products",),
                  Tab(text: "Savings",),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  AllItems(),
                  AllItems(),
                  AllItems(),
                  AllItems(),

                ],),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
