import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sakhy/models/account.dart';
import 'package:sakhy/models/beneficiarie.dart';

class BeneficiaryServices {
  static Future<String?> addLocalBeneficiary(
    String beneficiaryName,
    String beneficiaryAlias,
    String bankname,
  ) async {
    Response response = await Dio().post(
        'https://sakhy-7f3ae-default-rtdb.firebaseio.com/beneficiaries.json',
        data: {
          'beneficiary_alias': beneficiaryAlias,
          'beneficiary_name': beneficiaryName,
          'is_local': true,
          'bank_name': bankname,
          'account_id': "",
          'address': "",
          'comment': "",
          'email': "",
          'iban': "",
          'mobile': "",
          'user_id': GetStorage().read('userId')
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
    await Dio().put(
        'https://sakhy-7f3ae-default-rtdb.firebaseio.com/beneficiaries/${response.data['name']}.json',
        data: {
          'beneficiary_alias': beneficiaryAlias,
          'beneficiary_name': beneficiaryName,
          'is_local': true,
          'bank_name': bankname,
          'account_id': "",
          'address': "",
          'comment': "",
          'email': "",
          'iban': "",
          'mobile': "",
          'id': response.data['name'],
          'user_id': GetStorage().read('userId')
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
    String requestResponce = '';
    if (response.data['name'] != null) {
      requestResponce = 'success';
    } else {
      requestResponce = 'fail';
    }

    return requestResponce;
  }

  static Future<String?> addlnternationalBeneficiary(
    String beneficiaryName,
    String beneficiaryAlias,
    String bankname,
    String iban,
  ) async {
    Response response = await Dio().post(
        'https://sakhy-7f3ae-default-rtdb.firebaseio.com/beneficiaries.json',
        data: {
          'beneficiary_alias': beneficiaryAlias,
          'beneficiary_name': beneficiaryName,
          'is_local': false,
          'bank_name': bankname,
          'iban': iban,
          'account_id': "",
          'address': "",
          'comment': "",
          'email': "",
          'mobile': "",
          'user_id': GetStorage().read('userId')
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
    print(response);
    String requestResponce = '';
    if (response.data['name'] != null) {
      requestResponce = 'success';
    } else {
      requestResponce = 'fail';
    }

    return requestResponce;
  }

  static Future<List<Beneficiarie>?> getLocalBeneficiary() async {
    Response response = await Dio().get(
        'https://sakhy-7f3ae-default-rtdb.firebaseio.com/beneficiaries.json',
        options: Options(
            headers: {
              "Content-Type": "application/json",
            },
            contentType: "application/x-www-form-urlencoded",
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));

    List<Beneficiarie> temp = [];

    final Map<String, dynamic> productAccountsListData = response.data;
    productAccountsListData.forEach((key, value) {
      if (value['is_local'] == true) {
        temp.add(Beneficiarie.fromMap(value));
      }
    });

    return temp;
  }

  static Future<List<Beneficiarie>?> getlnternationalBeneficiary() async {
    Response response = await Dio().get(
        'https://sakhy-7f3ae-default-rtdb.firebaseio.com/beneficiaries.json',
        options: Options(
            headers: {
              "Content-Type": "application/json",
            },
            contentType: "application/x-www-form-urlencoded",
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));

    List<Beneficiarie> temp = [];
    print(response.data);

    final Map<String, dynamic> productAccountsListData = response.data;
    productAccountsListData.forEach((key, value) {
      if (value['is_local'] == false) {
        temp.add(Beneficiarie.fromMap(value));
      }
    });

    return temp;
  }

  static Future<String?> beneficiarySendMoney(
    String id,
    String amount,
    String reason,
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

  static Future<String?> beneficiaryRequestMoney(
    String id,
    String amount,
    String reason,
  ) async {
    Response response = await Dio().post(
        'https://sakhy-7f3ae-default-rtdb.firebaseio.com/money_requests.json',
        data: {
          'amount': amount,
          'client_id:': GetStorage().read('userId'),
          'creation_time': DateTime.now().toString(),
          'from': id,
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
          'client_id:': GetStorage().read('userId'),
          'creation_time': DateTime.now().toString(),
          'from': id,
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

  static Future<String?> donation(
    String amount,
    String organization,
  ) async {
    Response response = await Dio()
        .post('https://sakhy-7f3ae-default-rtdb.firebaseio.com/donation.json',
            data: {
              'amount': amount,
              'client_id': GetStorage().read('userId'),
              'currency': "SAR",
              'id': "",
              'organization': organization
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
    await Dio().put(
        'https://sakhy-7f3ae-default-rtdb.firebaseio.com/donation/${response.data['name']}.json',
        data: {
          'amount': amount,
          'client_id': GetStorage().read('userId'),
          'currency': "SAR",
          'id': response.data['name'],
          'organization': organization
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

    return requestResponce;
  }

  static Future<String?> bill(
    String amount,
    String title,
    String billNumber,
  ) async {
    print('in');

    Response response = await Dio()
        .post('https://sakhy-7f3ae-default-rtdb.firebaseio.com/bills.json',
            data: {
              'amount': amount,
              'bill_number': billNumber,
              'bill_type': '',
              'creation_date': DateTime.now().toString(),
              'currency': 'SAR',
              'due_date': DateTime.now().toString(),
              'id': '',
              'status': 'pending',
              'title': title,
              'to': '',
              'user_id': GetStorage().read('userId')
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
    await Dio().put(
        'https://sakhy-7f3ae-default-rtdb.firebaseio.com/bills/${response.data['name']}.json',
        data: {
          'amount': amount,
          'bill_number': billNumber,
          'bill_type': '',
          'creation_date': DateTime.now().toString(),
          'currency': 'SAR',
          'due_date': DateTime.now().toString(),
          'id': response.data['name'],
          'status': 'pending',
          'title': title,
          'to': '',
          'user_id': GetStorage().read('userId')
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

    return requestResponce;
  }
}
