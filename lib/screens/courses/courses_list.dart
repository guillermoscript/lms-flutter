import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_flutter/entities/course.dart';
import 'package:lms_flutter/providers/course_providers.dart';
import 'package:lms_flutter/screens/course_view/course_view.dart';

class CoursesList extends HookConsumerWidget {
  final int courseCount;
  const CoursesList({super.key, required this.courseCount});

  void onTapCourse(BuildContext context, int courseId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CourseView(courseId: courseId),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final response = ref.watch(coursesProvider(0));

    return switch (response) {
      AsyncData<List<Course>>(:final value) => ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(
            height: 12,
          ),
          itemCount: value.length,
          itemBuilder: (context, index) {
            final course = value[index];

            return Badge(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              backgroundColor: Colors.transparent,
              alignment: Alignment.topLeft,
              textColor: Theme.of(context).textTheme.bodySmall?.color,
              label: Text(
                course.status,
              ),
              child: ListTile(
                title: Text(
                  course.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
                onTap: () => onTapCourse(context, course.courseId),
              ),
            );
          },
        ),
      AsyncError<List<Course>>(:final error) => Center(
          child: Text(
            error.toString(),
          ),
        ),
      _ => const Center(
          child: CircularProgressIndicator(),
        )
    };
  }
}
