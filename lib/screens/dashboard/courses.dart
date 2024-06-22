import 'package:flutter/material.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card.filled(
      child: Column(
        children: [
          ListTile(
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
            leading: Icon(Icons.grid_view_outlined, size: 30),
            title: Text('Courses'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          // lesons
          ListTile(
            leading: Icon(Icons.book_outlined, size: 30),
            title: Text('Lessons'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          // tests
          ListTile(
            leading: Icon(Icons.assignment_outlined, size: 30),
            title: Text('Tests'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          // students
          ListTile(
            leading: Icon(Icons.people_outline, size: 30),
            title: Text('Students'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
