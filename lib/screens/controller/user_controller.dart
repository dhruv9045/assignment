import 'dart:convert';

import 'package:assignment/constants/colors.dart';
import 'package:assignment/screens/model/user_model.dart' as um;
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../services/api_service.dart';

class UserController extends GetxController {
  RxList<um.ExtraData> dataList = <um.ExtraData>[].obs;
  RxBool isLoading = false.obs;
  // RxInt page = 1.obs;
  RxInt pageSize = 20.obs;
  final PagingController<int, um.ExtraData> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      fetchUsers(pageKey);
    });
  }

  Future<void> fetchUsers(int pageKey) async {
    try {
      isLoading.value = true;
      dataList.removeRange(0, dataList.length);
      var body = jsonEncode({
        "clubId": "3",
        "filterOption": "All",
        "pageNumber": "${pageKey}",
        "apiType": "mobile"
      });
      dynamic response = await AttendanceApi().usersResponse(body);
      um.UsersModel apiResponse = um.UsersModel.fromJson(response);
      if (apiResponse.extraData != null) {
        dataList.assignAll(apiResponse.extraData!);
        final isLastPage = dataList.length < pageSize.value;
        if (isLastPage) {
          pagingController.appendLastPage(dataList);
        } else {
          pagingController.appendPage(dataList, pageKey + 1);
        }
      } else {
        pagingController.appendLastPage(dataList);
        Get.snackbar("Error", apiResponse.message.toString(),
            colorText: AppColors.white);
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar("Error", e.toString(), colorText: AppColors.white);
    } finally {
      isLoading.value = false;
      // repeatCall();
    }
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }
}
