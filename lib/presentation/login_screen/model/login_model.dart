// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final List<SchDetail>? schDetails;
  final Student? student;

  LoginModel({
    this.schDetails,
    this.student,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        schDetails: json["sch_details"] == null
            ? []
            : List<SchDetail>.from(
                json["sch_details"]!.map((x) => SchDetail.fromJson(x))),
        student:
            json["student"] == null ? null : Student.fromJson(json["student"]),
      );

  Map<String, dynamic> toJson() => {
        "sch_details": schDetails == null
            ? []
            : List<dynamic>.from(schDetails!.map((x) => x.toJson())),
        "student": student?.toJson(),
      };
}

class SchDetail {
  final String? lastname;
  final String? middlename;
  final String? id;
  final String? langId;
  final String? languages;
  final String? classTeacher;
  final String? cronSecretKey;
  final String? timezone;
  final String? superadminRestriction;
  final String? studentTimeline;
  final String? name;
  final String? email;
  final String? biometric;
  final String? biometricDevice;
  final String? timeFormat;
  final String? phone;
  final String? language;
  final String? attendenceType;
  final String? address;
  final String? diseCode;
  final String? dateFormat;
  final String? currency;
  final String? currencyPlace;
  final String? startMonth;
  final String? startWeek;
  final String? sessionId;
  final String? feeDueDays;
  final String? image;
  final String? theme;
  final String? session;
  final String? onlineAdmission;
  final String? isDuplicateFeesInvoice;
  final String? isStudentHouse;
  final String? isBloodGroup;
  final String? adminLogo;
  final String? adminSmallLogo;
  final String? mobileApiUrl;
  final dynamic appPrimaryColorCode;
  final dynamic appSecondaryColorCode;
  final String? appLogo;
  final String? studentProfileEdit;
  final String? staffBarcode;
  final String? studentBarcode;
  final String? isRtl;
  final String? studentPanelLogin;
  final String? parentPanelLogin;
  final String? currencyFormat;
  final String? examResult;
  final String? baseUrl;
  final String? folderPath;
  final String? currencySymbol;
  final String? basePrice;
  final dynamic onlineAdmissionApplicationForm;
  final String? currencyId;
  final String? adminLoginPageBackground;
  final String? userLoginPageBackground;
  final String? lowAttendanceLimit;

  SchDetail({
    this.lastname,
    this.middlename,
    this.id,
    this.langId,
    this.languages,
    this.classTeacher,
    this.cronSecretKey,
    this.timezone,
    this.superadminRestriction,
    this.studentTimeline,
    this.name,
    this.email,
    this.biometric,
    this.biometricDevice,
    this.timeFormat,
    this.phone,
    this.language,
    this.attendenceType,
    this.address,
    this.diseCode,
    this.dateFormat,
    this.currency,
    this.currencyPlace,
    this.startMonth,
    this.startWeek,
    this.sessionId,
    this.feeDueDays,
    this.image,
    this.theme,
    this.session,
    this.onlineAdmission,
    this.isDuplicateFeesInvoice,
    this.isStudentHouse,
    this.isBloodGroup,
    this.adminLogo,
    this.adminSmallLogo,
    this.mobileApiUrl,
    this.appPrimaryColorCode,
    this.appSecondaryColorCode,
    this.appLogo,
    this.studentProfileEdit,
    this.staffBarcode,
    this.studentBarcode,
    this.isRtl,
    this.studentPanelLogin,
    this.parentPanelLogin,
    this.currencyFormat,
    this.examResult,
    this.baseUrl,
    this.folderPath,
    this.currencySymbol,
    this.basePrice,
    this.onlineAdmissionApplicationForm,
    this.currencyId,
    this.adminLoginPageBackground,
    this.userLoginPageBackground,
    this.lowAttendanceLimit,
  });

  factory SchDetail.fromJson(Map<String, dynamic> json) => SchDetail(
        lastname: json["lastname"],
        middlename: json["middlename"],
        id: json["id"],
        langId: json["lang_id"],
        languages: json["languages"],
        classTeacher: json["class_teacher"],
        cronSecretKey: json["cron_secret_key"],
        timezone: json["timezone"],
        superadminRestriction: json["superadmin_restriction"],
        studentTimeline: json["student_timeline"],
        name: json["name"],
        email: json["email"],
        biometric: json["biometric"],
        biometricDevice: json["biometric_device"],
        timeFormat: json["time_format"],
        phone: json["phone"],
        language: json["language"],
        attendenceType: json["attendence_type"],
        address: json["address"],
        diseCode: json["dise_code"],
        dateFormat: json["date_format"],
        currency: json["currency"],
        currencyPlace: json["currency_place"],
        startMonth: json["start_month"],
        startWeek: json["start_week"],
        sessionId: json["session_id"],
        feeDueDays: json["fee_due_days"],
        image: json["image"],
        theme: json["theme"],
        session: json["session"],
        onlineAdmission: json["online_admission"],
        isDuplicateFeesInvoice: json["is_duplicate_fees_invoice"],
        isStudentHouse: json["is_student_house"],
        isBloodGroup: json["is_blood_group"],
        adminLogo: json["admin_logo"],
        adminSmallLogo: json["admin_small_logo"],
        mobileApiUrl: json["mobile_api_url"],
        appPrimaryColorCode: json["app_primary_color_code"],
        appSecondaryColorCode: json["app_secondary_color_code"],
        appLogo: json["app_logo"],
        studentProfileEdit: json["student_profile_edit"],
        staffBarcode: json["staff_barcode"],
        studentBarcode: json["student_barcode"],
        isRtl: json["is_rtl"],
        studentPanelLogin: json["student_panel_login"],
        parentPanelLogin: json["parent_panel_login"],
        currencyFormat: json["currency_format"],
        examResult: json["exam_result"],
        baseUrl: json["base_url"],
        folderPath: json["folder_path"],
        currencySymbol: json["currency_symbol"],
        basePrice: json["base_price"],
        onlineAdmissionApplicationForm:
            json["online_admission_application_form"],
        currencyId: json["currency_id"],
        adminLoginPageBackground: json["admin_login_page_background"],
        userLoginPageBackground: json["user_login_page_background"],
        lowAttendanceLimit: json["low_attendance_limit"],
      );

  Map<String, dynamic> toJson() => {
        "lastname": lastname,
        "middlename": middlename,
        "id": id,
        "lang_id": langId,
        "languages": languages,
        "class_teacher": classTeacher,
        "cron_secret_key": cronSecretKey,
        "timezone": timezone,
        "superadmin_restriction": superadminRestriction,
        "student_timeline": studentTimeline,
        "name": name,
        "email": email,
        "biometric": biometric,
        "biometric_device": biometricDevice,
        "time_format": timeFormat,
        "phone": phone,
        "language": language,
        "attendence_type": attendenceType,
        "address": address,
        "dise_code": diseCode,
        "date_format": dateFormat,
        "currency": currency,
        "currency_place": currencyPlace,
        "start_month": startMonth,
        "start_week": startWeek,
        "session_id": sessionId,
        "fee_due_days": feeDueDays,
        "image": image,
        "theme": theme,
        "session": session,
        "online_admission": onlineAdmission,
        "is_duplicate_fees_invoice": isDuplicateFeesInvoice,
        "is_student_house": isStudentHouse,
        "is_blood_group": isBloodGroup,
        "admin_logo": adminLogo,
        "admin_small_logo": adminSmallLogo,
        "mobile_api_url": mobileApiUrl,
        "app_primary_color_code": appPrimaryColorCode,
        "app_secondary_color_code": appSecondaryColorCode,
        "app_logo": appLogo,
        "student_profile_edit": studentProfileEdit,
        "staff_barcode": staffBarcode,
        "student_barcode": studentBarcode,
        "is_rtl": isRtl,
        "student_panel_login": studentPanelLogin,
        "parent_panel_login": parentPanelLogin,
        "currency_format": currencyFormat,
        "exam_result": examResult,
        "base_url": baseUrl,
        "folder_path": folderPath,
        "currency_symbol": currencySymbol,
        "base_price": basePrice,
        "online_admission_application_form": onlineAdmissionApplicationForm,
        "currency_id": currencyId,
        "admin_login_page_background": adminLoginPageBackground,
        "user_login_page_background": userLoginPageBackground,
        "low_attendance_limit": lowAttendanceLimit,
      };
}

class Student {
  final String? id;
  final String? loginUsername;
  final String? studentId;
  final String? role;
  final String? username;
  final String? currency;
  final String? currencyBasePrice;
  final String? currencyFormat;
  final String? currencySymbol;
  final String? currencyName;
  final String? currencyPlace;
  final String? dateFormat;
  final String? startWeek;
  final String? timezone;
  final String? schName;
  final Language? language;
  final String? isRtl;
  final String? theme;
  final String? image;
  final String? gender;
  final DbArray? dbArray;
  final String? superadminRestriction;

  Student({
    this.id,
    this.loginUsername,
    this.studentId,
    this.role,
    this.username,
    this.currency,
    this.currencyBasePrice,
    this.currencyFormat,
    this.currencySymbol,
    this.currencyName,
    this.currencyPlace,
    this.dateFormat,
    this.startWeek,
    this.timezone,
    this.schName,
    this.language,
    this.isRtl,
    this.theme,
    this.image,
    this.gender,
    this.dbArray,
    this.superadminRestriction,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        loginUsername: json["login_username"],
        studentId: json["student_id"],
        role: json["role"],
        username: json["username"],
        currency: json["currency"],
        currencyBasePrice: json["currency_base_price"],
        currencyFormat: json["currency_format"],
        currencySymbol: json["currency_symbol"],
        currencyName: json["currency_name"],
        currencyPlace: json["currency_place"],
        dateFormat: json["date_format"],
        startWeek: json["start_week"],
        timezone: json["timezone"],
        schName: json["sch_name"],
        language: json["language"] == null
            ? null
            : Language.fromJson(json["language"]),
        isRtl: json["is_rtl"],
        theme: json["theme"],
        image: json["image"],
        gender: json["gender"],
        dbArray: json["db_array"] == null
            ? null
            : DbArray.fromJson(json["db_array"]),
        superadminRestriction: json["superadmin_restriction"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "login_username": loginUsername,
        "student_id": studentId,
        "role": role,
        "username": username,
        "currency": currency,
        "currency_base_price": currencyBasePrice,
        "currency_format": currencyFormat,
        "currency_symbol": currencySymbol,
        "currency_name": currencyName,
        "currency_place": currencyPlace,
        "date_format": dateFormat,
        "start_week": startWeek,
        "timezone": timezone,
        "sch_name": schName,
        "language": language?.toJson(),
        "is_rtl": isRtl,
        "theme": theme,
        "image": image,
        "gender": gender,
        "db_array": dbArray?.toJson(),
        "superadmin_restriction": superadminRestriction,
      };
}

class DbArray {
  final String? baseUrl;
  final String? folderPath;
  final String? dbGroup;

  DbArray({
    this.baseUrl,
    this.folderPath,
    this.dbGroup,
  });

  factory DbArray.fromJson(Map<String, dynamic> json) => DbArray(
        baseUrl: json["base_url"],
        folderPath: json["folder_path"],
        dbGroup: json["db_group"],
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "folder_path": folderPath,
        "db_group": dbGroup,
      };
}

class Language {
  final String? langId;
  final String? language;

  Language({
    this.langId,
    this.language,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        langId: json["lang_id"],
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "lang_id": langId,
        "language": language,
      };
}
