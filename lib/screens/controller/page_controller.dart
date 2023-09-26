import 'package:assignment/constants/colors.dart';
import 'package:get/get.dart';

class PageController extends GetxController {
  RxBool isClockIn = true.obs;
  // Rx<Data?> attendanceData = Rx<Data?>(null); // To store the user data
  RxBool isAttendance = false.obs; // To store the login message
  RxString attendanceMessage = ''.obs; // To store the login message
  Future<void> attendanceHome() async {
    try {
      isAttendance.value = true;
      // dynamic response = await AttendanceApi().attendanceIndex();
      // // AttendanceModel apiResponse = AttendanceModel.fromJson(response);
      // if (apiResponse.data != null) {
      //   attendanceData.value = apiResponse.data;
      // }
    } catch (e) {
      print('Error: $e');
      Get.snackbar("Errors", e.toString(), colorText: AppColors.white);
    } finally {
      isAttendance.value = false;
      // repeatCall();
    }
  }
}
