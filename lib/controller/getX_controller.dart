import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_api_calling/api_calling/get_api_calling.dart';
import 'package:getx_api_calling/model/userData_model.dart';

class AppController extends GetxController {
  var getposts = <UserData>[].obs;
  Services services = Services();
  var isloading = true.obs;

  @override
  void onInit() {
    callpostmethod();
    super.onInit();
  }

  callpostmethod() async {
    try {
      isloading.value = true;
      var result = await services.getData();

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
