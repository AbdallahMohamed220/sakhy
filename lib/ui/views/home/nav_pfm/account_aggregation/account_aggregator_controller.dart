import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/views/home/nav_accounts/confirm_with_face_id.dart';
import 'package:sakhy/ui/views/home/nav_pfm/account_aggregation/account_aggregator_services.dart';

class AccountAggregatorController extends GetxController {
  var loadingProcess = false.obs;
  final TextEditingController sendAmount = TextEditingController();

  final sendMoneyKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> sendMoney(List<String> accounts) async {
    if (!sendMoneyKey.currentState!.validate()) {
      return;
    }
    try {
      loadingProcess(true);
      var requestResponce =
          await AccountAggregatorServices.sendMoney(sendAmount.text, accounts);

      if (requestResponce == 'success') {
        Get.to(ConfirmWithFaceID());
      } else {
        Fluttertoast.showToast(
          msg: 'your balnce is less than amount',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      print(e);
    } finally {
      loadingProcess(false);
    }
  }
}
