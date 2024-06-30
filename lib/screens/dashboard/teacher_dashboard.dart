import 'package:flutter/material.dart';
import 'package:lms_flutter/screens/dashboard/courses_card.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CoursesCard(),
        ],
      ),
    );
  }
}
