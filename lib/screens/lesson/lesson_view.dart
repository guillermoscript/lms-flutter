import 'package:flutter/material.dart';
import 'package:lms_flutter/entities/course.dart';
import 'package:lms_flutter/screens/lesson/lesson_video_player_builder.dart';
import 'package:markdown_widget/config/all.dart';

class LessonView extends StatelessWidget {
  final Lesson lesson;

  const LessonView({super.key, required this.lesson});

  Widget content(BuildContext context, Widget? player) {
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
              if (player != null) player,
              ...MarkdownGenerator().buildWidgets(lesson.content)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (lesson.videoUrl != null) {
      return LessonVideoPlayerBuilder(
        url: lesson.videoUrl!,
        builder: content,
      );
    }

    return content(context, null);
  }
}
