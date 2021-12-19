import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sakhy/models/account.dart';
import 'package:sakhy/models/bank.dart';

int totalOut = 0;
int totalIn = 0;

class NavHomeServices {
  static Future<List<Account>?> fetchUserBanks() async {
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
    if (response.data == null) {
      return [];
    }
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
          temp.add(Account.fromMap(value));
        }
      }
    });

    return temp;
  }

  static Future<void> fetchUserTansaction() async {
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
        },
      ),
    );
    final Map<String, dynamic> productAccountsListData = response.data;
    totalOut = 0;
    totalIn = 0;
    productAccountsListData.forEach((key, value) {
      if (value['account_id'] == GetStorage().read('clientId') &&
          value['creation_time'].toString().substring(5, 7) ==
              DateTime.now().toString().substring(5, 7) &&
          value['isOut'] == true) {
        totalOut += int.parse(value['amount']);
      }
    });
    productAccountsListData.forEach((key, value) {
      if (value['account_id'] == GetStorage().read('clientId') &&
          value['creation_time'].toString().substring(5, 7) ==
              DateTime.now().toString().substring(5, 7) &&
          value['isIn'] == true) {
        totalIn += int.parse(value['amount']);
      }
    });
  }

  static Future<List<Bank>?> fetchBanks() async {
    Response response = await Dio()
        .get('https://sakhy-7f3ae-default-rtdb.firebaseio.com/Banks.json',
            options: Options(
                contentType: "application/x-www-form-urlencoded",
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                }));
    List<Bank> temp = [];
    print('NavHome responce');
    print(response.data);
    final Map<String, dynamic> productListData =
        response.data as Map<String, dynamic>;
    productListData.forEach((key, value) {
      print(value);
      temp.add(Bank.fromMap(value));
    });
    print(response.data);
    return temp;
  }
}
