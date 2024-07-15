// To parse this JSON data, do
//
//     final studentByIdModel = studentByIdModelFromJson(jsonString);

import 'dart:convert';

StudentByIdModel studentByIdModelFromJson(String str) =>
    StudentByIdModel.fromJson(json.decode(str));

String studentByIdModelToJson(StudentByIdModel data) =>
    json.encode(data.toJson());

class StudentByIdModel {
  final StudentInfo? studentInfo;

  StudentByIdModel({
    this.studentInfo,
  });

  factory StudentByIdModel.fromJson(Map<String, dynamic> json) =>
      StudentByIdModel(
        studentInfo: json["student_info"] == null
            ? null
            : StudentInfo.fromJson(json["student_info"]),
      );

  Map<String, dynamic> toJson() => {
        "student_info": studentInfo?.toJson(),
      };
}

class StudentInfo {
  final String? pickupPointName;
  final dynamic routePickupPointId;
  final dynamic vehrouteId;
  final dynamic routeId;
  final dynamic vehicleId;
  final dynamic routeTitle;
  final dynamic vehicleNo;
  final dynamic roomNo;
  final dynamic driverName;
  final dynamic driverContact;
  final dynamic hostelId;
  final dynamic hostelName;
  final dynamic roomTypeId;
  final dynamic roomType;
  final String? hostelRoomId;
  final String? studentSessionId;
  final String? feesDiscount;
  final String? classId;
  final String? studentInfoClass;
  final String? sectionId;
  final String? section;
  final String? id;
  final String? admissionNo;
  final String? rollNo;
  final DateTime? admissionDate;
  final String? firstname;
  final String? middlename;
  final String? lastname;
  final String? image;
  final String? mobileno;
  final String? email;
  final dynamic state;
  final dynamic city;
  final dynamic pincode;
  final String? note;
  final String? religion;
  final String? cast;
  final dynamic houseName;
  final DateTime? dob;
  final String? currentAddress;
  final String? previousSchool;
  final String? guardianIs;
  final String? parentId;
  final String? permanentAddress;
  final String? categoryId;
  final String? adharNo;
  final String? samagraId;
  final dynamic bankAccountNo;
  final dynamic bankName;
  final dynamic ifscCode;
  final String? guardianName;
  final String? fatherPic;
  final String? height;
  final String? weight;
  final String? measurementDate;
  final String? motherPic;
  final String? guardianPic;
  final String? guardianRelation;
  final String? guardianPhone;
  final String? guardianAddress;
  final String? isActive;
  final DateTime? createdAt;
  final dynamic updatedAt;
  final String? fatherName;
  final String? fatherPhone;
  final String? bloodGroup;
  final String? schoolHouseId;
  final String? fatherOccupation;
  final String? motherName;
  final String? motherPhone;
  final String? motherOccupation;
  final String? guardianOccupation;
  final String? gender;
  final String? rte;
  final dynamic guardianEmail;
  final String? session;
  final String? username;
  final String? password;
  final String? disReason;
  final String? disNote;
  final dynamic appKey;
  final dynamic parentAppKey;

  StudentInfo({
    this.pickupPointName,
    this.routePickupPointId,
    this.vehrouteId,
    this.routeId,
    this.vehicleId,
    this.routeTitle,
    this.vehicleNo,
    this.roomNo,
    this.driverName,
    this.driverContact,
    this.hostelId,
    this.hostelName,
    this.roomTypeId,
    this.roomType,
    this.hostelRoomId,
    this.studentSessionId,
    this.feesDiscount,
    this.classId,
    this.studentInfoClass,
    this.sectionId,
    this.section,
    this.id,
    this.admissionNo,
    this.rollNo,
    this.admissionDate,
    this.firstname,
    this.middlename,
    this.lastname,
    this.image,
    this.mobileno,
    this.email,
    this.state,
    this.city,
    this.pincode,
    this.note,
    this.religion,
    this.cast,
    this.houseName,
    this.dob,
    this.currentAddress,
    this.previousSchool,
    this.guardianIs,
    this.parentId,
    this.permanentAddress,
    this.categoryId,
    this.adharNo,
    this.samagraId,
    this.bankAccountNo,
    this.bankName,
    this.ifscCode,
    this.guardianName,
    this.fatherPic,
    this.height,
    this.weight,
    this.measurementDate,
    this.motherPic,
    this.guardianPic,
    this.guardianRelation,
    this.guardianPhone,
    this.guardianAddress,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.fatherName,
    this.fatherPhone,
    this.bloodGroup,
    this.schoolHouseId,
    this.fatherOccupation,
    this.motherName,
    this.motherPhone,
    this.motherOccupation,
    this.guardianOccupation,
    this.gender,
    this.rte,
    this.guardianEmail,
    this.session,
    this.username,
    this.password,
    this.disReason,
    this.disNote,
    this.appKey,
    this.parentAppKey,
  });

  factory StudentInfo.fromJson(Map<String, dynamic> json) => StudentInfo(
        pickupPointName: json["pickup_point_name"],
        routePickupPointId: json["route_pickup_point_id"],
        vehrouteId: json["vehroute_id"],
        routeId: json["route_id"],
        vehicleId: json["vehicle_id"],
        routeTitle: json["route_title"],
        vehicleNo: json["vehicle_no"],
        roomNo: json["room_no"],
        driverName: json["driver_name"],
        driverContact: json["driver_contact"],
        hostelId: json["hostel_id"],
        hostelName: json["hostel_name"],
        roomTypeId: json["room_type_id"],
        roomType: json["room_type"],
        hostelRoomId: json["hostel_room_id"],
        studentSessionId: json["student_session_id"],
        feesDiscount: json["fees_discount"],
        classId: json["class_id"],
        studentInfoClass: json["class"],
        sectionId: json["section_id"],
        section: json["section"],
        id: json["id"],
        admissionNo: json["admission_no"],
        rollNo: json["roll_no"],
        admissionDate: json["admission_date"] == null
            ? null
            : DateTime.parse(json["admission_date"]),
        firstname: json["firstname"],
        middlename: json["middlename"],
        lastname: json["lastname"],
        image: json["image"],
        mobileno: json["mobileno"],
        email: json["email"],
        state: json["state"],
        city: json["city"],
        pincode: json["pincode"],
        note: json["note"],
        religion: json["religion"],
        cast: json["cast"],
        houseName: json["house_name"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        currentAddress: json["current_address"],
        previousSchool: json["previous_school"],
        guardianIs: json["guardian_is"],
        parentId: json["parent_id"],
        permanentAddress: json["permanent_address"],
        categoryId: json["category_id"],
        adharNo: json["adhar_no"],
        samagraId: json["samagra_id"],
        bankAccountNo: json["bank_account_no"],
        bankName: json["bank_name"],
        ifscCode: json["ifsc_code"],
        guardianName: json["guardian_name"],
        fatherPic: json["father_pic"],
        height: json["height"],
        weight: json["weight"],
        measurementDate: json["measurement_date"],
        motherPic: json["mother_pic"],
        guardianPic: json["guardian_pic"],
        guardianRelation: json["guardian_relation"],
        guardianPhone: json["guardian_phone"],
        guardianAddress: json["guardian_address"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        fatherName: json["father_name"],
        fatherPhone: json["father_phone"],
        bloodGroup: json["blood_group"],
        schoolHouseId: json["school_house_id"],
        fatherOccupation: json["father_occupation"],
        motherName: json["mother_name"],
        motherPhone: json["mother_phone"],
        motherOccupation: json["mother_occupation"],
        guardianOccupation: json["guardian_occupation"],
        gender: json["gender"],
        rte: json["rte"],
        guardianEmail: json["guardian_email"],
        session: json["session"],
        username: json["username"],
        password: json["password"],
        disReason: json["dis_reason"],
        disNote: json["dis_note"],
        appKey: json["app_key"],
        parentAppKey: json["parent_app_key"],
      );

  Map<String, dynamic> toJson() => {
        "pickup_point_name": pickupPointName,
        "route_pickup_point_id": routePickupPointId,
        "vehroute_id": vehrouteId,
        "route_id": routeId,
        "vehicle_id": vehicleId,
        "route_title": routeTitle,
        "vehicle_no": vehicleNo,
        "room_no": roomNo,
        "driver_name": driverName,
        "driver_contact": driverContact,
        "hostel_id": hostelId,
        "hostel_name": hostelName,
        "room_type_id": roomTypeId,
        "room_type": roomType,
        "hostel_room_id": hostelRoomId,
        "student_session_id": studentSessionId,
        "fees_discount": feesDiscount,
        "class_id": classId,
        "class": studentInfoClass,
        "section_id": sectionId,
        "section": section,
        "id": id,
        "admission_no": admissionNo,
        "roll_no": rollNo,
        "admission_date":
            "${admissionDate!.year.toString().padLeft(4, '0')}-${admissionDate!.month.toString().padLeft(2, '0')}-${admissionDate!.day.toString().padLeft(2, '0')}",
        "firstname": firstname,
        "middlename": middlename,
        "lastname": lastname,
        "image": image,
        "mobileno": mobileno,
        "email": email,
        "state": state,
        "city": city,
        "pincode": pincode,
        "note": note,
        "religion": religion,
        "cast": cast,
        "house_name": houseName,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "current_address": currentAddress,
        "previous_school": previousSchool,
        "guardian_is": guardianIs,
        "parent_id": parentId,
        "permanent_address": permanentAddress,
        "category_id": categoryId,
        "adhar_no": adharNo,
        "samagra_id": samagraId,
        "bank_account_no": bankAccountNo,
        "bank_name": bankName,
        "ifsc_code": ifscCode,
        "guardian_name": guardianName,
        "father_pic": fatherPic,
        "height": height,
        "weight": weight,
        "measurement_date": measurementDate,
        "mother_pic": motherPic,
        "guardian_pic": guardianPic,
        "guardian_relation": guardianRelation,
        "guardian_phone": guardianPhone,
        "guardian_address": guardianAddress,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "father_name": fatherName,
        "father_phone": fatherPhone,
        "blood_group": bloodGroup,
        "school_house_id": schoolHouseId,
        "father_occupation": fatherOccupation,
        "mother_name": motherName,
        "mother_phone": motherPhone,
        "mother_occupation": motherOccupation,
        "guardian_occupation": guardianOccupation,
        "gender": gender,
        "rte": rte,
        "guardian_email": guardianEmail,
        "session": session,
        "username": username,
        "password": password,
        "dis_reason": disReason,
        "dis_note": disNote,
        "app_key": appKey,
        "parent_app_key": parentAppKey,
      };
}
