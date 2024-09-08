class Course {
  final int courseId;
  final String title;
  final String description;
  final List<Lesson> lessons;
  final List<Exam> exams;
  final String status;

  Course({
    required this.courseId,
    required this.title,
    required this.description,
    required this.lessons,
    required this.exams,
    required this.status,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseId: json['course_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      lessons: json['lessons'] != null
          ? (json['lessons'] as List<dynamic>)
              .map((e) => Lesson.fromJson(e as Map<String, dynamic>))
              .toList()
          : List<Lesson>.empty(),
      exams: json['exams'] != null
          ? (json['exams'] as List<dynamic>)
              .map((e) => Exam.fromJson(e as Map<String, dynamic>))
              .toList()
          : List<Exam>.empty(),
    );
  }
}

class Lesson {
  final int lessonId;
  final String title;
  final String? description;
  final String content;
  final int sequence;
  final String? videoUrl;

  Lesson({
    required this.lessonId,
    required this.title,
    this.description,
    required this.content,
    required this.sequence,
    this.videoUrl,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      lessonId: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String?,
      content: json['content'] as String,
      sequence: json['sequence'] as int,
      videoUrl: json['video_url'] as String?,
    );
  }
}

class Exam {
  final int examId;
  final String title;
  final String description;

  Exam({
    required this.examId,
    required this.title,
    required this.description,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      examId: json['exam_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }
}
