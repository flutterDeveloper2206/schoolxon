import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TimetableEvent {
  final String subject;
  final DateTime startTime;
  final DateTime endTime;
  final Color color;

  TimetableEvent({
    required this.subject,
    required this.startTime,
    required this.endTime,
    required this.color,
  });
}

class TimeTableScreenController extends GetxController {
  RxList<TimetableEvent> events = <TimetableEvent>[
    TimetableEvent(
      subject: 'Hindi',
      startTime: DateTime(2023, 7, 24, 9, 0),
      endTime: DateTime(2023, 7, 24, 9, 30),
      color: Colors.orange.shade100,
    ),
  ].obs;

  void addEvent(String subject, DateTime startTime, DateTime endTime, Color color) {
    final event = TimetableEvent(
      subject: subject,
      startTime: startTime,
      endTime: endTime,
      color: color,
    );
    events.add(event);
  }
}
