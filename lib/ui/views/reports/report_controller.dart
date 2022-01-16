import 'package:get/get.dart';

import 'package:sakhy/models/report.dart';
import 'package:sakhy/ui/views/reports/report_services.dart';

class ReportController extends GetxController {
  var fetchUserReportList = <Report>[].obs;
  var loadingProcess = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchUserReport(String selectedDate) async {
    loadingProcess(true);
    var list = await ReportsServices.fetchUserReport(selectedDate);
    if (list != null) {
      fetchUserReportList.value = list;
    }

    loadingProcess(false);
  }
}
