import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/views/home/nav_accounts/confirm_with_face_id.dart';
import 'package:sakhy/ui/views/home/nav_accounts/send_requuest_money_services.dart';

class SendRequestMoneyController extends GetxController {
  var loadingProcess = false.obs;
  final TextEditingController sendAmount = TextEditingController();
  final TextEditingController sendDescription = TextEditingController();
  final TextEditingController beneficiaryname = TextEditingController();
  final TextEditingController iban = TextEditingController();
  final TextEditingController requestAmount = TextEditingController();
  final TextEditingController requestDescription = TextEditingController();
  String account = '';
  String bankName = '';
  final sendMoneyKey = GlobalKey<FormState>();
  final reqestMoneyKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> sendMoney(String id) async {
    if (!sendMoneyKey.currentState!.validate()) {
      return;
    }
    try {
      loadingProcess(true);
      var requestResponce = await SendRequestMoneyServices.sendMoney(
          id, sendAmount.text, sendDescription.text, bankName);

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

  Future<void> requestMoney(String beneficiaryname) async {
    if (!reqestMoneyKey.currentState!.validate()) {
      return;
    }
    try {
      loadingProcess(true);
      var requestResponce = await SendRequestMoneyServices.requestMoney(
          beneficiaryname, requestAmount.text, requestDescription.text);

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
