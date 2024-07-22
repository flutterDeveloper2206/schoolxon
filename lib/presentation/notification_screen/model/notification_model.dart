// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  final List<Notice>? notice;

  NotificationModel({
    this.notice,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        notice: json["notice"] == null
            ? []
            : List<Notice>.from(json["notice"]!.map((x) => Notice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notice": notice == null
            ? []
            : List<dynamic>.from(notice!.map((x) => x.toJson())),
      };
}

class Notice {
  final String? id;
  final String? schoolId;
  final String? title;
  final String? notification;
  final String? studentId;
  final DateTime? createdBy;

  Notice({
    this.id,
    this.schoolId,
    this.title,
    this.notification,
    this.studentId,
    this.createdBy,
  });

  factory Notice.fromJson(Map<String, dynamic> json) => Notice(
        id: json["id"],
        schoolId: json["school_id"],
        title: json["title"],
        notification: json["notification"],
        studentId: json["student_id"],
        createdBy: json["created_by"] == null
            ? null
            : DateTime.parse(json["created_by"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "school_id": schoolId,
        "title": title,
        "notification": notification,
        "student_id": studentId,
        "created_by": createdBy?.toIso8601String(),
      };
}
