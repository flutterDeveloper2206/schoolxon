import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TimeTableScreenController extends GetxController {
  var events = <TimetableEvent>[].obs;

  void addEvent(String subject, DateTime startTime, DateTime endTime, Color color) {
    final event = TimetableEvent(
      subject: subject,
      startTime: startTime,
      endTime: endTime,
      color: color,
    );
    events.add(event);
  }

  @override
  void onInit() {
    super.onInit();
    // Add some initial events (for demonstration)
    events.addAll([
      TimetableEvent(
        subject: 'Hindi',
        startTime: DateTime(2023, 7, 24, 9, 0),
        endTime: DateTime(2023, 7, 24, 9, 30),
        color: Colors.orange.shade100,
      ),
      TimetableEvent(
        subject: 'English',
        startTime: DateTime(2023, 7, 24, 9, 30),
        endTime: DateTime(2023, 7, 24, 10, 0),
        color: Colors.purple.shade100,
      ),
      TimetableEvent(
        subject: 'Maths',
        startTime: DateTime(2023, 7, 24, 10, 0),
        endTime: DateTime(2023, 7, 24, 10, 30),
        color: Colors.green.shade100,
      ),
      TimetableEvent(
        subject: 'Arts And Drawing',
        startTime: DateTime(2023, 7, 24, 10, 30),
        endTime: DateTime(2023, 7, 24, 11, 0),
        color: Colors.yellow.shade100,
      ),
    ]);
  }
}
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