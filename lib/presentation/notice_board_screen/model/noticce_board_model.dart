// To parse this JSON data, do
//
//     final noticeBoardModel = noticeBoardModelFromJson(jsonString);

import 'dart:convert';

NoticeBoardModel noticeBoardModelFromJson(String str) =>
    NoticeBoardModel.fromJson(json.decode(str));

String noticeBoardModelToJson(NoticeBoardModel data) =>
    json.encode(data.toJson());

class NoticeBoardModel {
  final List<Notificationlist>? notificationlist;

  NoticeBoardModel({
    this.notificationlist,
  });

  factory NoticeBoardModel.fromJson(Map<String, dynamic> json) =>
      NoticeBoardModel(
        notificationlist: json["notificationlist"] == null
            ? []
            : List<Notificationlist>.from(json["notificationlist"]!
                .map((x) => Notificationlist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notificationlist": notificationlist == null
            ? []
            : List<dynamic>.from(notificationlist!.map((x) => x.toJson())),
      };
}

class Notificationlist {
  final String? id;
  final String? title;
  final DateTime? publishDate;
  final DateTime? date;
  final String? message;
  final String? attachment;
  final String? employeeId;
  final String? name;
  final String? surname;
  final String? notificationId;

  Notificationlist({
    this.id,
    this.title,
    this.publishDate,
    this.date,
    this.message,
    this.attachment,
    this.employeeId,
    this.name,
    this.surname,
    this.notificationId,
  });

  factory Notificationlist.fromJson(Map<String, dynamic> json) =>
      Notificationlist(
        id: json["id"],
        title: json["title"],
        publishDate: json["publish_date"] == null
            ? null
            : DateTime.parse(json["publish_date"]),
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        message: json["message"],
        attachment: json["attachment"],
        employeeId: json["employee_id"],
        name: json["name"],
        surname: json["surname"],
        notificationId: json["notification_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "publish_date":
            "${publishDate!.year.toString().padLeft(4, '0')}-${publishDate!.month.toString().padLeft(2, '0')}-${publishDate!.day.toString().padLeft(2, '0')}",
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "message": message,
        "attachment": attachment,
        "employee_id": employeeId,
        "name": name,
        "surname": surname,
        "notification_id": notificationId,
      };
}
