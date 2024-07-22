// To parse this JSON data, do
//
//     final attendanceModel = attendanceModelFromJson(jsonString);

import 'dart:convert';

AttendanceModel attendanceModelFromJson(String str) =>
    AttendanceModel.fromJson(json.decode(str));

String attendanceModelToJson(AttendanceModel data) =>
    json.encode(data.toJson());

class AttendanceModel {
  final String? type;
  final String? keyValue;
  final String? id;
  final String? schoolId;
  final String? studentSessionId;
  final String? biometricAttendence;
  final String? qrcodeAttendance;
  final DateTime? date;
  final DateTime? punchtime;
  final DateTime? exittime;
  final String? attendenceTypeId;
  final String? remark;
  final String? biometricDeviceData;
  final dynamic userAgent;
  final String? isActive;
  final DateTime? createdAt;
  final dynamic updatedAt;

  AttendanceModel({
    this.type,
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
    this.updatedAt,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      AttendanceModel(
        type: json["type"],
        keyValue: json["key_value"],
        id: json["id"],
        schoolId: json["school_id"],
        studentSessionId: json["student_session_id"],
        biometricAttendence: json["biometric_attendence"],
        qrcodeAttendance: json["qrcode_attendance"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        punchtime: json["punchtime"] == null ||
                json["punchtime"] == '' ||
                json["punchtime"] == 'null'
            ? null
            : DateTime.parse(json["punchtime"]),
        exittime: json["exittime"] == null ||
                json["exittime"] == '' ||
                json["exittime"] == 'null'
            ? null
            : DateTime.parse(json["exittime"]),
        attendenceTypeId: json["attendence_type_id"],
        remark: json["remark"],
        biometricDeviceData: json["biometric_device_data"],
        userAgent: json["user_agent"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "key_value": keyValue,
        "id": id,
        "school_id": schoolId,
        "student_session_id": studentSessionId,
        "biometric_attendence": biometricAttendence,
        "qrcode_attendance": qrcodeAttendance,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "punchtime": punchtime?.toIso8601String(),
        "exittime": exittime?.toIso8601String(),
        "attendence_type_id": attendenceTypeId,
        "remark": remark,
        "biometric_device_data": biometricDeviceData,
        "user_agent": userAgent,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
      };
}
