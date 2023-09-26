import 'package:assignment/constants/keys.dart';
import 'package:get/get.dart';

import '../../api/urls.dart';
import '../../constants/handle_exception.dart';

class AttendanceApi extends GetConnect {
  final HandleException handleException = HandleException();

  Future<dynamic> pageResponse() async {
    try {
      final response = await get(ApiUrl.baseUrl, headers: {
        "Authorization": 'Bearer ${AppKeys.authToken}',
        "Content-Type": "application/json",
        "Accept": "application/json"
      });
      print(response.body);
      print(response.statusCode);
      return handleException.returnResponse(response: response);
    } catch (e) {
      // Handle exceptions here
      print('Exception: $e');

      rethrow; // Rethrow the exception to the caller
    }
  }
}
