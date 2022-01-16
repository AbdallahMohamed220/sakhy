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
      if (value['email'] == email.toLowerCase() &&
          value['password'] == password) {
        final box = GetStorage();
        box.write("email", value['email']);
        box.write("userName", value['first_name'] + ' ' + value['last_name']);
        box.write("userId", value['id']);

        checkUserFound = 'found';
      }
    });
    return checkUserFound;
  }

  static Future<String?> loginInBank(
      String bankId, String email, String password) async {
    Response response = await Dio().get(
      'https://sakhy-7f3ae-default-rtdb.firebaseio.com/clients.json',
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

    final Map<String, dynamic> productListData = response.data;
    String checkUserFound = 'not found';
    productListData.forEach(
      (key, value) async {
        if (value['email'] == email.toLowerCase() &&
            value['password'] == password &&
            value['bank_id'] == bankId) {
          final box = GetStorage();
          box.write("clientId", value['id']);
          checkUserFound = 'found';
          await addUserBankAccountData(bankId);
        }
      },
    );
    return checkUserFound;
  }

  static Future<void> addUserBankAccountData(String bankId) async {
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
    productListData.forEach((key, value) {
      if (value['client_id'] == GetStorage().read('clientId') &&
          value['bank_id'] == bankId) {
        accountId = value['account_id'];
      }
    });

    Response response2 = await Dio().get(
      'https://sakhy-7f3ae-default-rtdb.firebaseio.com/client_accounts.json',
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
    if (response2.data == null) {
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
          },
        ),
      );
      return;
    } else {
      String isFound = 'not found';
      final Map<String, dynamic> productListData2 = response2.data;

      productListData2.forEach(
        (key, value2) async {
          if (value2['client_id'] == GetStorage().read('clientId') &&
              value2['bank_id'] == bankId) {
            isFound = 'found';

            return;
          }
        },
      );
      if (isFound == 'not found') {
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
            },
          ),
        );
      }
    }
  }
}
