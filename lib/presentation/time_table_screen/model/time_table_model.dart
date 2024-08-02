// To parse this JSON data, do
//
//     final timeTableModel = timeTableModelFromJson(jsonString);

import 'dart:convert';

TimeTableModel timeTableModelFromJson(String str) =>
    TimeTableModel.fromJson(json.decode(str));

String timeTableModelToJson(TimeTableModel data) => json.encode(data.toJson());

class TimeTableModel {
  final Timetable? timetable;

  TimeTableModel({
    this.timetable,
  });

  factory TimeTableModel.fromJson(Map<String, dynamic> json) => TimeTableModel(
        timetable: json["timetable"] == null
            ? null
            : Timetable.fromJson(json["timetable"]),
      );

  Map<String, dynamic> toJson() => {
        "timetable": timetable?.toJson(),
      };
}

class Timetable {
  final List<Day>? monday;
  final List<Day>? tuesday;
  final List<Day>? wednesday;
  final List<Day>? thursday;
  final List<Day>? friday;
  final List<Day>? saturday;
  final List<Day>? sunday;

  Timetable({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  factory Timetable.fromJson(Map<String, dynamic> json) => Timetable(
        monday: json["Monday"] == null
            ? []
            : List<Day>.from(json["Monday"]!.map((x) => Day.fromJson(x))),
        tuesday: json["Tuesday"] == null
            ? []
            : List<Day>.from(json["Tuesday"]!.map((x) => Day.fromJson(x))),
        wednesday: json["Wednesday"] == null
            ? []
            : List<Day>.from(json["Wednesday"]!.map((x) => Day.fromJson(x))),
        thursday: json["Thursday"] == null
            ? []
            : List<Day>.from(json["Thursday"]!.map((x) => Day.fromJson(x))),
        friday: json["Friday"] == null
            ? []
            : List<Day>.from(json["Friday"]!.map((x) => Day.fromJson(x))),
        saturday: json["Saturday"] == null
            ? []
            : List<Day>.from(json["Saturday"]!.map((x) => Day.fromJson(x))),
        sunday: json["Sunday"] == null
            ? []
            : List<Day>.from(json["Sunday"]!.map((x) => Day.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Monday": monday == null
            ? []
            : List<dynamic>.from(monday!.map((x) => x.toJson())),
        "Tuesday": tuesday == null
            ? []
            : List<dynamic>.from(tuesday!.map((x) => x.toJson())),
        "Wednesday": wednesday == null
            ? []
            : List<dynamic>.from(wednesday!.map((x) => x.toJson())),
        "Thursday": thursday == null
            ? []
            : List<dynamic>.from(thursday!.map((x) => x.toJson())),
        "Friday": friday == null
            ? []
            : List<dynamic>.from(friday!.map((x) => x.toJson())),
        "Saturday": saturday == null
            ? []
            : List<dynamic>.from(saturday!.map((x) => x.toJson())),
        "Sunday": sunday == null
            ? []
            : List<dynamic>.from(sunday!.map((x) => x.toJson())),
      };
}

class Day {
  final String? subjectId;
  final String? subjectName;
  final String? code;
  final String? type;
  final String? name;
  final String? surname;
  final String? employeeId;
  final String? image;
  final String? gender;
  final String? id;
  final String? schoolId;
  final String? sessionId;
  final String? classId;
  final String? sectionId;
  final String? subjectGroupId;
  final String? subjectGroupSubjectId;
  final String? staffId;
  final String? day;
  final String? timeFrom;
  final String? timeTo;
  final String? startTime;
  final String? endTime;
  final String? roomNo;
  final DateTime? createdAt;
  final String? classSectionId;
  final String? subjectGroupClassSectionsId;

  Day({
    this.subjectId,
    this.subjectName,
    this.code,
    this.type,
    this.name,
    this.surname,
    this.employeeId,
    this.image,
    this.gender,
    this.id,
    this.schoolId,
    this.sessionId,
    this.classId,
    this.sectionId,
    this.subjectGroupId,
    this.subjectGroupSubjectId,
    this.staffId,
    this.day,
    this.timeFrom,
    this.timeTo,
    this.startTime,
    this.endTime,
    this.roomNo,
    this.createdAt,
    this.classSectionId,
    this.subjectGroupClassSectionsId,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        subjectId: json["subject_id"],
        subjectName: json["subject_name"],
        code: json["code"],
        type: json["type"],
        name: json["name"],
        surname: json["surname"],
        employeeId: json["employee_id"],
        image: json["image"],
        gender: json["gender"],
        id: json["id"],
        schoolId: json["school_id"],
        sessionId: json["session_id"],
        classId: json["class_id"],
        sectionId: json["section_id"],
        subjectGroupId: json["subject_group_id"],
        subjectGroupSubjectId: json["subject_group_subject_id"],
        staffId: json["staff_id"],
        day: json["day"],
        timeFrom: json["time_from"],
        timeTo: json["time_to"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        roomNo: json["room_no"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        classSectionId: json["class_section_id"],
        subjectGroupClassSectionsId: json["subject_group_class_sections_id"],
      );

  Map<String, dynamic> toJson() => {
        "subject_id": subjectId,
        "subject_name": subjectName,
        "code": code,
        "type": type,
        "name": name,
        "surname": surname,
        "employee_id": employeeId,
        "image": image,
        "gender": gender,
        "id": id,
        "school_id": schoolId,
        "session_id": sessionId,
        "class_id": classId,
        "section_id": sectionId,
        "subject_group_id": subjectGroupId,
        "subject_group_subject_id": subjectGroupSubjectId,
        "staff_id": staffId,
        "day": day,
        "time_from": timeFrom,
        "time_to": timeTo,
        "start_time": startTime,
        "end_time": endTime,
        "room_no": roomNo,
        "created_at": createdAt?.toIso8601String(),
        "class_section_id": classSectionId,
        "subject_group_class_sections_id": subjectGroupClassSectionsId,
      };
}
