import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_flutter/providers/course_providers.dart';
import 'package:lms_flutter/screens/courses/courses_list.dart';

class Courses extends HookConsumerWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(coursesCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final value = ref.refresh(coursesCountProvider.future);
          ref.invalidate(coursesProvider);

          await value;
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              children: [
                const Text(
                  'List And Create Course Page',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                switch (count) {
                  AsyncData<int>(:final value) => CoursesList(
                      courseCount: value,
                    ),
                  AsyncError<int>(:final error) => Text('Error: $error'),
                  _ => const CircularProgressIndicator(),
                }
              ],
            ),
          ),
        ),
      ),
    );
  }
}
