import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class SignInServices {
  static Future<String?> signIn(String email, String password) async {
    Response response = await Dio()
        .get('https://sakhy-7f3ae-default-rtdb.firebaseio.com/users.json',
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
    String checkUserFound = 'not found';
    productListData.forEach((key, value) {
      if (value['email'] == email && value['password'] == password) {
        final box = GetStorage();
        box.write("email", value['email']);
        box.write("userId", value['id']);

        checkUserFound = 'found';
      }
    });
    print(checkUserFound);
    return checkUserFound;
  }

  static Future<String?> loginInBank(
      String bankId, String email, String password) async {
    Response response = await Dio()
        .get('https://sakhy-7f3ae-default-rtdb.firebaseio.com/clients.json',
            options: Options(
                headers: {
                  "Content-Type": "application/json",
                },
                contentType: "application/x-www-form-urlencoded",
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                }));
    print(email);
    print(password);
    print(response.data);
    final Map<String, dynamic> productListData = response.data;
    String checkUserFound = 'not found';
    productListData.forEach((key, value) {
      if (value['email'] == email && value['password'] == password) {
        final box = GetStorage();
        print('client id');
        print(value['id']);
        box.write("clientId", value['id']);
        checkUserFound = 'found';
        addUserBankAccountData(bankId);
      }
    });
    return checkUserFound;
  }

  static Future<String?> addUserBankAccountData(String bankId) async {
    print(GetStorage().read('userId'));
    print(GetStorage().read('clientId'));

    String accountId = '';
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
    print(response.data);
    productListData.forEach((key, value) {
      if (value['client_id'] == GetStorage().read('clientId')) {
        accountId = value['account_id'];
      }
    });
    await Dio().post(
        'https://sakhy-7f3ae-default-rtdb.firebaseio.com/client_accounts.json',
        data: {
          'account_id': accountId,
          'bank_id': bankId,
          'client_id': GetStorage().read('clientId'),
          'id': "",
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
  }
}
