import 'dart:convert';
import 'package:schoolxon/core/app_export.dart';
import 'package:schoolxon/widgets/common_appBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReportCardScreen(),
    );
  }
}

class ReportCardScreen extends StatefulWidget {
  @override
  _ReportCardScreenState createState() => _ReportCardScreenState();
}

class _ReportCardScreenState extends State<ReportCardScreen> {
  late Future<ReportCardModel> reportCard;

  @override
  void initState() {
    super.initState();
    reportCard = loadReportCard();
  }

  Future<ReportCardModel> loadReportCard() async {
    String jsonString = await rootBundle.loadString('assets/report_card.json');
    final jsonResponse = json.decode(jsonString);
    return ReportCardModel.fromJson(jsonResponse);
  }

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60.0), // height of appbar
          child: CommonAppBar(
            title: AppString.noticeBoard,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
        child: SingleChildScrollView(
          child: FutureBuilder<ReportCardModel>(
            future: reportCard,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return Center(child: Text('No data found'));
              } else {
                ReportCardModel reportCardData = snapshot.data!;
                return buildReportCard(reportCardData);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildReportCard(ReportCardModel data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(data),
          SizedBox(height: 30),
          buildSubjectTable(data),
          SizedBox(height: 30),
          buildFooter(data),
        ],
      ),
    );
  }

  Widget buildHeader(ReportCardModel data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Center(
          child: CustomImageView(
            imagePath: ImageConstant.imgPerson,
            height: getHeight(100),
            width: getHeight(100),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        rowText('Mr/Ms', data.name),
        rowText('Class', data.className),
        rowText('Father\'s Name', data.fatherName),
        rowText('Mother\'s Name', data.motherName),
        rowText('Roll No / ADM No.', data.rollNo),
        rowText('DOB', data.dob),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget rowText(String title, String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            '$title',
            style: PMT.appStyle(
              13,
            ),
          ),
        ),
        Expanded(
          child: Text(
            ' : ${name}',
            style: PMT.appStyle(
              13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSubjectTable(ReportCardModel data) {
    return Table(
      border: TableBorder.all(),
      children: [
        buildTableRowHeading(
            ['Subjects', 'Max Marks', 'Mark Obtn.', 'Grade', 'Note']),
        ...data.subjects.map((subject) {
          return buildTableRow([
            subject.name,
            subject.maxMarks,
            subject.marksObtained,
            subject.grade,
            ''
          ]);
        }).toList(),
        buildTableRowFooter(['', '', '', '', '']),
        buildTableRowFooter(
            ['Total Marks', data.totalMarks, data.marksObtained, '', '']),
        buildTableRowFooter(['Percentage', '', data.percentage, '', '']),
        buildTableRowFooter(['Rank', '', data.rank, '', '']),
      ],
    );
  }

  TableRow buildTableRow(List<String> cells) {
    return TableRow(
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(cell, textAlign: TextAlign.center),
        );
      }).toList(),
    );
  }

  TableRow buildTableRowFooter(List<String> cells) {
    return TableRow(
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cell,
            textAlign: TextAlign.center,
            style: PMT.appStyle(
              12,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }).toList(),
    );
  }

  TableRow buildTableRowHeading(List<String> cells) {
    return TableRow(
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cell,
            textAlign: TextAlign.center,
            style: PMT.appStyle(14,
                fontWeight: FontWeight.w600,
                fontColor: ColorConstant.primaryBlue),
          ),
        );
      }).toList(),
    );
  }

  Widget buildFooter(ReportCardModel data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date: ${data.date}'),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Signature of Class Teacher'),
                SizedBox(height: 50),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Signature of Principal'),
                SizedBox(height: 50),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ReportCardModel {
  final String name;
  final String className;
  final String fatherName;
  final String motherName;
  final String rollNo;
  final String dob;
  final List<Subject> subjects;
  final String totalMarks;
  final String marksObtained;
  final String percentage;
  final String rank;
  final String date;

  ReportCardModel({
    required this.name,
    required this.className,
    required this.fatherName,
    required this.motherName,
    required this.rollNo,
    required this.dob,
    required this.subjects,
    required this.totalMarks,
    required this.marksObtained,
    required this.percentage,
    required this.rank,
    required this.date,
  });

  factory ReportCardModel.fromJson(Map<String, dynamic> json) {
    var list = json['subjects'] as List;
    List<Subject> subjectsList = list.map((i) => Subject.fromJson(i)).toList();

    return ReportCardModel(
      name: json['name'],
      className: json['className'],
      fatherName: json['fatherName'],
      motherName: json['motherName'],
      rollNo: json['rollNo'],
      dob: json['dob'],
      subjects: subjectsList,
      totalMarks: json['totalMarks'],
      marksObtained: json['marksObtained'],
      percentage: json['percentage'],
      rank: json['rank'],
      date: json['date'],
    );
  }
}

class Subject {
  final String name;
  final String maxMarks;
  final String marksObtained;
  final String grade;

  Subject({
    required this.name,
    required this.maxMarks,
    required this.marksObtained,
    required this.grade,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      name: json['name'],
      maxMarks: json['maxMarks'],
      marksObtained: json['marksObtained'],
      grade: json['grade'],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await FlutterDownloader.initialize(debug: true);
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DownloadScreen(),
//     );
//   }
// }
//
// class DownloadScreen extends StatefulWidget {
//   @override
//   _DownloadScreenState createState() => _DownloadScreenState();
// }
//
// class _DownloadScreenState extends State<DownloadScreen> {
//   String? _taskId;
//   double _progress = 0.0;
//   String _status = 'Idle';
//
//   @override
//   void initState() {
//     super.initState();
//     FlutterDownloader.registerCallback(downloadCallback);
//   }
//
//   static void downloadCallback(String id, int status, int progress) {
//     print('status ${status}');
//     print('progress ${progress}');
//   }
//
//   Future<void> _startDownload() async {
//     final status = await Permission.storage.request();
//
//     if (status.isGranted) {
//       final dir = await getExternalStorageDirectory();
//       if (dir != null) {
//         _taskId = await FlutterDownloader.enqueue(
//           url:
//               'https://api.aischoolara.com/api/homework/download_docs/705/342/174',
//           savedDir: dir.path,
//           showNotification: true,
//           openFileFromNotification: true,
//         );
//
//         setState(() {
//           _status = 'Downloading...';
//         });
//       }
//     } else {
//       // Handle the case when permission is not granted
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Download Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Status: $_status'),
//             Text('Progress: ${_progress.toStringAsFixed(0)}%'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _startDownload,
//               child: Text('Start Download'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
