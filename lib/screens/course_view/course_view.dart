import 'package:flutter/material.dart';
import 'package:lms_flutter/entities/course.dart';
import 'package:lms_flutter/screens/course_view/course_details.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseView extends StatelessWidget {
  final int courseId;
  late final PostgrestTransformBuilder<Map<String, dynamic>> courseFuture;

  CourseView({super.key, required this.courseId}) {
    courseFuture = Supabase.instance.client
        .from('courses')
        .select('*, lessons(*), exams(*)')
        .eq('course_id', courseId)
        .single();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course'),
      ),
      body: FutureBuilder(
        future: courseFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          final data = snapshot.data as Map<String, dynamic>;
          final course = Course.fromJson(data);

          return CourseDetails(course: course);
        },
      ),
    );
  }
}
