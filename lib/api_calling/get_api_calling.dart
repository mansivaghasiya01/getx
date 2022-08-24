import 'dart:async';
import 'dart:developer';

import 'package:getx_api_calling/model/userData_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Services {
  Future<List<UserData>?> getData() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));

      if (response.statusCode == 200) {
        List jsonresponse = convert.jsonDecode(response.body);
        return jsonresponse.map((e) => UserData.fromJson(e)).toList();
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      log("response time out");
    }
  }
}
