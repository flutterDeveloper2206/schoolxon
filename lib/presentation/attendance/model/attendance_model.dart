class AttendanceModel {
  String? type;
  String? keyValue;
  String? id;
  String? schoolId;
  String? studentSessionId;
  String? biometricAttendence;
  String? qrcodeAttendance;
  String? date;
  Null? punchtime;
  String? exittime;
  String? attendenceTypeId;
  String? remark;
  Null? biometricDeviceData;
  Null? userAgent;
  String? isActive;
  String? createdAt;
  Null? updatedAt;

  AttendanceModel(
      {this.type,
        this.keyValue,
        this.id,
        this.schoolId,
        this.studentSessionId,
        this.biometricAttendence,
        this.qrcodeAttendance,
        this.date,
        this.punchtime,
        this.exittime,
        this.attendenceTypeId,
        this.remark,
        this.biometricDeviceData,
        this.userAgent,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    keyValue = json['key_value'];
    id = json['id'];
    schoolId = json['school_id'];
    studentSessionId = json['student_session_id'];
    biometricAttendence = json['biometric_attendence'];
    qrcodeAttendance = json['qrcode_attendance'];
    date = json['date'];
    punchtime = json['punchtime'];
    exittime = json['exittime'];
    attendenceTypeId = json['attendence_type_id'];
    remark = json['remark'];
    biometricDeviceData = json['biometric_device_data'];
    userAgent = json['user_agent'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['key_value'] = this.keyValue;
    data['id'] = this.id;
    data['school_id'] = this.schoolId;
    data['student_session_id'] = this.studentSessionId;
    data['biometric_attendence'] = this.biometricAttendence;
    data['qrcode_attendance'] = this.qrcodeAttendance;
    data['date'] = this.date;
    data['punchtime'] = this.punchtime;
    data['exittime'] = this.exittime;
    data['attendence_type_id'] = this.attendenceTypeId;
    data['remark'] = this.remark;
    data['biometric_device_data'] = this.biometricDeviceData;
    data['user_agent'] = this.userAgent;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
