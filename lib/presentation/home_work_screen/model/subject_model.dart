// To parse this JSON data, do
//
//     final subjectModel = subjectModelFromJson(jsonString);

import 'dart:convert';

SubjectModel subjectModelFromJson(String str) =>
    SubjectModel.fromJson(json.decode(str));

String subjectModelToJson(SubjectModel data) => json.encode(data.toJson());

class SubjectModel {
  final String? subjectGroupName;
  final List<Subject>? subjects;

  SubjectModel({
    this.subjectGroupName,
    this.subjects,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
        subjectGroupName: json["subject_group_name"],
        subjects: json["subjects"] == null
            ? []
            : List<Subject>.from(
                json["subjects"]!.map((x) => Subject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subject_group_name": subjectGroupName,
        "subjects": subjects == null
            ? []
            : List<dynamic>.from(subjects!.map((x) => x.toJson())),
      };
}

class Subject {
  final String? id;
  final String? schoolId;
  final String? subjectGroupId;
  final String? sessionId;
  final String? subjectId;
  final DateTime? createdAt;
  final String? name;
  final String? code;
  final String? type;

  Subject({
    this.id,
    this.schoolId,
    this.subjectGroupId,
    this.sessionId,
    this.subjectId,
    this.createdAt,
    this.name,
    this.code,
    this.type,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        schoolId: json["school_id"],
        subjectGroupId: json["subject_group_id"],
        sessionId: json["session_id"],
        subjectId: json["subject_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        name: json["name"],
        code: json["code"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "school_id": schoolId,
        "subject_group_id": subjectGroupId,
        "session_id": sessionId,
        "subject_id": subjectId,
        "created_at": createdAt?.toIso8601String(),
        "name": name,
        "code": code,
        "type": type,
      };
}
