// To parse this JSON data, do
//
//     final allLeaveModel = allLeaveModelFromJson(jsonString);

import 'dart:convert';

AllLeaveModel allLeaveModelFromJson(String str) =>
    AllLeaveModel.fromJson(json.decode(str));

String allLeaveModelToJson(AllLeaveModel data) => json.encode(data.toJson());

class AllLeaveModel {
  final List<Result>? results;
  final List<Studentclass>? studentclasses;

  AllLeaveModel({
    this.results,
    this.studentclasses,
  });

  factory AllLeaveModel.fromJson(Map<String, dynamic> json) => AllLeaveModel(
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        studentclasses: json["studentclasses"] == null
            ? []
            : List<Studentclass>.from(
                json["studentclasses"]!.map((x) => Studentclass.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "studentclasses": studentclasses == null
            ? []
            : List<dynamic>.from(studentclasses!.map((x) => x.toJson())),
      };
}

class Result {
  final String? id;
  final String? studentSessionId;
  final String? subject;
  final DateTime? fromDate;
  final DateTime? toDate;
  final DateTime? applyDate;
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
  final dynamic staffName;
  final dynamic surname;
  final String? classId;
  final String? sectionId;
  final String? resultClass;
  final String? section;

  Result({
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
    this.staffName,
    this.surname,
    this.classId,
    this.sectionId,
    this.resultClass,
    this.section,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        studentSessionId: json["student_session_id"],
        subject: json["subject"],
        fromDate: json["from_date"] == null
            ? null
            : DateTime.parse(json["from_date"]),
        toDate:
            json["to_date"] == null ? null : DateTime.parse(json["to_date"]),
        applyDate: json["apply_date"] == null
            ? null
            : DateTime.parse(json["apply_date"]),
        status: json["status"] == '0'
            ? 'Pending'
            : json["status"] == '1'
                ? 'Approved'
                : json["status"] == '2'
                    ? 'Rejected'
                    : 'Rejected',
        docs: json["docs"],
        reason: json["reason"],
        approveBy: json["approve_by"],
        approveDate: json["approve_date"],
        requestType: json["request_type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        firstname: json["firstname"],
        middlename: json["middlename"],
        lastname: json["lastname"],
        staffName: json["staff_name"],
        surname: json["surname"],
        classId: json["class_id"],
        sectionId: json["section_id"],
        resultClass: json["class"],
        section: json["section"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "student_session_id": studentSessionId,
        "subject": subject,
        "from_date":
            "${fromDate!.year.toString().padLeft(4, '0')}-${fromDate!.month.toString().padLeft(2, '0')}-${fromDate!.day.toString().padLeft(2, '0')}",
        "to_date":
            "${toDate!.year.toString().padLeft(4, '0')}-${toDate!.month.toString().padLeft(2, '0')}-${toDate!.day.toString().padLeft(2, '0')}",
        "apply_date":
            "${applyDate!.year.toString().padLeft(4, '0')}-${applyDate!.month.toString().padLeft(2, '0')}-${applyDate!.day.toString().padLeft(2, '0')}",
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
        "staff_name": staffName,
        "surname": surname,
        "class_id": classId,
        "section_id": sectionId,
        "class": resultClass,
        "section": section,
      };
}

class Studentclass {
  final String? id;
  final String? schoolId;
  final String? sessionId;
  final String? studentId;
  final String? classId;
  final String? sectionId;
  final String? hostelId;
  final String? hostelFee;
  final dynamic hostelRoomId;
  final dynamic vehrouteId;
  final dynamic routePickupPointId;
  final String? transportFees;
  final String? feesDiscount;
  final String? isLeave;
  final String? isActive;
  final String? isAlumni;
  final String? defaultLogin;
  final DateTime? createdAt;
  final dynamic updatedAt;
  final String? studentclassClass;
  final String? section;
  final String? studentSessionId;

  Studentclass({
    this.id,
    this.schoolId,
    this.sessionId,
    this.studentId,
    this.classId,
    this.sectionId,
    this.hostelId,
    this.hostelFee,
    this.hostelRoomId,
    this.vehrouteId,
    this.routePickupPointId,
    this.transportFees,
    this.feesDiscount,
    this.isLeave,
    this.isActive,
    this.isAlumni,
    this.defaultLogin,
    this.createdAt,
    this.updatedAt,
    this.studentclassClass,
    this.section,
    this.studentSessionId,
  });

  factory Studentclass.fromJson(Map<String, dynamic> json) => Studentclass(
        id: json["id"],
        schoolId: json["school_id"],
        sessionId: json["session_id"],
        studentId: json["student_id"],
        classId: json["class_id"],
        sectionId: json["section_id"],
        hostelId: json["hostel_id"],
        hostelFee: json["hostel_fee"],
        hostelRoomId: json["hostel_room_id"],
        vehrouteId: json["vehroute_id"],
        routePickupPointId: json["route_pickup_point_id"],
        transportFees: json["transport_fees"],
        feesDiscount: json["fees_discount"],
        isLeave: json["is_leave"],
        isActive: json["is_active"],
        isAlumni: json["is_alumni"],
        defaultLogin: json["default_login"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        studentclassClass: json["class"],
        section: json["section"],
        studentSessionId: json["student_session_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "school_id": schoolId,
        "session_id": sessionId,
        "student_id": studentId,
        "class_id": classId,
        "section_id": sectionId,
        "hostel_id": hostelId,
        "hostel_fee": hostelFee,
        "hostel_room_id": hostelRoomId,
        "vehroute_id": vehrouteId,
        "route_pickup_point_id": routePickupPointId,
        "transport_fees": transportFees,
        "fees_discount": feesDiscount,
        "is_leave": isLeave,
        "is_active": isActive,
        "is_alumni": isAlumni,
        "default_login": defaultLogin,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "class": studentclassClass,
        "section": section,
        "student_session_id": studentSessionId,
      };
}
