import 'dart:developer';
import 'package:flutter/rendering.dart';
import 'package:get/get_connect/connect.dart';
import 'package:schoolxon/core/utils/pref_utils.dart';
import 'package:schoolxon/core/utils/string_constant.dart';
import '../core/utils/common_function.dart';
import '../core/utils/progress_dialog_utils.dart';
import 'network_info.dart';

class ApiService extends GetConnect {
  ApiService() {
    timeout = const Duration(seconds: 120);
  }
  var headers;
  var headersWithToken;
  var contentType;
  String authToken = '';

  Future<void> getToken() async {}

  Future<void> initApiService() async {
    await NetworkInfo.checkNetwork().whenComplete(() async {
      authToken = await PrefUtils.getString(AppString.AUTH_TOKEN);
      print("Auth Token from API service is :- $authToken");
      headers = {"Accept": "application/json"};
      headersWithToken = {
        "Accept": "application/json",
        "Authorization": "Bearer" + " " + "$authToken"
      };
      contentType = "multipart/form-data";
    });
  }

  Future<dynamic> callPostApi(
      {required body,
      required url,
      bool showLoader = true,
      bool headerWithToken = true}) async {
    if (isLogPrint) {
      debugPrint("API :- $url");
    }

    if (showLoader) {
      ProgressDialogUtils.showProgressDialog(isCancellable: false);
    }
    await initApiService();

    final response = await post(
      url,
      body,
      headers: headerWithToken ? headersWithToken : headers,
      contentType: contentType,
    );
    if (isLogPrint) {
      debugPrint(
          "STATUSCODE = ${response.statusCode}\nRESPONSE :- ${response.body}");
    }
    if (response.status.hasError) {
      if (showLoader) {
        ProgressDialogUtils.hideProgressDialog();
      }
      return response;
    } else {
      if (showLoader) {
        ProgressDialogUtils.hideProgressDialog();
      }
      return response;
    }
  }

  Future<Response> callGetApi(
      {required FormData body,
      required url,
      bool showLoader = true,
      bool headerWithToken = true}) async {
    if (isLogPrint) {
      debugPrint("API :- $url");
      debugPrint("API :- ${isLogPrint.toString()}");
    }

    if (showLoader) {
      ProgressDialogUtils.showProgressDialog(isCancellable: false);
    }
    await initApiService();

    final response = await get(
      url,
      headers: headerWithToken ? headersWithToken : headers,
      contentType: contentType,
    );
    if (isLogPrint) {
      debugPrint("RESPONSE :- ${response.body}");
    }

    if (response.status.hasError) {
      if (showLoader) {
        ProgressDialogUtils.hideProgressDialog();
      }
      return response;
    } else {
      if (showLoader) {
        ProgressDialogUtils.hideProgressDialog();
      }
      return response;
    }
  }

  Future<FormData> getBlankApiBody() async {
    final form = FormData({});
    return form;
  }
}
