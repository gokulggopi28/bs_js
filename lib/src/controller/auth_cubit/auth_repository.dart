import 'package:bs_js/src/core/network/api_helper.dart';
import 'package:bs_js/src/core/network/api_response.dart';

class AuthRepository {
  Future login(String email, String password) async {
    ApiResponse response = await ApiHelper()
        .makePostRequest('user/login', {"email": email, "password": password});
    return response;
  }

}
