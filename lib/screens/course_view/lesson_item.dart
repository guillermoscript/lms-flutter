import 'package:flutter/material.dart';
import 'package:lms_flutter/entities/course.dart';
import 'package:lms_flutter/screens/lesson/lesson_view.dart';

class LessonItem extends StatelessWidget {
  final Lesson lesson;

  const LessonItem({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    onTap() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LessonView(
            lesson: lesson,
          ),
        ),
      );
    }

    return Card.outlined(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: theme.colorScheme.onSurface.withOpacity(0.5),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          lesson.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: lesson.description != null ? Text(lesson.description!) : null,
      ),
    );
  }
}
