import 'package:get/get.dart';
import 'package:sakhy/models/account.dart';
import 'package:sakhy/models/bank.dart';
import 'package:sakhy/ui/views/home/nav_home/nav_home_services.dart';

class NavHomeController extends GetxController {
  var fetchedBankList = <Bank>[].obs;
  var fetchedUserBankList = <Account>[].obs;
  var fetchedBankloadingProcess = false.obs;
  var fetchedUserBankloadingProcess = false.obs;
  var fetchUserTansactionLoadingprogress = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchBanks() async {
    fetchedBankloadingProcess(true);
    var bankList = await NavHomeServices.fetchBanks();
    if (bankList != null) {
      fetchedBankList.value = bankList;
    }

    fetchedBankloadingProcess(false);
  }

  Future<void> fetchUserBanks() async {
    fetchedUserBankloadingProcess(true);
    var userbankList = await NavHomeServices.fetchUserBanks();
    if (userbankList != null) {
      fetchedUserBankList.clear();
      fetchedUserBankList.value = userbankList;
    }

    fetchedUserBankloadingProcess(false);
  }

  Future<void> fetchUserTansaction() async {
    fetchUserTansactionLoadingprogress(true);
    await NavHomeServices.fetchUserTansaction();

    fetchUserTansactionLoadingprogress(false);
  }
}
