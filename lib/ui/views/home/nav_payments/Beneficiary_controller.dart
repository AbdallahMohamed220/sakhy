import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sakhy/models/beneficiarie.dart';
import 'package:sakhy/ui/views/home/nav_accounts/confirm_with_face_id.dart';
import 'package:sakhy/ui/views/home/nav_payments/Beneficiary_services.dart';
import 'package:sakhy/ui/views/home/nav_payments/add_contact.dart';

class BeneficiaryController extends GetxController {
  var loadingProcess = false.obs;
  var beneficiaryrequestMoneyloadingProcess = false.obs;
  final TextEditingController beneficiaryAlias = TextEditingController();
  final TextEditingController beneficiaryname = TextEditingController();
  final TextEditingController iban = TextEditingController();
  final TextEditingController sendMoneyAmount = TextEditingController();
  final TextEditingController sendMoneyReason = TextEditingController();
  final TextEditingController receiveMoneyAmount = TextEditingController();
  final TextEditingController receiveMoneyReason = TextEditingController();
  final TextEditingController donationAmount = TextEditingController();
  final TextEditingController billAmount = TextEditingController();
  final TextEditingController billTitle = TextEditingController();
  final TextEditingController billNumber = TextEditingController();
  String donationOrganization = '';
  String bankName = '';
  final donationformKey = GlobalKey<FormState>();
  final billformKey = GlobalKey<FormState>();
  final addLocalBeneficiaryformKey = GlobalKey<FormState>();
  final addInternatonalBeneficiaryformKey = GlobalKey<FormState>();
  final sendMoneyBenefciarFormKey = GlobalKey<FormState>();
  final requestMoneyBenefciarFormKey = GlobalKey<FormState>();
  var fetchedLocalBeneficiaryList = <Beneficiarie>[].obs;
  var fetchedInternationalBeneficiaryList = <Beneficiarie>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> addLocalBeneficiary() async {
    if (!addLocalBeneficiaryformKey.currentState!.validate()) {
      return;
    }
    try {
      loadingProcess(true);
      var requestResponce = await BeneficiaryServices.addLocalBeneficiary(
          beneficiaryname.text, beneficiaryAlias.text, bankName);
      if (requestResponce == 'success') {
        beneficiaryname.clear();
        beneficiaryAlias.clear();
        Get.to(AddContact());
      } else {
        Fluttertoast.showToast(
          msg: 'an error occurred please try again',
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

  Future<void> addlnternationalBeneficiary() async {
    if (!addInternatonalBeneficiaryformKey.currentState!.validate()) {
      return;
    }
    try {
      loadingProcess(true);
      var requestResponce =
          await BeneficiaryServices.addlnternationalBeneficiary(
              beneficiaryname.text, beneficiaryAlias.text, bankName, iban.text);
      if (requestResponce == 'success') {
        beneficiaryname.clear();
        beneficiaryAlias.clear();
        iban.clear();
        Get.to(AddContact());
      } else {
        Fluttertoast.showToast(
          msg: 'an error occurred please try again',
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

  Future<void> getLocalBeneficiary() async {
    loadingProcess(true);
    var accountList = await BeneficiaryServices.getLocalBeneficiary();
    if (accountList != null) {
      fetchedLocalBeneficiaryList.value = accountList;
    }

    loadingProcess(false);
  }

  Future<void> getlnternationalBeneficiary() async {
    loadingProcess(true);
    var accountList = await BeneficiaryServices.getlnternationalBeneficiary();
    if (accountList != null) {
      fetchedInternationalBeneficiaryList.value = accountList;
    }

    loadingProcess(false);
  }

  Future<void> beneficiarySendMoney(String id) async {
    if (!sendMoneyBenefciarFormKey.currentState!.validate()) {
      return;
    }
    try {
      loadingProcess(true);
      var requestResponce = await BeneficiaryServices.beneficiarySendMoney(
          id, sendMoneyAmount.text, sendMoneyReason.text);

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

  Future<void> beneficiaryRequestMoney(String id) async {
    if (!requestMoneyBenefciarFormKey.currentState!.validate()) {
      return;
    }
    try {
      beneficiaryrequestMoneyloadingProcess(true);
      var requestResponce = await BeneficiaryServices.beneficiaryRequestMoney(
          id, receiveMoneyAmount.text, receiveMoneyReason.text);

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
      beneficiaryrequestMoneyloadingProcess(false);
    }
  }

  Future<void> donation() async {
    if (!donationformKey.currentState!.validate()) {
      return;
    }
    try {
      loadingProcess(true);
      var requestResponce = await BeneficiaryServices.donation(
          donationAmount.text, donationOrganization);

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

  Future<void> bill() async {
    if (!billformKey.currentState!.validate()) {
      return;
    }
    try {
      loadingProcess(true);
      var requestResponce = await BeneficiaryServices.bill(
          billAmount.text, billTitle.text, billNumber.text);

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

  @override
  void onClose() {
    super.onClose();
    beneficiaryAlias.clear();
    beneficiaryAlias.dispose();
    beneficiaryname.clear();
    beneficiaryname.dispose();
    iban.clear();
    iban.dispose();
    sendMoneyAmount.clear();
    sendMoneyAmount.dispose();
    sendMoneyReason.clear();
    sendMoneyReason.dispose();
    receiveMoneyAmount.clear();
    receiveMoneyAmount.dispose();
    receiveMoneyReason.clear();
    receiveMoneyReason.dispose();
    donationAmount.clear();
    donationAmount.dispose();
    billAmount.clear();
    billAmount.dispose();
    billTitle.clear();
    billTitle.dispose();
    billNumber.clear();
    billNumber.dispose();
  }
}
