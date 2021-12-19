import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sakhy/models/account.dart';
import 'package:sakhy/models/bank.dart';
import 'package:sakhy/models/credit_card.dart';
import 'package:sakhy/models/money_request.dart';

late int total;

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
    if (response.data == null) {
      return [];
    }
    final Map<String, dynamic> productclientaccountsListData = response.data;
    // productclientaccountsListData.forEach((key, value) {
    print(response.data);
    if (response.data['client_id'] == GetStorage().read('clientId')) {
      banksId.add(response.data['bank_id']);
    }
    // });
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
          total = 0;
          total += int.parse(value['balance']);
          temp.add(Account.fromMap(value));
        }
      }
    });

    return temp;
  }

  static Future<List<Account>?> addCreditCard(
    String cardNumber,
    String cvv,
    String expDate,
  ) async {
    Response response = await Dio().post(
        'https://sakhy-7f3ae-default-rtdb.firebaseio.com/creditCards.json',
        data: {
          'card_number': cardNumber,
          'client_id': GetStorage().read('userId'),
          'color': '0xff222F4A82',
          'cvv': cvv,
          'exp_date': expDate,
        },
        options: Options(
            headers: {
              "Content-Type": "application/json",
            },
            contentType: "application/x-www-form-urlencoded",
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    print('add creditCards');
    print(response.data);
  }

  static Future<List<CreditCard>?> fetchCreditCard() async {
    Response response = await Dio()
        .get('https://sakhy-7f3ae-default-rtdb.firebaseio.com/creditCards.json',
            options: Options(
                headers: {
                  "Content-Type": "application/json",
                },
                contentType: "application/x-www-form-urlencoded",
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                }));
    List<CreditCard> temp = <CreditCard>[];
    print('creditCards');
    print(response.data);
    if (response.data == null) {
      temp = [];
    } else {
      final Map<String, dynamic> productclientaccountsListData = response.data;
      productclientaccountsListData.forEach((key, value) {
        if (value['client_id'] == GetStorage().read('userId')) {
          temp.add(CreditCard.fromMap(value));
        }
      });
    }

    return temp;
  }

  static Future<List<MoneyRequest>?> fetchMoneyReqest() async {
    Response response = await Dio().get(
        'https://sakhy-7f3ae-default-rtdb.firebaseio.com/money_requests.json',
        options: Options(
            headers: {
              "Content-Type": "application/json",
            },
            contentType: "application/x-www-form-urlencoded",
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    List<MoneyRequest> temp = [];
    if (response.data == null) {
      temp = [];
    } else {
      final Map<String, dynamic> productclientaccountsListData = response.data;
      productclientaccountsListData.forEach((key, value) {
        if (value['client_id'] == GetStorage().read('clientId') &&
            value['status'] == 'pending') {
          temp.add(MoneyRequest.fromMap(value));
        }
      });
    }

    return temp;
  }

  static Future<String?> responcefetchMoneyReqest(
    String responcefetchMoneyReqest,
    String amount,
    String key,
  ) async {
    String requestResponce = 'your balnce is less than amount';

    if (responcefetchMoneyReqest == 'Accept') {
      Response response3 = await Dio()
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
      final Map<String, dynamic> productListData = response3.data;
      print(productListData);

      productListData.forEach(
        (key, value) async {
          if (value['client_id'] == GetStorage().read('clientId') &&
              value['account_type'] == 'CURRENT') {
            if (int.parse(value['balance']) < int.parse(amount) ||
                requestResponce == 'success') {
              requestResponce = 'your balnce is less than amount';
            } else {
              requestResponce = 'success';

              await Dio().put(
                'https://sakhy-7f3ae-default-rtdb.firebaseio.com/accounts/$key.json',
                data: {
                  'account_id': value['account_id'],
                  'account_name': value['account_name'],
                  'account_type': value['account_type'],
                  'balance': (int.parse(value['balance']) - int.parse(amount))
                      .toString(),
                  'bank_id': value['bank_id'],
                  'bank_name': value['bank_name'],
                  'client_id': value['client_id'],
                  'color': value['color'],
                  'currency': value['currency'],
                  'iban': value['iban'],
                  'id': value['id'],
                },
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
            }
          }
        },
      );
      productListData.forEach(
        (key, value) async {
          if (value['client_id'] == GetStorage().read('clientId') &&
              value['account_name'] == 'Sakhy Card') {
            if (int.parse(value['balance']) < int.parse(amount)) {
              requestResponce = 'your balnce is less than amount';
            } else {
              requestResponce = 'success';

              await Dio().put(
                  'https://sakhy-7f3ae-default-rtdb.firebaseio.com/accounts/$key.json',
                  data: {
                    'account_id': value['account_id'],
                    'account_name': value['account_name'],
                    'account_type': value['account_type'],
                    'balance': (int.parse(value['balance']) - int.parse(amount))
                        .toString(),
                    'bank_id': value['bank_id'],
                    'bank_name': value['bank_name'],
                    'client_id': value['client_id'],
                    'color': value['color'],
                    'currency': value['currency'],
                    'iban': value['iban'],
                    'id': value['id'],
                  },
                  options: Options(
                      headers: {
                        "Content-Type": "application/json",
                      },
                      contentType: "application/x-www-form-urlencoded",
                      followRedirects: false,
                      validateStatus: (status) {
                        return status! < 500;
                      }));
            }
          }
        },
      );
      await Dio().put(
          'https://sakhy-7f3ae-default-rtdb.firebaseio.com/money_requests/$key.json',
          data: {
            'amount': amount,
            'client_id': GetStorage().read('userId'),
            'creation_time': DateTime.now().toString(),
            'from': 'Ahmed ALi',
            'currency': 'SAR',
            'id': key,
            'reason': 'reason',
            'modified_date': '',
            'status': responcefetchMoneyReqest,
          },
          options: Options(
              headers: {
                "Content-Type": "application/json",
              },
              contentType: "application/x-www-form-urlencoded",
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              }));
    } else {
      await Dio().put(
          'https://sakhy-7f3ae-default-rtdb.firebaseio.com/money_requests/$key.json',
          data: {
            'amount': amount,
            'client_id': GetStorage().read('userId'),
            'creation_time': DateTime.now().toString(),
            'from': 'Ahmed ALi',
            'currency': 'SAR',
            'id': key,
            'reason': 'reason',
            'modified_date': '',
            'status': responcefetchMoneyReqest,
          },
          options: Options(
              headers: {
                "Content-Type": "application/json",
              },
              contentType: "application/x-www-form-urlencoded",
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              }));
    }

    print(requestResponce);

    return requestResponce;
  }
}
