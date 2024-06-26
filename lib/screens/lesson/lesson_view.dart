import 'package:flutter/material.dart';
import 'package:lms_flutter/entities/course.dart';
import 'package:lms_flutter/screens/lesson/lesson_video_player.dart';
import 'package:markdown_widget/config/all.dart';

class LessonView extends StatelessWidget {
  final Lesson lesson;

  const LessonView({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        child: Column(
          children: [
            Text(
              lesson.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            lesson.description != null
                ? Text(
                    lesson.description!,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  )
                : const SizedBox(),
            const SizedBox(height: 16),
            if (lesson.videoUrl != null)
              LessonVideoPlayer(
                url: lesson.videoUrl!,
              ),
            ...MarkdownGenerator().buildWidgets(lesson.content)
          ],
        ),
      )),
    );
  }
}
