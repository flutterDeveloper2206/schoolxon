class MarksModel {
  List<Examlist>? examlist;

  MarksModel({this.examlist});

  MarksModel.fromJson(Map<String, dynamic> json) {
    if (json['examlist'] != null) {
      examlist = <Examlist>[];
      json['examlist'].forEach((v) {
        examlist!.add(new Examlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.examlist != null) {
      data['examlist'] = this.examlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Examlist {
  String? id;
  String? examGroupClassBatchExamId;
  String? studentId;
  String? studentSessionId;
  Null? rollNo;
  Null? teacherRemark;
  String? rank;
  String? isActive;
  String? createdAt;
  Null? updatedAt;
  String? examGroupId;
  String? exam;
  Null? dateFrom;
  Null? dateTo;
  String? description;
  String? name;
  String? examType;
  String? passingPercentage;

  Examlist(
      {this.id,
        this.examGroupClassBatchExamId,
        this.studentId,
        this.studentSessionId,
        this.rollNo,
        this.teacherRemark,
        this.rank,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.examGroupId,
        this.exam,
        this.dateFrom,
        this.dateTo,
        this.description,
        this.name,
        this.examType,
        this.passingPercentage});

  Examlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    examGroupClassBatchExamId = json['exam_group_class_batch_exam_id'];
    studentId = json['student_id'];
    studentSessionId = json['student_session_id'];
    rollNo = json['roll_no'];
    teacherRemark = json['teacher_remark'];
    rank = json['rank'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    examGroupId = json['exam_group_id'];
    exam = json['exam'];
    dateFrom = json['date_from'];
    dateTo = json['date_to'];
    description = json['description'];
    name = json['name'];
    examType = json['exam_type'];
    passingPercentage = json['passing_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['exam_group_class_batch_exam_id'] = this.examGroupClassBatchExamId;
    data['student_id'] = this.studentId;
    data['student_session_id'] = this.studentSessionId;
    data['roll_no'] = this.rollNo;
    data['teacher_remark'] = this.teacherRemark;
    data['rank'] = this.rank;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['exam_group_id'] = this.examGroupId;
    data['exam'] = this.exam;
    data['date_from'] = this.dateFrom;
    data['date_to'] = this.dateTo;
    data['description'] = this.description;
    data['name'] = this.name;
    data['exam_type'] = this.examType;
    data['passing_percentage'] = this.passingPercentage;
    return data;
  }
}
