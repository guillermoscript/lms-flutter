import 'package:flutter/material.dart';
import 'package:lms_flutter/screens/course_view/course_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CoursesList extends StatelessWidget {
  final coursesFuture = Supabase.instance.client.from('courses').select();

  CoursesList({super.key});

  void onTabCourse(BuildContext context, int courseId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CourseView(courseId: courseId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: coursesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final data = snapshot.data as List<dynamic>;

        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final course = data[index];

            return ListTile(
              title: Text(
                course['title'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                course['description'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
              onTap: () => onTabCourse(context, course['course_id']),
            );
          },
        );
      },
    );
  }
}
