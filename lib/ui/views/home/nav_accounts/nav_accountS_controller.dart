import 'package:get/get.dart';
import 'package:sakhy/models/account.dart';
import 'package:sakhy/ui/views/home/nav_accounts/nav_accounts_services.dart';

class NavAccountController extends GetxController {
  var fetchedAccountList = <Account>[].obs;
  var loadingProcess = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchAccounts() async {
    loadingProcess(true);
    var accountList = await NavAccountServices.fetchAccounts();
    if (accountList != null) {
      fetchedAccountList.value = accountList;
    }

    loadingProcess(false);
  }
}
