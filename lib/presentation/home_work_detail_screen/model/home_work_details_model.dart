// To parse this JSON data, do
//
//     final homeWorkDetailsModel = homeWorkDetailsModelFromJson(jsonString);

import 'dart:convert';

HomeWorkDetailsModel homeWorkDetailsModelFromJson(String str) =>
    HomeWorkDetailsModel.fromJson(json.decode(str));

String homeWorkDetailsModelToJson(HomeWorkDetailsModel data) =>
    json.encode(data.toJson());

class HomeWorkDetailsModel {
  final String? title;
  final String? homeworkId;
  final List<dynamic>? studentlist;
  final Result? result;
  final dynamic report;
  final List<Homeworkdoc>? homeworkdocs;
  final String? createdBy;
  final String? evaluatedBy;
  final String? status;

  HomeWorkDetailsModel({
    this.title,
    this.homeworkId,
    this.studentlist,
    this.result,
    this.report,
    this.homeworkdocs,
    this.createdBy,
    this.evaluatedBy,
    this.status,
  });

  factory HomeWorkDetailsModel.fromJson(Map<String, dynamic> json) =>
      HomeWorkDetailsModel(
        title: json["title"],
        homeworkId: json["homework_id"],
        studentlist: json["studentlist"] == null
            ? []
            : List<dynamic>.from(json["studentlist"]!.map((x) => x)),
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        report: json["report"],
        homeworkdocs: json["homeworkdocs"] == null
            ? []
            : List<Homeworkdoc>.from(
                json["homeworkdocs"]!.map((x) => Homeworkdoc.fromJson(x))),
        createdBy: json["created_by"],
        evaluatedBy: json["evaluated_by"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "homework_id": homeworkId,
        "studentlist": studentlist == null
            ? []
            : List<dynamic>.from(studentlist!.map((x) => x)),
        "result": result?.toJson(),
        "report": report,
        "homeworkdocs": homeworkdocs == null
            ? []
            : List<dynamic>.from(homeworkdocs!.map((x) => x.toJson())),
        "created_by": createdBy,
        "evaluated_by": evaluatedBy,
        "status": status,
      };
}

class Homeworkdoc {
  final String? id;
  final String? schoolId;
  final String? parentId;
  final String? admissionNo;
  final String? rollNo;
  final DateTime? admissionDate;
  final String? firstname;
  final String? middlename;
  final String? lastname;
  final dynamic rte;
  final String? image;
  final String? mobileno;
  final String? email;
  final dynamic state;
  final dynamic city;
  final dynamic pincode;
  final String? religion;
  final String? cast;
  final DateTime? dob;
  final String? gender;
  final String? currentAddress;
  final String? permanentAddress;
  final String? categoryId;
  final String? schoolHouseId;
  final String? bloodGroup;
  final String? hostelRoomId;
  final String? adharNo;
  final String? samagraId;
  final dynamic bankAccountNo;
  final dynamic bankName;
  final dynamic ifscCode;
  final String? guardianIs;
  final String? fatherName;
  final String? fatherPhone;
  final String? fatherOccupation;
  final String? motherName;
  final String? motherPhone;
  final String? motherOccupation;
  final String? guardianName;
  final String? guardianRelation;
  final String? guardianPhone;
  final String? guardianOccupation;
  final String? guardianAddress;
  final dynamic guardianEmail;
  final String? fatherPic;
  final String? motherPic;
  final String? guardianPic;
  final String? isActive;
  final String? previousSchool;
  final String? height;
  final String? weight;
  final String? measurementDate;
  final String? disReason;
  final String? note;
  final String? disNote;
  final dynamic appKey;
  final dynamic parentAppKey;
  final dynamic disableAt;
  final DateTime? createdAt;
  final dynamic updatedAt;
  final String? docs;
  final String? message;

  Homeworkdoc({
    this.id,
    this.schoolId,
    this.parentId,
    this.admissionNo,
    this.rollNo,
    this.admissionDate,
    this.firstname,
    this.middlename,
    this.lastname,
    this.rte,
    this.image,
    this.mobileno,
    this.email,
    this.state,
    this.city,
    this.pincode,
    this.religion,
    this.cast,
    this.dob,
    this.gender,
    this.currentAddress,
    this.permanentAddress,
    this.categoryId,
    this.schoolHouseId,
    this.bloodGroup,
    this.hostelRoomId,
    this.adharNo,
    this.samagraId,
    this.bankAccountNo,
    this.bankName,
    this.ifscCode,
    this.guardianIs,
    this.fatherName,
    this.fatherPhone,
    this.fatherOccupation,
    this.motherName,
    this.motherPhone,
    this.motherOccupation,
    this.guardianName,
    this.guardianRelation,
    this.guardianPhone,
    this.guardianOccupation,
    this.guardianAddress,
    this.guardianEmail,
    this.fatherPic,
    this.motherPic,
    this.guardianPic,
    this.isActive,
    this.previousSchool,
    this.height,
    this.weight,
    this.measurementDate,
    this.disReason,
    this.note,
    this.disNote,
    this.appKey,
    this.parentAppKey,
    this.disableAt,
    this.createdAt,
    this.updatedAt,
    this.docs,
    this.message,
  });

  factory Homeworkdoc.fromJson(Map<String, dynamic> json) => Homeworkdoc(
        id: json["id"],
        schoolId: json["school_id"],
        parentId: json["parent_id"],
        admissionNo: json["admission_no"],
        rollNo: json["roll_no"],
        admissionDate: json["admission_date"] == null
            ? null
            : DateTime.parse(json["admission_date"]),
        firstname: json["firstname"],
        middlename: json["middlename"],
        lastname: json["lastname"],
        rte: json["rte"],
        image: json["image"],
        mobileno: json["mobileno"],
        email: json["email"],
        state: json["state"],
        city: json["city"],
        pincode: json["pincode"],
        religion: json["religion"],
        cast: json["cast"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: json["gender"],
        currentAddress: json["current_address"],
        permanentAddress: json["permanent_address"],
        categoryId: json["category_id"],
        schoolHouseId: json["school_house_id"],
        bloodGroup: json["blood_group"],
        hostelRoomId: json["hostel_room_id"],
        adharNo: json["adhar_no"],
        samagraId: json["samagra_id"],
        bankAccountNo: json["bank_account_no"],
        bankName: json["bank_name"],
        ifscCode: json["ifsc_code"],
        guardianIs: json["guardian_is"],
        fatherName: json["father_name"],
        fatherPhone: json["father_phone"],
        fatherOccupation: json["father_occupation"],
        motherName: json["mother_name"],
        motherPhone: json["mother_phone"],
        motherOccupation: json["mother_occupation"],
        guardianName: json["guardian_name"],
        guardianRelation: json["guardian_relation"],
        guardianPhone: json["guardian_phone"],
        guardianOccupation: json["guardian_occupation"],
        guardianAddress: json["guardian_address"],
        guardianEmail: json["guardian_email"],
        fatherPic: json["father_pic"],
        motherPic: json["mother_pic"],
        guardianPic: json["guardian_pic"],
        isActive: json["is_active"],
        previousSchool: json["previous_school"],
        height: json["height"],
        weight: json["weight"],
        measurementDate: json["measurement_date"],
        disReason: json["dis_reason"],
        note: json["note"],
        disNote: json["dis_note"],
        appKey: json["app_key"],
        parentAppKey: json["parent_app_key"],
        disableAt: json["disable_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        docs: json["docs"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "school_id": schoolId,
        "parent_id": parentId,
        "admission_no": admissionNo,
        "roll_no": rollNo,
        "admission_date":
            "${admissionDate!.year.toString().padLeft(4, '0')}-${admissionDate!.month.toString().padLeft(2, '0')}-${admissionDate!.day.toString().padLeft(2, '0')}",
        "firstname": firstname,
        "middlename": middlename,
        "lastname": lastname,
        "rte": rte,
        "image": image,
        "mobileno": mobileno,
        "email": email,
        "state": state,
        "city": city,
        "pincode": pincode,
        "religion": religion,
        "cast": cast,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "current_address": currentAddress,
        "permanent_address": permanentAddress,
        "category_id": categoryId,
        "school_house_id": schoolHouseId,
        "blood_group": bloodGroup,
        "hostel_room_id": hostelRoomId,
        "adhar_no": adharNo,
        "samagra_id": samagraId,
        "bank_account_no": bankAccountNo,
        "bank_name": bankName,
        "ifsc_code": ifscCode,
        "guardian_is": guardianIs,
        "father_name": fatherName,
        "father_phone": fatherPhone,
        "father_occupation": fatherOccupation,
        "mother_name": motherName,
        "mother_phone": motherPhone,
        "mother_occupation": motherOccupation,
        "guardian_name": guardianName,
        "guardian_relation": guardianRelation,
        "guardian_phone": guardianPhone,
        "guardian_occupation": guardianOccupation,
        "guardian_address": guardianAddress,
        "guardian_email": guardianEmail,
        "father_pic": fatherPic,
        "mother_pic": motherPic,
        "guardian_pic": guardianPic,
        "is_active": isActive,
        "previous_school": previousSchool,
        "height": height,
        "weight": weight,
        "measurement_date": measurementDate,
        "dis_reason": disReason,
        "note": note,
        "dis_note": disNote,
        "app_key": appKey,
        "parent_app_key": parentAppKey,
        "disable_at": disableAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "docs": docs,
        "message": message,
      };
}

class Result {
  final String? id;
  final String? schoolId;
  final String? classId;
  final String? sectionId;
  final String? sessionId;
  final String? staffId;
  final String? subjectGroupSubjectId;
  final dynamic subjectId;
  final DateTime? homeworkDate;
  final DateTime? submitDate;
  final dynamic marks;
  final String? description;
  final DateTime? createDate;
  final dynamic evaluationDate;
  final dynamic document;
  final String? createdBy;
  final dynamic evaluatedBy;
  final DateTime? createdAt;
  final String? resultClass;
  final String? section;
  final String? name;
  final String? code;
  final String? subjectGroup;
  final String? createdStaffId;
  final String? createdEmployeeId;
  final String? createdStaffName;
  final String? createdStaffSurname;
  final String? createdStaffRoleid;

  Result({
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
    this.resultClass,
    this.section,
    this.name,
    this.code,
    this.subjectGroup,
    this.createdStaffId,
    this.createdEmployeeId,
    this.createdStaffName,
    this.createdStaffSurname,
    this.createdStaffRoleid,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
        createdBy: json["created_by"],
        evaluatedBy: json["evaluated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        resultClass: json["class"],
        section: json["section"],
        name: json["name"],
        code: json["code"],
        subjectGroup: json["subject_group"],
        createdStaffId: json["created_staff_id"],
        createdEmployeeId: json["created_employee_id"],
        createdStaffName: json["created_staff_name"],
        createdStaffSurname: json["created_staff_surname"],
        createdStaffRoleid: json["created_staff_roleid"],
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
        "created_by": createdBy,
        "evaluated_by": evaluatedBy,
        "created_at": createdAt?.toIso8601String(),
        "class": resultClass,
        "section": section,
        "name": name,
        "code": code,
        "subject_group": subjectGroup,
        "created_staff_id": createdStaffId,
        "created_employee_id": createdEmployeeId,
        "created_staff_name": createdStaffName,
        "created_staff_surname": createdStaffSurname,
        "created_staff_roleid": createdStaffRoleid,
      };
}
