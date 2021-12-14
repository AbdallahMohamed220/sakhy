import 'package:dio/dio.dart';
import 'package:sakhy/ui/views/auth/sign_in/sign_in_services.dart';

class SignUpServices {
  static Future<String?> signUp(String email, String password) async {
    String signInStats = '';
    String signUpStats = '';

    signInStats = (await SignInServices.signIn(email, password))!;
    if (signInStats == 'found') {
      signUpStats = 'fail';
    } else {
      Response response = await Dio()
          .post('https://sakhy-7f3ae-default-rtdb.firebaseio.com/users.json',
              data: {'email': email, 'password': password},
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
      } else {
        signUpStats = 'fail';
      }
    }

    return signUpStats;
  }
}
