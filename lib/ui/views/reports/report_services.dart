import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sakhy/models/report.dart';

class ReportsServices {
  static Future<List<Report>?> fetchUserReport(String? selectedDate) async {
    Response response = await Dio().get(
        'https://sakhy-7f3ae-default-rtdb.firebaseio.com/transactions.json',
        options: Options(
            headers: {
              "Content-Type": "application/json",
            },
            contentType: "application/x-www-form-urlencoded",
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    List<Report> temp = [];
    if (response.data == null) {
      return [];
    }
    print(response.data);
    final Map<String, dynamic> productAccountsListData = response.data;
    productAccountsListData.forEach((key, value) {
      if (value['account_id'] == GetStorage().read('clientId') &&
          value['creation_time'].toString().substring(5, 7) == selectedDate) {
        temp.add(Report.fromMap(value));
      }
    });

    return temp;
  }
}
