import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_flutter/entities/course.dart';
import 'package:lms_flutter/providers/course_providers.dart';
import 'package:lms_flutter/screens/course_view/lesson_list.dart';

class CourseDetails extends HookConsumerWidget {
  final int currentIndex;
  final Course course;

  const CourseDetails(
      {super.key, required this.course, required this.currentIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        final value = ref.refresh(courseProvider(course.courseId).future);

        await value;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
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
              currentIndex == 0
                  ? LessonList(lessons: course.lessons)
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
