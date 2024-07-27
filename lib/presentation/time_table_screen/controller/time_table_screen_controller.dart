import 'package:get/get.dart';
import 'package:flutter/material.dart';



class TimeTableScreenController extends GetxController {
  String formatTime(DateTime dateTime) {
    if (dateTime == null) {
      return 'No Time';
    }
    final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour < 12 ? 'AM' : 'PM';
    return '$hour:$minutes $period';
  }

  Widget buildTimeTableItem({
    required String time,
    required String subject,
    required String startTime,
    required String endTime,
    required Color color,
  }) {

    return Padding(
      padding: const EdgeInsets.only(top: 15,
          left: 15,right: 15),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subject,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$startTime To $endTime',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
