import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class AccountAggregatorServices {
  static Future<String?> sendMoney(
    String amount,
    List<String> accountName,
  ) async {
    await Dio().post(
        'https://sakhy-7f3ae-default-rtdb.firebaseio.com/transactions.json',
        data: {
          'account_id': GetStorage().read('clientId'),
          'amount': amount,
          'creation_time': DateTime.now().toString(),
          'currency': 'SAR',
          'from': GetStorage().read('userId'),
          'isOut': true,
          'isIn': false,
          'reason': 'reason',
          'to': 'id',
          'transaction_type': "Send"
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

    Response response = await Dio()
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
    final Map<String, dynamic> productListData = response.data;

    String requestResponce = 'your balnce is less than amount';
    productListData.forEach((key, value) async {
      accountName.forEach(
        (element) async {
          if (value['client_id'] == GetStorage().read('clientId') &&
              value['account_name'] == element) {
            if (int.parse(value['balance']) < int.parse(amount) ||
                requestResponce == 'success') {
              requestResponce = 'your balnce is less than amount';
            } else {
              requestResponce = 'success';
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
                            'balance': (int.parse(value['balance']) -
                                    int.parse(amount))
                                .toString(),
                            'bank_id': value['bank_id'],
                            'bank_logo': value['bank_logo'],
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

              await Dio().put(
                'https://sakhy-7f3ae-default-rtdb.firebaseio.com/accounts/$key.json',
                data: {
                  'account_id': value['account_id'],
                  'account_name': value['account_name'],
                  'account_type': value['account_type'],
                  'balance': (int.parse(value['balance']) - int.parse(amount))
                      .toString(),
                  'bank_id': value['bank_id'],
                  'bank_logo': value['bank_logo'],
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
    });

    print(requestResponce);

    return requestResponce;
  }
}
