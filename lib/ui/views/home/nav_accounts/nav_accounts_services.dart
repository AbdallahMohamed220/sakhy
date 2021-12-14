import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sakhy/models/account.dart';
import 'package:sakhy/models/bank.dart';

int total = 0;

class NavAccountServices {
  static Future<List<Account>?> fetchAccounts() async {
    Response response = await Dio().get(
        'https://sakhy-7f3ae-default-rtdb.firebaseio.com/client_accounts.json',
        options: Options(
            headers: {
              "Content-Type": "application/json",
            },
            contentType: "application/x-www-form-urlencoded",
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    List banksId = [];
    print(GetStorage().read('clientId'));
    final Map<String, dynamic> productclientaccountsListData = response.data;
    productclientaccountsListData.forEach((key, value) {
      print(value);
      if (value['client_id'] == GetStorage().read('clientId')) {
        banksId.add(value['bank_id']);
      }
    });
    print(banksId.length);
    for (var i = 0; i < banksId.length; i++) {
      print('bankid' + banksId[i]);
    }

    List<Account> temp = [];

    Response response2 = await Dio()
        .get('https://sakhy-7f3ae-default-rtdb.firebaseio.com/accounts.json',
            options: Options(
                headers: {
                  "Content-Type": "application/json",
                },
                contentType: "application/x-www-form-urlencoded",
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                }));
    final Map<String, dynamic> productAccountsListData = response2.data;
    productAccountsListData.forEach((key, value) {
      for (var i = 0; i < banksId.length; i++) {
        if (value['client_id'] == GetStorage().read('clientId') &&
            value['bank_id'] == banksId[i]) {
          total += int.parse(value['balance']);
          temp.add(Account.fromMap(value));
        }
      }
    });

    return temp;
  }
}
