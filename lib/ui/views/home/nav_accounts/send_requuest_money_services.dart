import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class SendRequestMoneyServices {
  static Future<String?> sendMoney(
    String id,
    String amount,
    String reason,
    String accountName,
  ) async {
    await Dio().post(
        'https://sakhy-7f3ae-default-rtdb.firebaseio.com/transactions.json',
        data: {
          'account_id': "",
          'amount': amount,
          'creation_time': DateTime.now().toString(),
          'currency': 'SAR',
          'from': GetStorage().read('userId'),
          'id': "",
          'reason': reason,
          'to': id,
          'transaction_type': ""
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
    String requestResponce = 'your balnce is less than amount';

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
                'card_number': value['card_number'],
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
                  'card_number': value['card_number'],
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

    print(requestResponce);

    return requestResponce;
  }

  static Future<String?> requestMoney(
    String id,
    String amount,
    String reason,
  ) async {
    Response response = await Dio().post(
        'https://sakhy-7f3ae-default-rtdb.firebaseio.com/money_requests.json',
        data: {
          'amount': amount,
          'client_id': GetStorage().read('userId'),
          'creation_time': DateTime.now().toString(),
          'from': 'Ahmed',
          'currency': 'SAR',
          'id': '',
          'reason': reason,
          'modified_date': '',
          'status': 'pending',
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
    print(response.data);

    await Dio().put(
        'https://sakhy-7f3ae-default-rtdb.firebaseio.com/money_requests/${response.data['name']}.json',
        data: {
          'amount': amount,
          'client_id': GetStorage().read('userId'),
          'creation_time': DateTime.now().toString(),
          'from': 'Ahmed ALi',
          'currency': 'SAR',
          'id': response.data['name'],
          'reason': reason,
          'modified_date': '',
          'status': 'pending',
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

    String requestResponce = 'success';

    return requestResponce;
  }
}
