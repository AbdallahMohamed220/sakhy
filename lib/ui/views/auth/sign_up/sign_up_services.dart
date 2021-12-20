import 'package:dio/dio.dart';
import 'package:sakhy/ui/views/auth/sign_in/sign_in_services.dart';

class SignUpServices {
  static Future<String?> signUp(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    String signInStats = '';
    String signUpStats = '';

    signInStats = (await SignInServices.signIn(email.toLowerCase(), password))!;
    if (signInStats == 'found') {
      signUpStats = 'fail';
    } else {
      Response response = await Dio()
          .post('https://sakhy-7f3ae-default-rtdb.firebaseio.com/users.json',
              data: {
                'email': email.toLowerCase(),
                'password': password,
                'address': "Gedah",
                'first_name': firstName,
                'id': "",
                'last_name': lastName,
                'mobile': "+9662565645",
                'national_id': "67345454845634",
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
      if (response.data['name'] != null) {
        signUpStats = 'success';
        await Dio().put(
            'https://sakhy-7f3ae-default-rtdb.firebaseio.com/users/${response.data['name']}.json',
            data: {
              'email': email.toLowerCase(),
              'password': password,
              'address': "Gedah",
              'first_name': firstName,
              'id': response.data['name'],
              'last_name': lastName,
              'mobile': "+9662565645",
              'national_id': "67345454845634",
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
        signUpStats = 'fail';
      }
    }

    return signUpStats;
  }
}
