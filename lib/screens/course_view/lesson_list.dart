import 'package:flutter/material.dart';
import 'package:lms_flutter/entities/course.dart';
import 'package:lms_flutter/screens/course_view/lesson_item.dart';

class LessonList extends StatelessWidget {
  final List<Lesson> lessons;

  const LessonList({super.key, required this.lessons});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: lessons.length,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final lesson = lessons[index];
        return LessonItem(
          lesson: lesson,
        );
      },
    );
  }
}
