import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_api_calling/api_calling/get_api_calling.dart';
import 'package:getx_api_calling/model/userData_model.dart';

class AppController extends GetxController {
  var getposts = <UserData>[].obs;
  UserDataClass userData = UserDataClass();
  var isloading = true.obs;

  @override
  void onInit() {
    callpostmethod();
    super.onInit();
  }

  callpostmethod() async {
    try {
      isloading.value = true;
      var result = await userData.getUserData();

      if (result != null) {
        getposts.assignAll(result);
      } else {
        log("null");
      }
    } finally {
      isloading.value = false;
    }
    update();
  }
}
