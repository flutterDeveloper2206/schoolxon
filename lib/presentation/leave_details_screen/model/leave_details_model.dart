// To parse this JSON data, do
//
//     final leaveDetailsModel = leaveDetailsModelFromJson(jsonString);

import 'dart:convert';

LeaveDetailsModel leaveDetailsModelFromJson(String str) => LeaveDetailsModel.fromJson(json.decode(str));

String leaveDetailsModelToJson(LeaveDetailsModel data) => json.encode(data.toJson());

class LeaveDetailsModel {
  final String? id;
  final String? studentSessionId;
  final String? subject;
  final String? fromDate;
  final String? toDate;
  final String? applyDate;
  final String? status;
  final String? docs;
  final String? reason;
  final dynamic approveBy;
  final dynamic approveDate;
  final String? requestType;
  final DateTime? createdAt;
  final String? firstname;
  final String? middlename;
  final String? lastname;
  final dynamic staffId;
  final dynamic staffName;
  final String? studId;
  final String? admissionNo;
  final dynamic surname;
  final String? classId;
  final String? sectionId;
  final String? leaveDetailsModelClass;
  final String? section;

  LeaveDetailsModel({
    this.id,
    this.studentSessionId,
    this.subject,
    this.fromDate,
    this.toDate,
    this.applyDate,
    this.status,
    this.docs,
    this.reason,
    this.approveBy,
    this.approveDate,
    this.requestType,
    this.createdAt,
    this.firstname,
    this.middlename,
    this.lastname,
    this.staffId,
    this.staffName,
    this.studId,
    this.admissionNo,
    this.surname,
    this.classId,
    this.sectionId,
    this.leaveDetailsModelClass,
    this.section,
  });

  factory LeaveDetailsModel.fromJson(Map<String, dynamic> json) => LeaveDetailsModel(
    id: json["id"],
    studentSessionId: json["student_session_id"],
    subject: json["subject"],
    fromDate: json["from_date"],
    toDate: json["to_date"],
    applyDate: json["apply_date"],
    status: json["status"],
    docs: json["docs"],
    reason: json["reason"],
    approveBy: json["approve_by"],
    approveDate: json["approve_date"],
    requestType: json["request_type"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    firstname: json["firstname"],
    middlename: json["middlename"],
    lastname: json["lastname"],
    staffId: json["staff_id"],
    staffName: json["staff_name"],
    studId: json["stud_id"],
    admissionNo: json["admission_no"],
    surname: json["surname"],
    classId: json["class_id"],
    sectionId: json["section_id"],
    leaveDetailsModelClass: json["class"],
    section: json["section"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "student_session_id": studentSessionId,
    "subject": subject,
    "from_date": fromDate,
    "to_date": toDate,
    "apply_date": applyDate,
    "status": status,
    "docs": docs,
    "reason": reason,
    "approve_by": approveBy,
    "approve_date": approveDate,
    "request_type": requestType,
    "created_at": createdAt?.toIso8601String(),
    "firstname": firstname,
    "middlename": middlename,
    "lastname": lastname,
    "staff_id": staffId,
    "staff_name": staffName,
    "stud_id": studId,
    "admission_no": admissionNo,
    "surname": surname,
    "class_id": classId,
    "section_id": sectionId,
    "class": leaveDetailsModelClass,
    "section": section,
  };
}
