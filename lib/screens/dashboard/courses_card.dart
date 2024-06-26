import 'package:flutter/material.dart';
import 'package:lms_flutter/screens/courses/courses.dart';

class CoursesCard extends StatelessWidget {
  const CoursesCard({super.key});

  void goToCourses(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Courses()));
  }

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: Column(
        children: [
          const ListTile(
            title: Text(
              'Courses',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20, // Increase the font size to make it bigger
              ),
            ),
            subtitle: Text('View and manage all your courses.'),
          ),
          // Courses link
          ListTile(
            leading: const Icon(Icons.grid_view_outlined, size: 30),
            title: const Text('Courses'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => goToCourses(context),
          ),
          // lesons
          const ListTile(
            leading: Icon(Icons.book_outlined, size: 30),
            title: Text('Lessons'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          // tests
          const ListTile(
            leading: Icon(Icons.assignment_outlined, size: 30),
            title: Text('Tests'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          // students
          const ListTile(
            leading: Icon(Icons.people_outline, size: 30),
            title: Text('Students'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
