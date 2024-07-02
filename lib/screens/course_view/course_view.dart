import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_flutter/entities/course.dart';
import 'package:lms_flutter/providers/course_providers.dart';
import 'package:lms_flutter/screens/course_view/course_details.dart';

class CourseView extends HookConsumerWidget {
  final int courseId;

  const CourseView({super.key, required this.courseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);

    final course = ref.watch(courseProvider(courseId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course'),
      ),
      body: switch (course) {
        AsyncData<Course>(:final value) => CourseDetails(
            course: value,
            currentIndex: selectedIndex.value,
          ),
        AsyncError(:final error) => Text('Error: $error'),
        _ => const Center(child: CircularProgressIndicator()),
      },
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex.value,
        onTap: (index) {
          selectedIndex.value = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.class_),
            label: 'Lessons',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_document),
            label: 'Tests',
          ),
        ],
      ),
    );
  }
}
