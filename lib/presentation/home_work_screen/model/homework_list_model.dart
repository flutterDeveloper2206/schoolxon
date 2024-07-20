// To parse this JSON data, do
//
//     final homeWorkListModel = homeWorkListModelFromJson(jsonString);

import 'dart:convert';

HomeWorkListModel homeWorkListModelFromJson(String str) =>
    HomeWorkListModel.fromJson(json.decode(str));

String homeWorkListModelToJson(HomeWorkListModel data) =>
    json.encode(data.toJson());

class HomeWorkListModel {
  final String? createdBy;
  final String? evaluatedBy;
  final List<Homeworklist>? homeworklist;
  final List<Homeworklist>? closedhomeworklist;

  HomeWorkListModel({
    this.createdBy,
    this.evaluatedBy,
    this.homeworklist,
    this.closedhomeworklist,
  });

  factory HomeWorkListModel.fromJson(Map<String, dynamic> json) =>
      HomeWorkListModel(
        createdBy: json["created_by"],
        evaluatedBy: json["evaluated_by"],
        homeworklist: json["homeworklist"] == null
            ? []
            : List<Homeworklist>.from(
                json["homeworklist"]!.map((x) => Homeworklist.fromJson(x))),
        closedhomeworklist: json["closedhomeworklist"] == null
            ? []
            : List<Homeworklist>.from(json["closedhomeworklist"]!
                .map((x) => Homeworklist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "created_by": createdBy,
        "evaluated_by": evaluatedBy,
        "homeworklist": homeworklist == null
            ? []
            : List<dynamic>.from(homeworklist!.map((x) => x.toJson())),
        "closedhomeworklist": closedhomeworklist == null
            ? []
            : List<dynamic>.from(closedhomeworklist!.map((x) => x.toJson())),
      };
}

class Homeworklist {
  final String? id;
  final String? schoolId;
  final String? classId;
  final String? sectionId;
  final String? sessionId;
  final String? staffId;
  final String? subjectGroupSubjectId;
  final String? subjectId;
  final DateTime? homeworkDate;
  final DateTime? submitDate;
  final dynamic marks;
  final String? description;
  final DateTime? createDate;
  final dynamic evaluationDate;
  final String? document;
  final CreatedBy? createdBy;
  final dynamic evaluatedBy;
  final DateTime? createdAt;
  final String? homeworkEvaluationId;
  final dynamic note;
  final dynamic evaluationMarks;
  final String? homeworklistClass;
  final String? section;
  final String? subjectName;
  final String? subjectCode;
  final String? subjectGroupsId;
  final String? name;
  final String? status;

  Homeworklist({
    this.id,
    this.schoolId,
    this.classId,
    this.sectionId,
    this.sessionId,
    this.staffId,
    this.subjectGroupSubjectId,
    this.subjectId,
    this.homeworkDate,
    this.submitDate,
    this.marks,
    this.description,
    this.createDate,
    this.evaluationDate,
    this.document,
    this.createdBy,
    this.evaluatedBy,
    this.createdAt,
    this.homeworkEvaluationId,
    this.note,
    this.evaluationMarks,
    this.homeworklistClass,
    this.section,
    this.subjectName,
    this.subjectCode,
    this.subjectGroupsId,
    this.name,
    this.status,
  });

  factory Homeworklist.fromJson(Map<String, dynamic> json) => Homeworklist(
        id: json["id"],
        schoolId: json["school_id"],
        classId: json["class_id"],
        sectionId: json["section_id"],
        sessionId: json["session_id"],
        staffId: json["staff_id"],
        subjectGroupSubjectId: json["subject_group_subject_id"],
        subjectId: json["subject_id"],
        homeworkDate: json["homework_date"] == null
            ? null
            : DateTime.parse(json["homework_date"]),
        submitDate: json["submit_date"] == null
            ? null
            : DateTime.parse(json["submit_date"]),
        marks: json["marks"],
        description: json["description"],
        createDate: json["create_date"] == null
            ? null
            : DateTime.parse(json["create_date"]),
        evaluationDate: json["evaluation_date"],
        document: json["document"],
        createdBy: json["created_by"] == null
            ? null
            : CreatedBy.fromJson(json["created_by"]),
        evaluatedBy: json["evaluated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        homeworkEvaluationId: json["homework_evaluation_id"],
        note: json["note"],
        evaluationMarks: json["evaluation_marks"],
        homeworklistClass: json["class"],
        section: json["section"],
        subjectName: json["subject_name"],
        subjectCode: json["subject_code"],
        subjectGroupsId: json["subject_groups_id"],
        name: json["name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "school_id": schoolId,
        "class_id": classId,
        "section_id": sectionId,
        "session_id": sessionId,
        "staff_id": staffId,
        "subject_group_subject_id": subjectGroupSubjectId,
        "subject_id": subjectId,
        "homework_date":
            "${homeworkDate!.year.toString().padLeft(4, '0')}-${homeworkDate!.month.toString().padLeft(2, '0')}-${homeworkDate!.day.toString().padLeft(2, '0')}",
        "submit_date":
            "${submitDate!.year.toString().padLeft(4, '0')}-${submitDate!.month.toString().padLeft(2, '0')}-${submitDate!.day.toString().padLeft(2, '0')}",
        "marks": marks,
        "description": description,
        "create_date":
            "${createDate!.year.toString().padLeft(4, '0')}-${createDate!.month.toString().padLeft(2, '0')}-${createDate!.day.toString().padLeft(2, '0')}",
        "evaluation_date": evaluationDate,
        "document": document,
        "created_by": createdBy?.toJson(),
        "evaluated_by": evaluatedBy,
        "created_at": createdAt?.toIso8601String(),
        "homework_evaluation_id": homeworkEvaluationId,
        "note": note,
        "evaluation_marks": evaluationMarks,
        "class": homeworklistClass,
        "section": section,
        "subject_name": subjectName,
        "subject_code": subjectCode,
        "subject_groups_id": subjectGroupsId,
        "name": name,
        "status": status,
      };
}

class CreatedBy {
  final String? employeeId;
  final String? schoolId;
  final String? langId;
  final dynamic designation;
  final String? qualification;
  final String? workExp;
  final String? name;
  final String? surname;
  final String? fatherName;
  final String? motherName;
  final String? contactNo;
  final String? emergencyContactNo;
  final String? email;
  final DateTime? dob;
  final String? image;
  final String? gender;
  final dynamic language;
  final dynamic isRtl;
  final String? userType;
  final String? roleId;

  CreatedBy({
    this.employeeId,
    this.schoolId,
    this.langId,
    this.designation,
    this.qualification,
    this.workExp,
    this.name,
    this.surname,
    this.fatherName,
    this.motherName,
    this.contactNo,
    this.emergencyContactNo,
    this.email,
    this.dob,
    this.image,
    this.gender,
    this.language,
    this.isRtl,
    this.userType,
    this.roleId,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        employeeId: json["employee_id"],
        schoolId: json["school_id"],
        langId: json["lang_id"],
        designation: json["designation"],
        qualification: json["qualification"],
        workExp: json["work_exp"],
        name: json["name"],
        surname: json["surname"],
        fatherName: json["father_name"],
        motherName: json["mother_name"],
        contactNo: json["contact_no"],
        emergencyContactNo: json["emergency_contact_no"],
        email: json["email"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        image: json["image"],
        gender: json["gender"],
        language: json["language"],
        isRtl: json["is_rtl"],
        userType: json["user_type"],
        roleId: json["role_id"],
      );

  Map<String, dynamic> toJson() => {
        "employee_id": employeeId,
        "school_id": schoolId,
        "lang_id": langId,
        "designation": designation,
        "qualification": qualification,
        "work_exp": workExp,
        "name": name,
        "surname": surname,
        "father_name": fatherName,
        "mother_name": motherName,
        "contact_no": contactNo,
        "emergency_contact_no": emergencyContactNo,
        "email": email,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "image": image,
        "gender": gender,
        "language": language,
        "is_rtl": isRtl,
        "user_type": userType,
        "role_id": roleId,
      };
}
