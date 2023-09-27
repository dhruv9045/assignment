import 'package:assignment/constants/keys.dart';
import 'package:get/get.dart';

import '../../api/urls.dart';
import '../../constants/handle_exception.dart';

class AttendanceApi extends GetConnect {
  final HandleException handleException = HandleException();

  Future<dynamic> usersResponse(body) async {
    try {
      final response =
          await post(ApiUrl.baseUrl + ApiUrl.endPointUrl, body, headers: {
        "Authorization": AppKeys.authToken,
        "Content-Type": "application/json",
        "Accept": "application/json"
      });
      print(response.body);
      print(response.statusCode);
      return handleException.returnResponse(response: response);
    } catch (e) {
      print('Exception: $e');

      rethrow; // Rethrow the exception to the caller
    }
  }
}
