import 'package:flutter/material.dart';
import 'package:lms_flutter/entities/course.dart';
import 'package:lms_flutter/screens/course_view/lesson_list.dart';

class CourseDetails extends StatelessWidget {
  final Course course;

  const CourseDetails({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Text(
              course.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              course.description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            LessonList(lessons: course.lessons),
          ],
        ),
      ),
    );
  }
}
