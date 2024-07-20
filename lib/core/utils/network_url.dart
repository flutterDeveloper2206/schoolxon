class NetworkUrl {
  static const String baseUrl = 'https://api.aischoolara.com/api/';
  static const String imageBaseUrl = 'https://api.aischoolara.com/';

  static const String getSchoolUrl = '${baseUrl}Schdetails/index';
  static const String loginUrl = '${baseUrl}AuthStudent/loginstudent/';
  static const String getStudentByIdUrl = '${baseUrl}AuthStudent/getstudent/';
  static const String applyLeaveUrl = '${baseUrl}leave/apply/';
  static const String showAllHomeWorkUrl =
      '${baseUrl}homework/showallhomeworks/';
  static const String homeWorkDetailsUrl =
      '${baseUrl}homework/homework_details/';
  static const String allLeaveGetUrl = '${baseUrl}leave/showallleaverequest/';
  static const String getStudentUrl = '${baseUrl}AuthStudent/getstudent/';
  static const String updateProfileUrl = '${baseUrl}AuthStudent/profileUpdate/';
}
