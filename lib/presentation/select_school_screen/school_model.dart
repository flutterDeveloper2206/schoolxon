class SchoolModel {
  String? lastname;
  String? middlename;
  String? id;
  String? langId;
  String? languages;
  String? classTeacher;
  String? cronSecretKey;
  String? timezone;
  String? superadminRestriction;
  String? studentTimeline;
  String? name;
  String? email;
  String? biometric;
  String? biometricDevice;
  String? timeFormat;
  String? phone;
  String? language;
  String? attendenceType;
  String? address;
  String? diseCode;
  String? dateFormat;
  String? currency;
  String? currencyPlace;
  String? startMonth;
  String? startWeek;
  String? sessionId;
  String? feeDueDays;
  String? image;
  String? theme;
  String? session;
  String? onlineAdmission;
  String? isDuplicateFeesInvoice;
  String? isStudentHouse;
  String? isBloodGroup;
  String? adminLogo;
  String? adminSmallLogo;
  String? mobileApiUrl;
  String? appPrimaryColorCode;
  String? appSecondaryColorCode;
  String? appLogo;
  String? studentProfileEdit;
  String? staffBarcode;
  String? studentBarcode;
  String? isRtl;
  String? studentPanelLogin;
  String? parentPanelLogin;
  String? currencyFormat;
  String? examResult;
  String? baseUrl;
  String? folderPath;
  String? currencySymbol;
  String? basePrice;
  String? onlineAdmissionApplicationForm;
  String? currencyId;
  String? adminLoginPageBackground;
  String? userLoginPageBackground;
  String? lowAttendanceLimit;

  SchoolModel(
      {this.lastname,
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
      this.lowAttendanceLimit});

  SchoolModel.fromJson(Map<String, dynamic> json) {
    lastname = json['lastname'];
    middlename = json['middlename'];
    id = json['id'];
    langId = json['lang_id'];
    languages = json['languages'];
    classTeacher = json['class_teacher'];
    cronSecretKey = json['cron_secret_key'];
    timezone = json['timezone'];
    superadminRestriction = json['superadmin_restriction'];
    studentTimeline = json['student_timeline'];
    name = json['name'];
    email = json['email'];
    biometric = json['biometric'];
    biometricDevice = json['biometric_device'];
    timeFormat = json['time_format'];
    phone = json['phone'];
    language = json['language'];
    attendenceType = json['attendence_type'];
    address = json['address'];
    diseCode = json['dise_code'];
    dateFormat = json['date_format'];
    currency = json['currency'];
    currencyPlace = json['currency_place'];
    startMonth = json['start_month'];
    startWeek = json['start_week'];
    sessionId = json['session_id'];
    feeDueDays = json['fee_due_days'];
    image = json['image'];
    theme = json['theme'];
    session = json['session'];
    onlineAdmission = json['online_admission'];
    isDuplicateFeesInvoice = json['is_duplicate_fees_invoice'];
    isStudentHouse = json['is_student_house'];
    isBloodGroup = json['is_blood_group'];
    adminLogo = json['admin_logo'];
    adminSmallLogo = json['admin_small_logo'];
    mobileApiUrl = json['mobile_api_url'];
    appPrimaryColorCode = json['app_primary_color_code'];
    appSecondaryColorCode = json['app_secondary_color_code'];
    appLogo = json['app_logo'];
    studentProfileEdit = json['student_profile_edit'];
    staffBarcode = json['staff_barcode'];
    studentBarcode = json['student_barcode'];
    isRtl = json['is_rtl'];
    studentPanelLogin = json['student_panel_login'];
    parentPanelLogin = json['parent_panel_login'];
    currencyFormat = json['currency_format'];
    examResult = json['exam_result'];
    baseUrl = json['base_url'];
    folderPath = json['folder_path'];
    currencySymbol = json['currency_symbol'];
    basePrice = json['base_price'];
    onlineAdmissionApplicationForm = json['online_admission_application_form'];
    currencyId = json['currency_id'];
    adminLoginPageBackground = json['admin_login_page_background'];
    userLoginPageBackground = json['user_login_page_background'];
    lowAttendanceLimit = json['low_attendance_limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastname'] = lastname;
    data['middlename'] = middlename;
    data['id'] = id;
    data['lang_id'] = langId;
    data['languages'] = languages;
    data['class_teacher'] = classTeacher;
    data['cron_secret_key'] = cronSecretKey;
    data['timezone'] = timezone;
    data['superadmin_restriction'] = superadminRestriction;
    data['student_timeline'] = studentTimeline;
    data['name'] = name;
    data['email'] = email;
    data['biometric'] = biometric;
    data['biometric_device'] = biometricDevice;
    data['time_format'] = timeFormat;
    data['phone'] = phone;
    data['language'] = language;
    data['attendence_type'] = attendenceType;
    data['address'] = address;
    data['dise_code'] = diseCode;
    data['date_format'] = dateFormat;
    data['currency'] = currency;
    data['currency_place'] = currencyPlace;
    data['start_month'] = startMonth;
    data['start_week'] = startWeek;
    data['session_id'] = sessionId;
    data['fee_due_days'] = feeDueDays;
    data['image'] = image;
    data['theme'] = theme;
    data['session'] = session;
    data['online_admission'] = onlineAdmission;
    data['is_duplicate_fees_invoice'] = isDuplicateFeesInvoice;
    data['is_student_house'] = isStudentHouse;
    data['is_blood_group'] = isBloodGroup;
    data['admin_logo'] = adminLogo;
    data['admin_small_logo'] = adminSmallLogo;
    data['mobile_api_url'] = mobileApiUrl;
    data['app_primary_color_code'] = appPrimaryColorCode;
    data['app_secondary_color_code'] = appSecondaryColorCode;
    data['app_logo'] = appLogo;
    data['student_profile_edit'] = studentProfileEdit;
    data['staff_barcode'] = staffBarcode;
    data['student_barcode'] = studentBarcode;
    data['is_rtl'] = isRtl;
    data['student_panel_login'] = studentPanelLogin;
    data['parent_panel_login'] = parentPanelLogin;
    data['currency_format'] = currencyFormat;
    data['exam_result'] = examResult;
    data['base_url'] = baseUrl;
    data['folder_path'] = folderPath;
    data['currency_symbol'] = currencySymbol;
    data['base_price'] = basePrice;
    data['online_admission_application_form'] = onlineAdmissionApplicationForm;
    data['currency_id'] = currencyId;
    data['admin_login_page_background'] = adminLoginPageBackground;
    data['user_login_page_background'] = userLoginPageBackground;
    data['low_attendance_limit'] = lowAttendanceLimit;
    return data;
  }
}
