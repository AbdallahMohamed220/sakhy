import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakhy/models/account.dart';
import 'package:sakhy/models/credit_card.dart';
import 'package:sakhy/models/money_request.dart';
import 'package:sakhy/ui/views/home/nav_accounts/added_card_successfully.dart';
import 'package:sakhy/ui/views/home/nav_accounts/nav_accounts_services.dart';

class NavAccountController extends GetxController {
  var fetchedAccountList = <Account>[].obs;
  var fetchedCreditCardList = <CreditCard>[].obs;
  var fetchedMoneyRequestList = <MoneyRequest>[].obs;
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiritionDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  final addCardformKey = GlobalKey<FormState>();

  var accountsloadingProcess = false.obs;
  var cardsloadingProcess = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchAccounts() async {
    accountsloadingProcess(true);
    var accountList = await NavAccountServices.fetchAccounts();
    if (accountList != null) {
      fetchedAccountList.value = accountList;
    }
    accountsloadingProcess(false);
  }

  Future<void> addCreditCard() async {
    if (!addCardformKey.currentState!.validate()) {
      return;
    }
    cardsloadingProcess(true);
    var responseRequest = await NavAccountServices.addCreditCard(
      cardNumberController.text,
      cvvController.text,
      expiritionDateController.text,
    );

    cardsloadingProcess(false);
    Get.to(AddCardSuccessfully());
    Future.delayed(Duration(seconds: 2), () {
      Get.back();
      Get.back();
      fetchAccounts();
      fetchCreditCard();
    });
  }

  Future<void> fetchCreditCard() async {
    cardsloadingProcess(true);
    var accountList = await NavAccountServices.fetchCreditCard();
    if (accountList != null) {
      fetchedCreditCardList.value = accountList;
    }

    cardsloadingProcess(false);
  }

  Future<void> fetchMoneyReqest() async {
    var moneyRequest = await NavAccountServices.fetchMoneyReqest();
    if (moneyRequest != null) {
      fetchedMoneyRequestList.value = moneyRequest;
    }
  }

  Future<void> responceFetchMoneyReqest(
    String responcefetchMoneyReqest,
    String amount,
    String key,
  ) async {
    await NavAccountServices.responcefetchMoneyReqest(
        responcefetchMoneyReqest, amount, key);
  }
}
